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
      <span>
      	<a href="/usr/member/login" class="login">로그인</a>
      </span>
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
  <div class="profile">
    <div class="profile-imgBox">
      <img src="http://ddragon.leagueoflegends.com/cdn/10.19.1/img/profileicon/${summoner.profileIconId}.png" alt="" />
    </div>

    <div>
      <div class="summonerName">${summoner.name}</div>
      <div class="summonerLevel">레벨 : ${summoner.summonerLevel}</div>
    </div>
  </div>

  <div class="tier-box">
    <div class="flex-rank">
      <c:if test="${summoner.flexRank != null}">
        <div class="img-box">
          <c:if test="${summoner.flexRank.tier eq 'CHALLENGER'}">
            <img src="/img/tier/챌린저.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'GRANDMASTER'}">
            <img src="/img/tier/그마.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'MASTER'}">
            <img src="/img/tier/마스터.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'DIAMOND'}">
            <img src="/img/tier/다이아.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'PLATINUM'}">
            <img src="/img/tier/플레.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'GOLD'}">
            <img src="/img/tier/골드.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'SILVER'}">
            <img src="/img/tier/실버.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'BRONZE'}">
            <img src="/img/tier/브론즈.png" alt="" />
          </c:if>
          <c:if test="${summoner.flexRank.tier eq 'IRON'}">
            <img src="/img/tier/아이언.png" alt="" />
          </c:if>
        </div>
        <div>리그 : 솔로랭크 5x5</div>
        <div>등급 : ${summoner.flexRank.tier} ${summoner.flexRank.rank}</div>
        <div>리그 포인트 : ${summoner.flexRank.leaguePoints}</div>
        <div>전적 : ${summoner.flexRank.total}전 ${summoner.flexRank.wins}승 ${summoner.flexRank.losses}패 (${summoner.flexRank.odds}%)</div>
      </c:if>
      <c:if test="${summoner.flexRank == null}">
        <div class="img-box">
          <img src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-static-assets/global/default/images/ranked_crest_placeholder.png" alt="" />
        </div>
        <div>리그 : 솔로랭크 5x5</div>
        <div>등급 : 배치</div>
        <div>전적 : 0전 0승 0패 (0.0%)</div>
      </c:if>
    </div>
    <div class="solo-rank">
      <c:if test="${summoner.soloRank != null}">
        <div class="img-box">
          <c:if test="${summoner.soloRank.tier eq 'CHALLENGER'}">
            <img src="/img/tier/챌린저.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'GRANDMASTER'}">
            <img src="/img/tier/그마.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'MASTER'}">
            <img src="/img/tier/마스터.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'DIAMOND'}">
            <img src="/img/tier/다이아.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'PLATINUM'}">
            <img src="/img/tier/플레.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'GOLD'}">
            <img src="/img/tier/골드.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'SILVER'}">
            <img src="/img/tier/실버.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'BRONZE'}">
            <img src="/img/tier/브론즈.png" alt="" />
          </c:if>
          <c:if test="${summoner.soloRank.tier eq 'IRON'}">
            <img src="/img/tier/아이언.png" alt="" />
          </c:if>
        </div>
        <div>리그 : 자유랭크 5x5</div>
        <div>등급 : ${summoner.soloRank.tier} ${summoner.soloRank.rank}</div>
        <div>리그 포인트 : ${summoner.soloRank.leaguePoints}</div>
        <div>전적 : ${summoner.soloRank.total}전 ${summoner.soloRank.wins}승 ${summoner.soloRank.losses}패 (${summoner.soloRank.odds}%)</div>
      </c:if>
      <c:if test="${summoner.soloRank == null}">
        <div class="img-box">
          <img src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-static-assets/global/default/images/ranked_crest_placeholder.png" alt="" />
        </div>
        <div>리그 : 자유랭크 5x5</div>
        <div>등급 : 배치</div>
        <div>전적 : 0전 0승 0패 (0.0%)</div>
      </c:if>
    </div>
  </div>

  <c:forEach items="${matchReferences}" var="matchReference">
    <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant">
      <c:if test="${matchReference.champion == participant.championId}">
        <div class="game-List ${participant.stats.win == false ? 'lose' : 'win'}">
      </c:if>
    </c:forEach>

    <div class="first-box">
      <div class="box">
        <div>${matchReference.lolApiMatch.gameTypeKR}</div>

        <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant">
          <c:if test="${matchReference.champion == participant.championId}">
            <div>
              <c:if test="${participant.stats.win == true}">승리</c:if>
              <c:if test="${participant.stats.win == false}">패배</c:if>
            </div>
          </c:if>
        </c:forEach>
      </div>
    </div>
    <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant">
      <c:if test="${matchReference.champion == participant.championId}">
        <div class="second-box">
          <div class="box">
            <div class="img-box">
              <div>
                <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participant.lolApiChampion.championId}.png" alt="" />
              </div>

              <div>${participant.lolApiChampion.name}</div>
            </div>
          </div>
        </div>


        <div class="third-box">
          <div>
            <div class="img-box">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell1.spellId}.png" alt="" />
              <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell2.spellId}.png" alt="" />
            </div>
            <div class="img-box">
              <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.mainRune.slotsRunesIcon}" alt="" />
              <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.subRune.icon}" alt="" />
            </div>
          </div>
        </div>

        <div class="fourth-box">
          <div>
            <div>${participant.stats.kills}/${participant.stats.deaths}/${participant.stats.assists}</div>
            <div>${participant.stats.ratioRs}</div>
            <div>
              <c:choose>
                <c:when test="${participant.stats.pentaKills != 0}">펜타킬</c:when>
                <c:when test="${participant.stats.quadraKills != 0}">쿼드라킬</c:when>
                <c:when test="${participant.stats.tripleKills != 0}">트리플킬</c:when>
                <c:when test="${participant.stats.doubleKills != 0}">더블킬</c:when>
              </c:choose>
            </div>
          </div>
        </div>

        <div class="fifth-box">
          <div>
            <div>레벨 : ${participant.stats.champLevel}</div>
            <div>CS : ${participant.stats.cs}(${participant.stats.minuteCs})</div>
            <div>
              킬 관여 :
              <c:if test="${participant.teamId == 100}">${participant.stats.team100InvolvementRate}</c:if>
              <c:if test="${participant.teamId == 200}">${participant.stats.team200InvolvementRate}</c:if>
              %
            </div>
          </div>
        </div>

        <div class="seventh-box">
          <div>
            <c:if test="${participant.stats.lolApiItem0 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem0 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem0.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem1 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem1 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem1.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem2 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem2 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem2.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem6 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem6 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem6.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem3 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem3 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem3.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem4 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem4 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem4.key}.png" alt="" />
            </c:if>
            <c:if test="${participant.stats.lolApiItem5 == null}">
              <span>
                <div></div>
              </span>
            </c:if>
            <c:if test="${participant.stats.lolApiItem5 != null}">
              <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem5.key}.png" alt="" />
            </c:if>
            <span>
              <div style="opacity: 0;"></div>
            </span>
          </div>
        </div>
      </c:if>
    </c:forEach>

    <div class="eighth-box">
      <div class="team1">
        <c:forEach items="${matchReference.lolApiMatch.participantIdentities}" var="participantIdentity" begin="0" end="4">
          <div class="box">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participantIdentity.championId}.png" alt="" />
            <span>${participantIdentity.player.summonerName}</span>
          </div>
        </c:forEach>
      </div>
      <div class="team2">
        <c:forEach items="${matchReference.lolApiMatch.participantIdentities}" var="participantIdentity" begin="5" end="9">
          <div class="box">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participantIdentity.championId}.png" alt="" />
            <span>${participantIdentity.player.summonerName}</span>
          </div>
        </c:forEach>
      </div>
    </div>

    <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant">
      <c:if test="${matchReference.champion == participant.championId}">
        <div class="sixth-box">
          <div>
            <div>${matchReference.lolApiMatch.passedTime}</div>
          </div>
        </div>

        <div class="ninth-box">
          <div>
            <div>제어 와드 : ${participant.stats.visionWardsBoughtInGame}</div>
            <div>와드 설치 : ${participant.stats.wardsPlaced}</div>
            <div>와드 파괴 : ${participant.stats.wardsKilled}</div>
          </div>
        </div>
      </c:if>
    </c:forEach>
    <button onclick="button1_click(this);">열기</button>
</div>


<div class="game-detail">
  <div class="title-box blue">
    <span>
      <c:if test="${matchReference.lolApiMatch.teams.get(0).win eq 'Win'}">승리</c:if>
      <c:if test="${matchReference.lolApiMatch.teams.get(0).win eq 'Fail'}">패배</c:if>
      (블루팀)
    </span>
    <span>티어</span>
    <span>KDA</span>
    <span>피해량</span>
    <span>와드</span>
    <span>CS</span>
    <span>아이템</span>
  </div>

  <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant" begin="0" end="4">
    <div class="detail blue">
      <div class="first-box champion img-box">
        <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participant.lolApiChampion.championId}.png" alt="" />
      </div>
      <div class="second-box">
        <span class="spell img-box">
          <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell1.spellId}.png" alt="" />
          <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell2.spellId}.png" alt="" />
        </span>
        <span class="rune img-box">
          <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.mainRune.slotsRunesIcon}" alt="" />
          <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.subRune.icon}" alt="" />
        </span>
      </div>

      <div>${participant.summonerName}</div>
      <div>${participant.flexRank.tier}</div>

      <div>
        <div>${participant.stats.kills}/${participant.stats.deaths}/${participant.stats.assists}</div>
        <div>${participant.stats.ratioRs}
          <c:if test="${participant.teamId == 100}">(${participant.stats.team100InvolvementRate}%)</c:if>
          <c:if test="${participant.teamId == 200}">(${participant.stats.team200InvolvementRate}%)</c:if>
        </div>
      </div>

      <div>${participant.stats.totalDamageDealtToChampions}</div>

      <div>
        <div>${participant.stats.visionWardsBoughtInGame}</div>
        <div>${participant.stats.wardsPlaced}/${participant.stats.wardsKilled}</div>
      </div>
      <div>
        <div>${participant.stats.cs}</div>
        <div>분당 ${participant.stats.minuteCs}</div>
      </div>

      <div class="item img-box">
        <span>
          <c:if test="${participant.stats.lolApiItem0 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem0 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem0.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem1 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem1 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem1.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem2 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem2 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem2.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem3 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem3 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem3.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem4 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem4 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem4.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem5 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem5 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem5.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem6 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem6 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem6.key}.png" alt="" />
          </c:if>
        </span>
      </div>
    </div>
  </c:forEach>

  <div class="title-box red">
    <span>
      <c:if test="${matchReference.lolApiMatch.teams.get(1).win eq 'Win'}">승리</c:if>
      <c:if test="${matchReference.lolApiMatch.teams.get(1).win eq 'Fail'}">패배</c:if>
      (레드팀)
    </span>
    <span>티어</span>
    <span>KDA</span>
    <span>피해량</span>
    <span>와드</span>
    <span>CS</span>
    <span>아이템</span>
  </div>

  <c:forEach items="${matchReference.lolApiMatch.participants}" var="participant" begin="5" end="9">
    <div class="detail red">
      <div class="first-box champion img-box">
        <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participant.lolApiChampion.championId}.png" alt="" />
      </div>
      <div class="second-box">
        <span class="spell img-box">
          <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell1.spellId}.png" alt="" />
          <img src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell2.spellId}.png" alt="" />
        </span>
        <span class="rune img-box">
          <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.mainRune.slotsRunesIcon}" alt="" />
          <img src="https://ddragon.leagueoflegends.com/cdn/img/${participant.subRune.icon}" alt="" />
        </span>
      </div>

      <div>${participant.summonerName}</div>
      <div>${participant.flexRank.tier}</div>

      <div>
        <div>${participant.stats.kills}/${participant.stats.deaths}/${participant.stats.assists}</div>
        <div>${participant.stats.ratioRs}
          <c:if test="${participant.teamId == 100}">(${participant.stats.team100InvolvementRate}%)</c:if>
          <c:if test="${participant.teamId == 200}">(${participant.stats.team200InvolvementRate}%)</c:if>
        </div>
      </div>

      <div>${participant.stats.totalDamageDealtToChampions}</div>

      <div>
        <div>${participant.stats.visionWardsBoughtInGame}</div>
        <div>${participant.stats.wardsPlaced}/${participant.stats.wardsKilled}</div>
      </div>
      <div>
        <div>${participant.stats.cs}</div>
        <div>분당 ${participant.stats.minuteCs}</div>
      </div>

      <div class="item img-box">
        <span>
          <c:if test="${participant.stats.lolApiItem0 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem0 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem0.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem1 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem1 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem1.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem2 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem2 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem2.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem3 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem3 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem3.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem4 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem4 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem4.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem5 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem5 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem5.key}.png" alt="" />
          </c:if>
        </span>
        <span>
          <c:if test="${participant.stats.lolApiItem6 == null}">
            <div></div>
          </c:if>
          <c:if test="${participant.stats.lolApiItem6 != null}">
            <img src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/${participant.stats.lolApiItem6.key}.png" alt="" />
          </c:if>
        </span>
      </div>
    </div>
  </c:forEach>
</div>
</c:forEach>
</div>

<%@ include file="../part/foot.jspf"%>