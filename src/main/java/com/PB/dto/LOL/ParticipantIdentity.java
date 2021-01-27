package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ParticipantIdentity {
	private int participantId;
	private Player player;
	private String championId;
}

/* 
participantId       : 1~10 (정상)
player              : Player 1~10(profileIcon=4622, 
		                          accountId=DTbbhPUz_WaGCD2sq1CBtZqrHsMeXld_ohFs2biLSckiJiRIKI12ttu6, 
		                          matchHistoryUri=/v1/stats/player_history/KR/2386792649387424, 
		                          currentAccountId=DTbbhPUz_WaGCD2sq1CBtZqrHsMeXld_ohFs2biLSckiJiRIKI12ttu6, 
		                          currentPlatformId=KR, 
		                          summonerName=Trisak, 
		                          summonerId=jTJjg6ieehkflpvpTYZFMKkrlsxAi8H1rwC6gjirloya-Ec, 
		                          platformId=KR)
		                          (정상)
championId          : null (비정상)
*/