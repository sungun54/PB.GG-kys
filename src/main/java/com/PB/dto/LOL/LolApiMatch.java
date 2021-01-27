package com.PB.dto.LOL;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiMatch {
	private long gameId;
	private List<ParticipantIdentity> participantIdentities; 
	private int queueId;
	private String gameType;
	private long gameDuration;
	private List<TeamStatu> teams; 
	private String platformId;
	private long gameCreation;
	private int seasonId;
	private String gameVersion;
	private int mapId;
	private String gameMode;
	private List<Participant> participants;
	
	private String gameTypeKR;
	private String passedTime;
	private String totalTime;
	private int winningTeamTotalKills;
	private int losingTeamTotalKills;
}

/* 
gameId       : 4665458061
queueId      : 420
gameType     : MATCHED_GAME (비정상)
gameDuration : 958
gameCreation : 1600801326809
gameVersion  : 10.19.336.4199
gameMode     : CLASSIC
mapId        : 11

participants : 정상
participantIdentities : 정상 
TeamStatu : 정상

gameId  => Match
queueId => gameType
*/
