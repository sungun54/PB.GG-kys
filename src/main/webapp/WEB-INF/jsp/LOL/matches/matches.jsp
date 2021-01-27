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
	<h2>Id : ${summoner.id}</h2>
	<h2>계정 Id : ${summoner.accountId}</h2>
	<h2>프로필 아이콘 : ${summoner.profileIconId}</h2>
	<h2>정정일 : ${summoner.revisionDate}</h2>
	<h2>이름 : ${summoner.name}</h2>
	<h2>puuid : ${summoner.puuid}</h2>
	<h2>소환사 레벨 : ${summoner.summonerLevel}</h2>

	<h1>- matchlist</h1>
	<h2>경기 리스트 시작 : ${matchlist.startIndex}</h2>
	<h2>경기 리스트 끝 : ${matchlist.endIndex}</h2>
	<h2>${matchlist.matches}</h2>

	<h1>- matchReference</h1>
	<h2>게임 Id : ${matchReference.gameId}</h2>
	<h2>role : ${matchReference.role}</h2>
	<h2>시즌 : ${matchReference.season}</h2>
	<h2>국가 : ${matchReference.platformId}</h2>
	<h2>챔피언 : ${matchReference.champion}</h2>
	<h2>큐 : ${matchReference.queue}</h2>
	<h2>라인 : ${matchReference.lane}</h2>
	<h2>타임스탬프 : ${matchReference.timestamp}</h2>
	
	<h1>- match</h1>
	<h2>게임 Id : ${match.gameId}</h2>
	<h2>참가자 식별<br/>${match.participantIdentities}</h2>
	<h2>큐 번호 : ${match.queueId}</h2>
	<h2>게임 타입 : ${match.gameType}</h2>
	<h2>게임 시간 : ${match.gameDuration}</h2>
	<h2>팀들<br/>${match.teams}</h2>
	<h2>국가 : ${match.platformId}</h2>
	<h2>게임 생성시간 : ${match.gameCreation}</h2>
	<h2>시즌 : ${match.seasonId}</h2>
	<h2>게임 버전 : ${match.gameVersion}</h2>
	<h2>맵 번호 : ${match.mapId}</h2>
	<h2>게임 모드 : ${match.gameMode}</h2>
	<h2>참가자<br/>${match.participants}</h2>
	
	<h1>- participantIdentities (참가자 식별띠들)</h1>
	<h2>${participantIdentities}</h2>
	
	<h1>- participantIdentity (참가자 식별띠)</h1>
	<h2>참가자 식별 ID : ${participantIdentity.participantId}</h2>
	<h2>플레이어<br/>${participantIdentity.player}</h2>
	
	<h1>- teams (팀들)</h1>
	<h2>${teams}</h2>
	
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
	<h2>벤 리스트<br/>${team.bans}</h2>
	
	<!-- 
	<h2>${participants}</h2>
	<c:forEach items="${participants}" var="participant">
		<c:if test="${matchReference.champion == participant.championId}">
			<div style="color:red;">
			<h2>${participant.spell1Id}</h2>
			<h2>${participant.stats.totalDamageDealt}</h2>			
			</div>
		</c:if>
	</c:forEach> 
	<h2>챔피언 : ${matchReference.champion}</h2>
	-->
	
	<h1>- 팀이 금지한 챔피언들</h1>
	<c:forEach items="${teams}" var="team">
		<h2>${team.bans}</h2>
		<h1>- 팀원이 금지한 챔피언</h1>
		<c:forEach items="${team.bans}" var="teamBans">
			<h2>${teamBans.championId}</h2>
		</c:forEach>
	</c:forEach>
	
	<c:forEach items="${participants}" var="participant">
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
		
		<h1>- participantStats</h1>
		<h2>참가자 총 스코어 랭크 : ${participantStats.totalScoreRank}</h2>
		<h2>총 입힌 데미지 : ${participantStats.totalDamageDealt}</h2>
		<h2>총 받은 데미지 : ${participantStats.totalDamageTaken}</h2>
		<h2>챔피언에게 입힌 총 데미지 : ${participantStats.totalDamageDealtToChampions}</h2>
		<h2>총 플레이어 점수 : ${participantStats.totalPlayerScore}</h2>
		<h2>전투 플레이어 점수 : ${participantStats.combatPlayerScore}</h2>
		<h2>오브젝트 플레이어 점수 : ${participantStats.objectivePlayerScore}</h2>
		<h2>플레이어 0 점수 : ${participantStats.playerScore0}</h2>
		<h2>플레이어 1 점수 : ${participantStats.playerScore1}</h2>
		<h2>플레이어 2 점수 : ${participantStats.playerScore2}</h2>
		<h2>플레이어 3 점수 : ${participantStats.playerScore3}</h2>
		<h2>플레이어 4 점수 : ${participantStats.playerScore4}</h2>
		<h2>플레이어 5 점수 : ${participantStats.playerScore5}</h2>
		<h2>플레이어 6 점수 : ${participantStats.playerScore6}</h2>
		<h2>플레이어 7 점수 : ${participantStats.playerScore7}</h2>
		<h2>플레이어 8 점수 : ${participantStats.playerScore8}</h2>
		<h2>플레이어 9 점수 : ${participantStats.playerScore9}</h2>
		
		<h2>퍼타 킬 : ${participantStats.firstTowerKill}</h2>
		<h2>퍼타 어시 : ${participantStats.firstTowerAssist}</h2>
		<h2>타워 킬 : ${participantStats.turretKills}</h2>
		<h2>퍼억 킬 : ${participantStats.firstInhibitorKill}</h2>
		<h2>퍼억 어시 : ${participantStats.firstInhibitorAssist}</h2>
		<h2>억 킬 : ${participantStats.inhibitorKills}</h2>
		<h2>킬 : ${participantStats.kills}</h2>
		<h2>더블 킬 : ${participantStats.doubleKills}</h2>
		<h2>트리플 킬 : ${participantStats.tripleKills}</h2>
		<h2>쿼드라 킬 : ${participantStats.quadraKills}</h2>
		<h2>펜타 킬 : ${participantStats.pentaKills}</h2>
		<h2>언리얼 킬 : ${participantStats.unrealKills}</h2>
		<h2>퍼블 : ${participantStats.firstBloodKill}</h2>
		<h2>최다 멀티킬 : ${participantStats.largestMultiKill}</h2>
		<h2>최대 킬 : ${participantStats.largestKillingSpree}</h2>
		<h2>연속 킬 : ${participantStats.killingSprees}</h2>
		
		<h2>데쓰 : ${participantStats.deaths}</h2>
		<h2>어시스트 : ${participantStats.assists}</h2>
		<h2>퍼블 어시 : ${participantStats.firstBloodAssist}</h2>
		<h2>노드 중립화 어시? : ${participantStats.nodeNeutralizeAssist}</h2>
		
		<h2>입힌 물리 피해량 : ${participantStats.physicalDamageDealt}</h2>
		<h2>받은 물리 피해량 : ${participantStats.physicalDamageTaken}</h2>
		<h2>입힌 마법 피해량 : ${participantStats.magicDamageDefault}</h2>
		<h2>받은 마법 피해량 : ${participantStats.magicDamageTaken}</h2>
		<h2>입힌 고정 피해량 : ${participantStats.trueDamageDealt}</h2>
		<h2>받은 고정 피해량 : ${participantStats.trueDamageTaken}</h2>
		
		<h2>받은 고정 피해량 : ${participantStats.physicalDamageDealtToChampions}</h2>
		<h2>받은 고정 피해량 : ${participantStats.magicDamageDealtToChaimpions}</h2>
		<h2>받은 고정 피해량 : ${participantStats.trueDamageDealtToChampions}</h2>
		
		<h2>받은 고정 피해량 : ${participantStats.damageDealtToTurrets}</h2>
		<h2>받은 고정 피해량 : ${participantStats.damageDealtToObjectives}</h2>
		
		<h2>최대 크리티컬 : ${participantStats.largestCriticalStrike}</h2>
		<h2>줄인 물리 피해량 : ${participantStats.damageSelfMitigated}</h2>
		<h2>치유량 : ${participantStats.totalHeal}</h2>
		<h2>치유된 모든 유닛 : ${participantStats.totalUnitsHealed}</h2>
		<h2>골드 획득량 : ${participantStats.goldEarned}</h2>
		<h2>골드 소비량 : ${participantStats.goldSpent}</h2>
		
		<h2>와드 킬 : ${participantStats.wardKilled}</h2>
		<h2>와드 구매량 : ${participantStats.sightWardsBoughtInGame}</h2>
		<h2>핑와 구매량 : ${participantStats.visionWardsBoughtInGame}</h2>
		<h2>핑와 총합 : ${participantStats.visionScore}</h2>
		<h2>와드 위치 : ${participantStats.wardsPlaced}</h2>
		
		<h2>미니언 킬 총합 : ${participantStats.totalMinionsKilled}</h2>
		<h2>팀 정글이 죽인 정글 미니언 : ${participantStats.neutralMinionsKilledTeamJungle}</h2>
		<h2>적 정글이 죽인 정글 미니언 : ${participantStats.neutralMinionsKilledEnemyJungle}</h2>
		
		<h2>승 : ${participantStats.win}</h2>
		<h2>팀 오브젝트 : ${participantStats.teamObjective}</h2>
		
		<h2>참가자 번호 : ${participantStats.participantId}</h2>
		
		<h2>0번 참가자 룬 특성 : ${participantStats.perk0}</h2>
		<h2>참가자 특성1  : ${participantStats.perk0Var1}</h2>
		<h2>참가자 특성2 : ${participantStats.perk0Var2}</h2>
		<h2>참가자 특성3 : ${participantStats.perk0Var3}</h2>
		
		<h2>1번 참가자 룬 특성 : ${participantStats.perk1}</h2>
		<h2>참가자 보조 룬1 : ${participantStats.perk1Var1}</h2>
		<h2>참가자 보조 룬2 : ${participantStats.perk1Var2}</h2>
		<h2>참가자 보조 룬3 : ${participantStats.perk1Var3}</h2>
		
		<h2>2번 참가자 룬 특성 : ${participantStats.perk2}</h2>
		<h2>참가자 보조 룬1 : ${participantStats.perk2Var1}</h2>
		<h2>참가자 보조 룬2 : ${participantStats.perk2Var2}</h2>
		<h2>참가자 보조 룬3 : ${participantStats.perk2Var3}</h2>
		
		<h2>3번 참가자 룬 특성 : ${participantStats.perk3}</h2>
		<h2>참가자 보조 룬1 : ${participantStats.perk3Var1}</h2>
		<h2>참가자 보조 룬2 : ${participantStats.perk3Var2}</h2>
		<h2>참가자 보조 룬3 : ${participantStats.perk3Var3}</h2>
		
		<h2>4번 참가자 룬 특성 : ${participantStats.perk4}</h2>
		<h2>참가자 보조 룬1 : ${participantStats.perk4Var1}</h2>
		<h2>참가자 보조 룬2 : ${participantStats.perk4Var2}</h2>
		<h2>참가자 보조 룬3 : ${participantStats.perk4Var3}</h2>
		
		<h2>5번 참가자 룬 특성 : ${participantStats.perk5}</h2>
		<h2>참가자 보조 룬1 : ${participantStats.perk5Var1}</h2>
		<h2>참가자 보조 룬2 : ${participantStats.perk5Var2}</h2>
		<h2>참가자 보조 룬3 : ${participantStats.perk5Var3}</h2>

		<h2>참가자 메인 스펠 : ${participantStats.perkPrimaryStyle}</h2>
		<h2>참가자 보조 스펠 : ${participantStats.perkSubStyle}</h2>
		
		<h2>참가자 챔피언 레벨 : ${participantStats.championLevel}</h2>
		
		<h2>참가자 아이템0 : ${participantStats.item0}</h2>
		<h2>참가자 아이템1 : ${participantStats.item1}</h2>
		<h2>참가자 아이템2 : ${participantStats.item2}</h2>
		<h2>참가자 아이템3 : ${participantStats.item3}</h2>
		<h2>참가자 아이템4 : ${participantStats.item4}</h2>
		<h2>참가자 아이템5 : ${participantStats.item5}</h2>
		<h2>참가자 아이템6 : ${participantStats.item6}</h2>
		
		<h2>기타 : ${participantStats.longestTimeSpentLiving}</h2>
		<h2>기타 : ${participantStats.totalTimeCrowdControlDealt}</h2>
		<h2>기타 : ${participantStats.timeCCingOthers}</h2>
		<h2>기타 : ${participantStats.nodeNeutralize}</h2>
		<h2>기타 : ${participantStats.nodeCapture}</h2>
		<h2>기타 : ${participantStats.nodeCaptureAssist}</h2>
		<h2>기타 : ${participantStats.altarsNeutralized}</h2>
		<h2>기타 : ${participantStats.altarsCaptured}</h2>
		
		<h1>- participantTimeline</h1>
		<h2>참가자 번호 : ${participantTimeline.participantId}</h2>
		<h2>분당 cs 차이량 : ${participantTimeline.csDiffPerMinDeltas}</h2>
		<h2>분당 받은 피해량 : ${participantTimeline.damageTakenPerMinDeltas}</h2>
		<h2>역할 : ${participantTimeline.role}</h2>
		<h2>분당 받은 피해량 차이 : ${participantTimeline.damageTakenDiffPerMinDeltas}</h2>
		<h2>분당 경험치 : ${participantTimeline.xpPerMinDeltas}</h2>
		<h2>분당 경험치 차이? : ${participantTimeline.xpDiffPerMinDeltas}</h2>
		<h2>라인 : ${participantTimeline.lane}</h2>
		<h2>분당 creep? : ${participantTimeline.creepsPerMinDeltas}</h2>
		<h2>분당 골드 : ${participantTimeline.goldPerMinDeltas}</h2>
	</c:forEach>
</c:forEach>

<h1>- leagueEntry</h1>
<h2>${leagueEntry}</h2>

<c:forEach items="${leagueEntry}" var="league">
<h1>- league</h1>
<h2>리그 ID : ${league.leagueId}</h2>
<h2>소환사 ID : ${league.summonerId}</h2>
<h2>소환사 이름 : ${league.summonerName}</h2>
<h2>큐 타입 : ${league.queueType}</h2>
<h2>티어 : ${league.tier}</h2>
<h2>랭크 : ${league.rank}</h2>
<h2>리그 포인트 : ${league.leaguePoints}</h2>
<h2>승 : ${league.wins}</h2>
<h2>패 : ${league.losses}</h2>
<h2>LP 보너스 : ${league.hotStreak}</h2>
<h2>베테랑 : ${league.veteran}</h2>
<h2>신선한 피? : ${league.freshBlood}</h2>
<h2>비활성 : ${league.inactive}</h2>
<h2>미니시리즈 : ${league.miniSeries}</h2>
</c:forEach>

<!-- 
<h1>- currentGameInfo</h1>
<h2>${currentGameInfo}</h2>
 -->


<%@ include file="../../part/foot.jspf"%>