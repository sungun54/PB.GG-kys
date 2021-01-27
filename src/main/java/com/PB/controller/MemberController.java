package com.PB.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.PB.dto.Member;
import com.PB.dto.ResultData;
import com.PB.service.MemberService;
import com.PB.util.Util;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/join")
	public String showWrite() {
		return "member/join";
	}

	@RequestMapping("/usr/member/doJoin")
	public String doWrite(@RequestParam Map<String, Object> param, Model model) {
		Util.changeMapKey(param, "loginPwReal", "loginPw");
		ResultData checkLoginIdJoinableResultData = memberService
				.checkLoginIdJoinable(Util.getAsStr(param.get("loginId")));

		if (checkLoginIdJoinableResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkLoginIdJoinableResultData.getMsg());
			return "common/redirect";
		}

		ResultData checkNicknameJoinableResultData = memberService
				.checkNicknameJoinable(Util.getAsStr(param.get("nickname")));

		if (checkNicknameJoinableResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkNicknameJoinableResultData.getMsg());
			return "common/redirect";
		}

		ResultData checkEmailJoinableResultData = memberService.checkEmailJoinable(Util.getAsStr(param.get("email")));

		if (checkEmailJoinableResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkEmailJoinableResultData.getMsg());
			return "common/redirect";
		}

		int id = memberService.join(param);

		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%d번 회원으로 회원가입 되었습니다. 인증번호 확인이 필요합니다.", id));

		return "common/redirect";
	}

	@RequestMapping("/usr/member/doMailAuth")
	private String actionDoMailAuth(int id, String key, String email, HttpServletRequest req) {

		String value = memberService.getAuthCodeOnDB(id);

		if (!value.equals(key)) {
			return "html:<script> alert('인증이 실패했습니다.');location.replace('../home/main'); </script>";
		}

		memberService.setAuthCodeOnDB(id, email);

		req.setAttribute("alertMsg", "인증이 완료되었습니다.");
		req.setAttribute("redirectUri", "../member/login");

		return "common/redirect";
	}

	@RequestMapping("/usr/member/loginIdDup")
	@ResponseBody
	private ResultData loginIdDup(String loginId) {
		ResultData isJoinableLoginId = memberService.checkLoginIdJoinable(loginId);

		return isJoinableLoginId;
	}

	@RequestMapping("/usr/member/nicknameDup")
	@ResponseBody
	private ResultData nicknameDup(String nickname) {

		ResultData checkEmailJoinable = memberService.checkNicknameJoinable(nickname);

		return checkEmailJoinable;
	}

	@RequestMapping("/usr/member/emailDup")
	@ResponseBody
	private ResultData emailDup(String email) {

		ResultData checkNicknameJoinable = memberService.checkEmailJoinable(email);

		return checkNicknameJoinable;
	}

	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	public String doLogin(String loginId, String loginPwReal, String redirectUri, Model model, HttpSession session) {
		String loginPw = loginPwReal;

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "존재하지 않는 회원입니다.");
			return "common/redirect";
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}

		if (member.isDelStatus() == true) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "이미 탈퇴한 계정입니다.");
			return "common/redirect";
		}

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/usr/home/main";
		}

		session.setAttribute("loginedMemberId", member.getId());

		boolean isNeedToChangePasswordForTemp = memberService.isNeedToChangePasswordForTemp(member);

		boolean isNeedToChangePasswordForOld = memberService.isNeedToChangePasswordForOld(member);

		if (isNeedToChangePasswordForTemp) {
			model.addAttribute("redirectUri", redirectUri);
			model.addAttribute("alertMsg", "현재 임시 비밀번호를 사용 중 입니다.");

			return "common/redirect";
		}

		if (isNeedToChangePasswordForOld) {
			model.addAttribute("redirectUri", redirectUri);
			model.addAttribute("alertMsg", "오래된 비밀번호입니다. 비밀번호를 변경해주세요.");

			return "common/redirect";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s님 반갑습니다.", member.getNickname()));

		return "common/redirect";
	}

	@RequestMapping("/usr/member/doLogout")
	public String doLogout(HttpSession session, Model model, String redirectUri) {
		session.removeAttribute("loginedMemberId");

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/usr/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		return "common/redirect";
	}

	@RequestMapping("/usr/member/account")
	public String showAccount() {
		return "member/account";
	}

	@RequestMapping("/usr/member/passwordForPrivate")
	public String showPasswordForPrivate() {
		return "member/passwordForPrivate";
	}

	@RequestMapping("/usr/member/doPasswordForPrivate")
	public String doDoPasswordForPrivate(HttpServletRequest req, Model model, String redirectUri) {

		String loginPw = req.getParameter("loginPwReal");

		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();

		if (loginedMember.getLoginPw().equals(loginPw) == false) {
			req.setAttribute("historyBack", true);

			return "common/redirect";
		}

		String authCode = memberService.getAuthCodeOnDB(loginedMemberId);
		redirectUri = "/usr/member/modifyPrivate";

		model.addAttribute("redirectUri", redirectUri + "?authCode=" + authCode);

		return "common/redirect";
	}

	@RequestMapping("/usr/member/modifyPrivate")
	public String showModifyPrivate(HttpServletRequest req, Model model,
			@RequestParam(value = "authCode", required = false, defaultValue = "0") String authCode) {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		if (memberService.isValidModifyPrivateAuthCode(loginedMemberId, authCode) == false) {
			req.setAttribute("alertMsg", "비밀번호를 다시 체크해주세요.");
			model.addAttribute("redirectUri", "/usr/member/passwordForPrivate");

			return "common/redirect";
		}
		return "member/modifyPrivate";
	}

	@RequestMapping("/usr/member/doModifyPrivate")
	public String doModifyPrivate(HttpServletRequest req, Model model, String redirectUri) {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		String authCode = req.getParameter("authCode");

		if (memberService.isValidModifyPrivateAuthCode(loginedMemberId, authCode) == false) {
			req.setAttribute("alertMsg", "비밀번호를 다시 체크해주세요.");
			req.setAttribute("historyBack", true);

			return "common/redirect";
		}

		String loginPw = req.getParameter("loginPwReal");

		memberService.modify(loginedMemberId, loginPw);
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		loginedMember.setLoginPw(loginPw);

		req.setAttribute("alertMsg", "개인정보가 수정되었습니다.");
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("/usr/member/findLoginId")
	public String showFindLoginId() {
		return "member/findLoginId";
	}

	@RequestMapping("/usr/member/doFindLoginId")
	public String doFindLoginId(HttpServletRequest req, Model model, String redirectUri) {
		String name = Util.getString(req, "name");
		String email = Util.getString(req, "email");

		Member member = memberService.getMemberByNameAndEmail(name, email);
		model.addAttribute("redirectUri", redirectUri);

		if (member == null) {
			req.setAttribute("alertMsg", "일치하는 회원이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		req.setAttribute("alertMsg", "일치하는 회원을 찾았습니다.\\n아이디 : " + member.getLoginId());
		req.setAttribute("historyBack", true);

		return "common/redirect";
	}

	@RequestMapping("/usr/member/findLoginPw")
	public String showFindLoginPw() {
		return "member/findLoginPw";
	}

	@RequestMapping("/usr/member/doFindLoginPw")
	public String doFindLoginPw(HttpServletRequest req, Model model, String redirectUri) {
		String loginId = Util.getString(req, "loginId");
		String email = Util.getString(req, "email");

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null || member.getEmail().equals(email) == false) {
			req.setAttribute("alertMsg", "일치하는 회원이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		memberService.notifyTempLoginPw(member);

		req.setAttribute("alertMsg", "메일로 임시패스워드가 발송되었습니다.");
		req.setAttribute("redirectUri", "../member/login");

		return "common/redirect";
	}

	@RequestMapping("/usr/member/unsubscribe")
	public String showunsubscribe() {
		return "member/unsubscribe";
	}

	@RequestMapping("/usr/member/doUnsubscribe")
	public String dodoUnsubscribe(HttpServletRequest req, Model model, String redirectUri, HttpSession session) {

		String loginPw = req.getParameter("loginPwReal");

		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();

		if (loginedMember.getLoginPw().equals(loginPw) == false) {
			req.setAttribute("historyBack", true);

			return "common/redirect";
		}

		session.removeAttribute("loginedMemberId");

		memberService.unsubscribe(loginedMemberId);
		req.setAttribute("alertMsg", "계정 삭제가 완료되었습니다.");
		req.setAttribute("redirectUri", "../home/main");

		return "common/redirect";
	}
}
