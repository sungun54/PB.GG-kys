package com.PB.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PB.dto.Article;
import com.PB.dto.Board;
import com.PB.dto.Member;
import com.PB.dto.ResultData;
import com.PB.service.ArticleService;
import com.PB.util.Util;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/usr/article/{boardCode}-write")
	public String showWrite(@PathVariable("boardCode") String boardCode, String listUrl, Model model) {
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}
		model.addAttribute("listUrl", listUrl);
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		return "article/write";
	}

	@RequestMapping("/usr/article/{boardCode}-list")
	public String showList(@PathVariable("boardCode") String boardCode, Model model) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		List<Article> articles = articleService.getForPrintArticles();

		model.addAttribute("articles", articles);

		return "article/list";
	}

	@RequestMapping("/usr/article/{boardCode}-detail")
	public String showDetail(@PathVariable("boardCode") String boardCode, String listUrl, Model model,
			@RequestParam Map<String, Object> param, HttpServletRequest req) {
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}
		Board board = articleService.getBoardByCode(boardCode);

		model.addAttribute("board", board);

		int id = Integer.parseInt((String) param.get("id"));

		articleService.hitUp(id);

		Member loginedMember = (Member) req.getAttribute("loginedMember");

		Article article = articleService.getForPrintArticleById(id, loginedMember);

		model.addAttribute("article", article);
		model.addAttribute("listUrl", listUrl);

		return "article/detail";
	}

	@RequestMapping("/usr/article/{boardCode}-modify")
	public String showModify(@PathVariable("boardCode") String boardCode, String listUrl, Model model,
			@RequestParam Map<String, Object> param, HttpServletRequest req) {
		model.addAttribute("listUrl", listUrl);

		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		int id = Integer.parseInt((String) param.get("id"));

		Member loginedMember = (Member) req.getAttribute("loginedMember");
		Article article = articleService.getForPrintArticleById(id, loginedMember);

		model.addAttribute("article", article);

		return "article/modify";
	}

	@RequestMapping("/usr/article/{boardCode}-doWrite")
	public String doWrite(@PathVariable("boardCode") String boardCode, Model model,
			@RequestParam Map<String, Object> param, HttpServletRequest req) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		Map<String, Object> newParam = Util.getNewMapOf(param, "title", "body");
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		newParam.put("boardId", board.getId());
		newParam.put("memberId", loginedMemberId);
		int newArticleId = articleService.write(newParam);

		String redirectUri = (String) param.get("redirectUri");
		redirectUri = redirectUri.replace("#id", newArticleId + "");

		return "redirect:" + redirectUri;
	}

	@RequestMapping("/usr/article/{boardCode}-doModify")
	public String doModify(@PathVariable("boardCode") String boardCode, int id, Model model,
			@RequestParam Map<String, Object> param, HttpServletRequest req) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		Map<String, Object> newParam = Util.getNewMapOf(param, "title", "body", "articleId", "id");
		Member loginedMember = (Member) req.getAttribute("loginedMember");

		ResultData checkActorCanModifyResultData = articleService.checkActorCanModify(loginedMember, id);

		if (checkActorCanModifyResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("msg", checkActorCanModifyResultData.getMsg());

			return "common/redirect";
		}

		articleService.modify(newParam);

		String redirectUri = (String) param.get("redirectUri");

		return "redirect:" + redirectUri;
	}

	@RequestMapping("/usr/article/{boardCode}-doDelete")
	public String doDelete(@PathVariable("boardCode") String boardCode, int id, Model model,
			@RequestParam Map<String, Object> param, HttpServletRequest req) {

		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);

		Member loginedMember = (Member) req.getAttribute("loginedMember");

		ResultData checkActorCanDeleteResultData = articleService.checkActorCanModify(loginedMember, id);

		if (checkActorCanDeleteResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("msg", checkActorCanDeleteResultData.getMsg());

			return "common/redirect";
		}

		articleService.delete(id);

		String redirectUri = boardCode + "-list";
		return "redirect:" + redirectUri;
	}
}