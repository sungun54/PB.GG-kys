<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<!-- 메인 CSS -->
<link rel="stylesheet" href="/resource/home/main.css" />
<!-- 메인 JS -->
<script src="/resource/home/main.js"></script>

<div class="l-container">
	<div class="index-logo">
		<div id="logo">
			<img src="/img/logo/timo.jpg" title="Search User(SU)" alt="로고 이미지"
				class="Image">
		</div>
	</div>
	<form class="summoner-search-form" action="/summoner"
		autocomplete="off">
		<input type="text" name="userName"
			class="summoner-search-form__text _suggest" placeholder="소환사명"
			autocomplete="off">
		<button type="submit" class="btn btn-primary">검색</button>
	</form>

	<div style="outline:1px solid #Asd; margin-top: 150px;">
		<div style="position: relative; width: 1080px; margin: 0 auto 0 0;">
			<div class="lotaion-news">- 금주의 로테이션 챔피언</div>
			<c:forEach items="${championInfo.freeChampionIdsStr}"
				var="championIdStr">
				<div class="freeChampionList">
					<img
						src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${championIdStr}.png"
						alt="" />
				</div>
			</c:forEach>
		</div>
	</div>
</div>





<!-- 
<div class="1-container">
	<div class="con search-box">
		<form class="summoner-search-form" action="/usr/summoner/userName">
			<input type="text" name="userName"
				class="summoner-search-form__text _suggest"
				placeholder="소환사명, 소환사명, ..." autocomplete="off">
			<button type="submit" class="summoner-search-form__button">
				<i class="__spSite __spSite-42"></i>
			</button>
			<button type="button" class="summoner-search-form__setting"
				onclick="$.OP.GG.layout.regionLanguage.open();">
				<span>KR</span> <i class="__spSite __spSite-138"></i>
			</button>
		</form>
	</div>
</div>

<div class="con" style="margin-top: 50px;">
	<h1>알파테스트 기간입니다.(v0.01)</h1>
	<a class="btn btn-list" href="/usr/test/matches">- 새로운 방식</a> <a
		class="btn btn-list" href="/usr/test/summonerFinal">- 그냥</a> <a
		class="btn btn-list" href="/usr/test/domesticProTeam/list">- 프로 팀
		명단</a>


	<div class="list">
		<h2>기능 리스트</h2>
		<ul>
			회원
			<li><a class="btn btn-list"
				href="/usr/test/domesticProTeam/list">- 프로 팀 명단</a></li>
			<li><a class="btn btn-list" href="../member/join">- 회원가입</a></li>
			<li><a class="btn btn-list" href="#">- 회원가입 > 가입시 감사메일 발송</a></li>
			<li><a class="btn btn-list" href="../member/login">- 로그인</a></li>
			<li><a class="btn btn-list" href="#">- 로그인 > 임시패스워드 사용 중 일때
					경고창</a></li>
			<li><a class="btn btn-list" href="#">- 로그인 > 패스워드 변경 후 3개월이상
					지날 때 경고창</a></li>
			<li><a class="btn btn-list" href="/usr/member/doLogout">-
					로그아웃</a></li>
			<li><a class="btn btn-list" href="../member/account">- 개인 계정
					접속</a></li>
			<li><a class="btn btn-list" href="../member/modifyPrivate">-
					비밀번호 재설정</a></li>
			<li><a class="btn btn-list" href="/usr/member/findLoginId">-
					아이디 찾기</a></li>
			<li><a class="btn btn-list" href="/usr/member/findLoginPw">-
					비밀번호 찾기</a></li>
			<li><a class="btn btn-list" href="../member/unsubscribe">-
					회원 탈퇴</a></li>
		</ul>

		<ul>
			게시물
			<li><a class="btn btn-list" href="../article/notice-list">-
					공지사항 게시판</a></li>
			<li><a class="btn btn-list" href="../article/free-list">- 자유
					게시판 게시판</a></li>
			<li><a class="btn btn-list" href="#">- 게시물 작성</a></li>
			<li><a class="btn btn-list" href="#">- 게시물 수정</a></li>
			<li><a class="btn btn-list" href="#">- 게시물 삭제</a></li>
		</ul>

		<ul>
			댓글
			<li><a class="btn btn-list" href="#">- 댓글 작성</a></li>
			<li><a class="btn btn-list" href="#">- 댓글 수정</a></li>
			<li><a class="btn btn-list" href="#">- 댓글 삭제</a></li>
		</ul>
	</div>
</div>
 -->
<style>
.con>ul>li {
	margin-top: 5px;
}
</style>

<%@ include file="../part/foot.jspf"%>