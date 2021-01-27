<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<div class="l-menu2">
  <ul class="menu">
    <li class="menu__item menu__item--active">
      <a href="/"> HOME</a>
    </li>
    <li class="menu__item">
      <a href="#"> 챔피언 분석 </a>
    </li>
    <li class="menu__item">
      <a href="#"> 랭킹 </a>
    </li>
    <li class="menu__item">
      <a href="#"> 멀티서치 </a>
    </li>
    <li class="menu__item">
      <a href="/usr/member/login"> 커뮤니티 </a>
    </li>
    <li class="gnb-list-item gnb-list-item__search" style="margin-left: auto;">
      <form action="/summoner/" method="get" autocomplete="off">
        <input type="text" class="gnb-list-item__input _suggest" name="userName" placeholder="소환사명, 소환사명, ..." autocomplete="off">
        <button type="submit" class="btn btn-primary">검색</button>
        <div class="autocomplete-suggestions" style="position: absolute; display: none; width: 100%; max-height: 1000px; z-index: 9999; top: 36px;"></div>
      </form>
    </li>
    <li class="menu__item">
      <a href="/usr/member/login" class="login">로그인</a>
    </li>
  </ul>
</div>

<!-- 소환사 CSS -->
<link rel="stylesheet" href="/resource/lol/summoner/summoner.css" />

<!-- 소환사 JS -->
<script src="/resource/lol/summoner/summoner.js"></script>

<script>
  function button1_click(el) {
    $(el).closest('.game-List').next().toggleClass('active');
  }
</script>


<div class="main con">
  <h1>존재하지 않는 소환사입니다..</h1>
</div>

<%@ include file="../part/foot.jspf"%>