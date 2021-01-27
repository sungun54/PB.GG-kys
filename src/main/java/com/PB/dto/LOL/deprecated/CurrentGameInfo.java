package com.PB.dto.LOL.deprecated;

import java.util.List;

import com.PB.dto.LOL.BannedChampion;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CurrentGameInfo {
	private long gameId;
	private String gameType;
	private long gameStartTime;
	private long mapId;
	private long gameLength;
	private String platformId;
	private String gameMode;
	private List<BannedChampion> bannedChampions;
	private long gameQueueConfigId;
	private Observer observers;
	private List<CurrentGameParticipant> participants;
}