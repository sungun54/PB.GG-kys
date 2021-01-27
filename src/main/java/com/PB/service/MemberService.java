package com.PB.service;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.PB.dao.MemberDao;
import com.PB.dto.Member;
import com.PB.dto.ResultData;
import com.PB.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Autowired
	private AttrService attrService;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;
	
	public Member getMemberByLoginId(String id) {
		return memberDao.getMemberById(id);
	}
	
	public ResultData checkLoginIdJoinable(String loginId) {
		int count = memberDao.getLoginIdDupCount(loginId);

		if (count == 0) {
			return new ResultData("S-1", "가입가능한 로그인 아이디 입니다.", "loginId", loginId);
		}

		return new ResultData("F-1", "이미 사용중인 로그인 아이디 입니다.", "loginId", loginId);
	}

	public ResultData checkNicknameJoinable(String nickname) {
		int count = memberDao.getNicknameDupCount(nickname);
		
		if (count == 0) {
			return new ResultData("S-1", "사용가능한 닉네임 입니다.", "nickname", nickname);
		}
		return new ResultData("F-1", "이미 사용중인 닉네임 입니다.", "nickname", nickname);
	}
	
	public ResultData checkEmailJoinable(String email) {
		int count = memberDao.getEmailDupCount(email);

		if (count == 0) {
			return new ResultData("S-1", "사용가능한 이메일 입니다.", "email", email);
		}

		return new ResultData("F-1", "이미 사용중인 이메일 입니다.", "email", email);
	}
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}


	public int join(Map<String, Object> param) {
		memberDao.join(param);
		int memberId = Util.getAsInt(param.get("id"));
		
		String key = getKey(false, 20);
		attrService.setValue("member__" + memberId + "__extra__authCode", key);
		
		sendJoinCompleteMail((String) param.get("email"), key, memberId);
		
		return memberId;
	}
	
	private void sendJoinCompleteMail(String email, String key, int id) {
		String mailTitle = String.format("[%s] 가입 인증 메일입니다.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>가입이 완료되었습니다.</h1>");
		mailBodySb.append("<a href='http://https://service1.woh.kr/usr/member/doMailAuth?id=" + id + "&key=" + key + "&email="
				+ email + "'>인증하기</a>");

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	
	public Member getMemberById(int id) {
		return memberDao.getMemberByLoginId(id);
	}

	public Member getMemberByNameAndEmail(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}
	
	public String getAuthCodeOnDB(int loginedMemberId) {
		return attrService.getValue("member__" + loginedMemberId + "__extra__authCode");
	}
	
	public void setAuthCodeOnDB(int loginedMemberId, String email) {
		attrService.setValue("member__" + loginedMemberId + "__extra__emailAuthed", email);
	}


	public boolean isValidModifyPrivateAuthCode(int loginedMemberId, String authCode) {
		String authCodeOnDB = getAuthCodeOnDB(loginedMemberId);
		
		return authCodeOnDB.equals(authCode);
	}

	public void modify(int loginedMemberId, String loginPw) {
		memberDao.modify(loginedMemberId, loginPw);
		
		attrService.remove("member", loginedMemberId, "extra", "useTempPassword");
		
	}

	public void notifyTempLoginPw(Member member) {
		String to = member.getEmail();
		String tempPasswordOrigin = Util.getTempPassword(6);
		String tempPassword = Util.sha256(tempPasswordOrigin);
		
		modify(member.getId(), tempPassword);
		attrService.setValue("member", member.getId(), "extra", "useTempPassword", "1");
		
		String title = String.format("[%s] 임시패스워드 발송", siteName);
		String body = String.format("<div>임시 패스워드 : %s</div>\n", tempPasswordOrigin);
		mailService.send(to, title, body);
	}

	public void unsubscribe(int loginedMemberId) {
		memberDao.unsubscribe(loginedMemberId);
	}

	public boolean isNeedToChangePasswordForTemp(Member member) {
		if(attrService.getValue("member", member.getId(), "extra", "useTempPassword") == null) {
			return false;
		}
		
		return attrService.getValue("member", member.getId(), "extra", "useTempPassword").equals("1");
	}

	public boolean isNeedToChangePasswordForOld(Member member) {
		return memberDao.isNeedToChangePasswordForOld(member.getId());
	}

	
}
