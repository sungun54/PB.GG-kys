<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../part/head.jspf"%>

<style>
h1 {
	color: red;
}
</style>

<c:forEach items="${matchReferences}" var="matchReference">

	<h1>- summoner</h1>
	<h2>계정 Id : ${summoner.accountId}</h2>
	<h2>프로필 아이콘 : ${summoner.profileIconId}</h2>
	<h2>정정일 : ${summoner.revisionDate}</h2>
	<h2>이름 : ${summoner.name}</h2>
	<h2>puuid : ${summoner.puuid}</h2>
	<h2>소환사 레벨 : ${summoner.summonerLevel}</h2>

	<h1>- matchlist</h1>
	<h2>경기 리스트 시작 : ${matchlist.startIndex}</h2>
	<h2>경기 리스트 끝 : ${matchlist.endIndex}</h2>
	<!-- <h2>matchlist : ${matchlist.matches}</h2> -->

	<h1>- matchReference</h1>
	<h2>게임 Id : ${matchReference.gameId}</h2>
	<h2>role : ${matchReference.role}</h2>
	<h2>시즌 : ${matchReference.season}</h2>
	<h2>국가 : ${matchReference.platformId}</h2>
	<h2>챔피언 : ${matchReference.champion}</h2>
	<h2>큐 : ${matchReference.queue}</h2>
	<h2>라인 : ${matchReference.lane}</h2>
	<h2>타임스탬프 : ${matchReference.timestamp}</h2>
	<h2>게임 길이 : ${matchReference.match.gameDuration }</h2>
	<h2>게임 생성 : ${matchReference.match.gameCreation }</h2>
	<h2>
		게임 승패 :
		<c:if test="${matchReference.win == true}">승리</c:if>
		<c:if test="${matchReference.win == false}">패배</c:if>
	</h2>
	<h2>멀티킬 : ${matchReference.multiKill}</h2>
	<h2>
		챔피언 이미지 : <img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${matchReference.championName}.png"
			alt="" />
	</h2>
	<h2>아이템 이미지</h2>
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item0}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item1}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item2}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item3}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item4}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item5}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${matchReference.item6}.png"
		alt="" />
	<h2>스펠 이미지 :</h2>
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${matchReference.spell1Key}.png"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${matchReference.spell2Key}.png"
		alt="" />
	<h2>룬 이미지 :</h2>
	<img
		src="https://ddragon.leagueoflegends.com/cdn/img/${matchReference.mainRune}"
		alt="" />
	<img
		src="https://ddragon.leagueoflegends.com/cdn/img/${matchReference.subRune}"
		alt="" />
	<h2>KDA :
		${matchReference.kill}/${matchReference.death}/${matchReference.assist}</h2>
	<h2>며칠 전 게임 : ${matchReference.relative}</h2>
	<h2>게임 한 시간 : ${matchReference.timeZone}</h2>
	<h2>CS : ${matchReference.cs }</h2>
	<h2>레벨 : ${matchReference.level }</h2>
	<h2>KDA :
		${matchReference.kill}/${matchReference.death}/${matchReference.assist}</h2>
	<h2>평점 : ${matchReference.rating}</h2>
	<h2>킬 관여율 : ${matchReference.involvementRate}%</h2>
	<h2>게임 타입 : ${match.gameType}</h2>
	<h2>제어 와드 : ${matchReference.visionWard}</h2>


	<c:forEach items="${matchReference.match.participantIdentities}"
		var="participantIdentity">
		<h2>
			참가자 챔피언 : <img
				src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participantIdentity.championId}.png"
				alt="" />
		</h2>
		<h2>참가자들 : ${participantIdentity.player.summonerName}</h2>
	</c:forEach>

	<h1>- match</h1>
	<h2>게임 Id : ${matchReference.match.gameId}</h2>
	<h2>참가자 식별 : ${matchReference.match.participantIdentities}</h2>
	<h2>큐 번호 : ${matchReference.match.queueId}</h2>
	<h2>게임 시간 : ${matchReference.match.gameDuration}</h2>
	<h2>팀 : ${matchReference.match.teams}</h2>
	<h2>국가 : ${matchReference.match.platformId}</h2>
	<h2>게임 생성시간 : ${matchReference.match.gameCreation}</h2>
	<h2>시즌 : ${matchReference.match.seasonId}</h2>
	<h2>게임 버전 : ${matchReference.match.gameVersion}</h2>
	<h2>맵 번호 : ${matchReference.match.mapId}</h2>
	<h2>게임 모드 : ${matchReference.match.gameMode}</h2>
	<h2>참가자 : ${matchReference.match.participants}</h2>

	<h1>- team</h1>
	<h2>팀 번호 : ${team.teamId}</h2>
	<h2>승리 : ${team.win}</h2>
	<h2>퍼블 : ${team.firstBlood}</h2>
	<h2>퍼타 : ${team.firstTower}</h2>
	<h2>퍼억 : ${team.firstInhibitor}</h2>
	<h2>퍼바 : ${team.firstBaron}</h2>
	<h2>퍼드 : ${team.firstDragon}</h2>
	<h2>퍼전 : ${team.firstRiftHerald}</h2>
	<h2>타워 킬 : ${team.towerKills}</h2>
	<h2>억제기 킬 : ${team.inhibitorKills}</h2>
	<h2>바론 킬 : ${team.baronKills}</h2>
	<h2>드래곤 킬 : ${team.dragonKills}</h2>
	<h2>모름 : ${team.vilemawKills}</h2>
	<h2>모름 : ${team.riftHeraldKills}</h2>
	<h2>승리 점수 : ${team.dominionVictoryScore}</h2>
	<h2>벤 리스트 : ${team.bans}</h2>

	<h1>- participant</h1>
	<h2>참가자 ID : ${participant.participantId}</h2>
	<h2>챔피언 번호 : ${participant.championId}</h2>
	<h2>룬들 : ${participant.runes}</h2>
	<h2>참가자팀 상태 : ${participant.stats}</h2>
	<h2>팀 번호 : ${participant.teamId}</h2>
	<h2>타임라인 : ${participant.timeline}</h2>
	<h2>메인 스펠 : ${participant.spell1Id}</h2>
	<h2>보조 스펠 : ${participant.spell2Id}</h2>
	<h2>시즌 내 가장 높은 티어 달성 : ${participant.highestAchievedSeasonTier}</h2>
	<h2>마스터리 : ${participant.masteries}</h2>

	<h1>게임 상세 정보</h1>
	<c:forEach items="${matchReference.participants}" var="participant">
		<h2>
			챔피언 이미지 : <img
				src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/champion/${participant.championName}.png"
				alt="" />
		</h2>
		<h2>스펠 이미지</h2>
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell1Key}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/spell/${participant.spell2Key}.png"
			alt="" />
		<h2>아이템 이미지</h2>
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item0}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item1}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item2}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item3}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item4}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item5}.png"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/10.19.1/img/item/${participant.stats.item6}.png"
			alt="" />

		<h2>룬 이미지 :</h2>
		<img
			src="https://ddragon.leagueoflegends.com/cdn/img/${participant.mainRune}"
			alt="" />
		<img
			src="https://ddragon.leagueoflegends.com/cdn/img/${participant.subRune}"
			alt="" />
		<h2>티어 : ${participant.tier}</h2>
		<h2>KDA : ${participant.stats.kills}/${participant.stats.deaths}/${participant.stats.assists}</h2>
		<h2>평점 : ${participant.rating}</h2>
		<h2>킬 관여율 : ${participant.involvementRate}%</h2>
		<h2>전체 피해량 : ${participant.stats.totalDamageDealt}</h2>
		<h2>챔피언 피해량 : ${participant.stats.totalDamageDealtToChampions}</h2>
		<h2>제어 와드 : ${participant.stats.visionWardsBoughtInGame}</h2>
		<h2>와드 설치 : ${participant.stats.wardsPlaced}</h2>
		<h2>와드 제거 : ${participant.stats.wardKilled}</h2>
		<h2>CS : ${participant.cs}</h2>
		<h2>분당 CS : ${participant.minuteCs}</h2>
	</c:forEach>

</c:forEach>
<%@ include file="../../part/foot.jspf"%>