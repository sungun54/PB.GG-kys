package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ParticipantStats {
	// total
	private int totalScoreRank;
	private long totalDamageDealt; // 입힌
	private long totalDamageTaken; // 받은
	private long totalDamageDealtToChampions;
	
	// score
	private int totalPlayerScore;
	private int combatPlayerScore;
	private int objectivePlayerScore;
	private int playerScore0;
	private int playerScore1;
	private int playerScore2;
	private int playerScore3;
	private int playerScore4;
	private int playerScore5;
	private int playerScore6;
	private int playerScore7;
	private int playerScore8;
	private int playerScore9;
	
	// 타워
	private boolean firstTowerKill; 
	private boolean firstTowerAssist;
	private int turretKills;
		
	// 억제기
	private boolean firstInhibitorKill;
	private boolean firstInhibitorAssist;
	private int inhibitorKills;
	
	// 킬
	private int kills;
	private int doubleKills;
	private int tripleKills;
	private int quadraKills;
	private int pentaKills;
	private int unrealKills;
	private boolean firstBloodKill;
	private int largestMultiKill;
	
	private int largestKillingSpree;
	private int killingSprees;
	
	// 데쓰
	private int deaths;
	
	// 어시스트
	private int assists;
	private boolean firstBloodAssist;
	private int nodeNeutralizeAssist;
	
	// 피해량
	private long physicalDamageDealt;
	private long physicalDamageTaken;
	private long magicDamageDealt;
	private long magicalDamageTaken;
	private long trueDamageDealt;
	private long trueDamageTaken;
	
	private long physicalDamageDealtToChampions;
	private long magicDamageDealtToChampions; 
	private long trueDamageDealtToChampions;
	
	private long damageDealtToTurrets;
	private long damageDealtToObjectives;
	
	// 크리티컬
	private long largestCriticalStrike;
	
	// 줄인 데미지
	private long damageSelfMitigated;
	
	// 치유량
	private long totalHeal;
	private int totalUnitsHealed;
	
	// 골드
	private int goldEarned;
	private int goldSpent;
	
	// 와드
	private int wardsKilled;
	private int sightWardsBoughtInGame;
	private int visionWardsBoughtInGame;
	private long visionScore;
	private int wardsPlaced;
	
	// 미니언
	private int totalMinionsKilled;
	private int neutralMinionsKilled;
	private int neutralMinionsKilledTeamJungle;
	private int neutralMinionsKilledEnemyJungle;
	
	// 팀
	private boolean win;
	private int teamObjective;
		
	// 소환사
	private int participantId;
	
	// 룬
	private int perk0;
	private int perk0Var1;
	private int perk0Var2;
	private int perk0Var3;
	
	private int perk1;
	private int perk1Var1;
	private int perk1Var2;
	private int perk1Var3;
	
	private int perk2;
	private int perk2Var1;
	private int perk2Var2;
	private int perk2Var3;
	
	private int perk3;
	private int perk3Var1;
	private int perk3Var2;
	private int perk3Var3;
	
	private int perk4;
	private int perk4Var1;
	private int perk4Var2;
	private int perk4Var3;
	
	private int perk5;
	private int perk5Var1;
	private int perk5Var2;
	private int perk5Var3;
	
	private int perkPrimaryStyle;
	private int perkSubStyle;
	private int statPerk0;
	private int statPerk1;
	private int statPerk2;
	
	// 챔피언 레벨
	private int champLevel;
	
	// 아이템
	private int item0;
	private int item1;
	private int item2;
	private int item3;
	private int item4;
	private int item5;
	private int item6;
	
	// 기타
	private int longestTimeSpentLiving;
	private int totalTimeCrowdControlDealt;
	private long timeCCingOthers;
	private int nodeNeutralize;
	private int nodeCapture;
	private int nodeCaptureAssist;
	private int altarsNeutralized;
	private int altarsCaptured;
	
	// 추가
	private double ratio; // 평점
	private String ratioRs;
	private int team100InvolvementRate; // 킬 관여율
	private int team200InvolvementRate;
	private int cs;
	private double minuteCs;
	private LolApiItem lolApiItem0;
	private LolApiItem lolApiItem1;
	private LolApiItem lolApiItem2;
	private LolApiItem lolApiItem3;
	private LolApiItem lolApiItem4;
	private LolApiItem lolApiItem5;
	private LolApiItem lolApiItem6;
}