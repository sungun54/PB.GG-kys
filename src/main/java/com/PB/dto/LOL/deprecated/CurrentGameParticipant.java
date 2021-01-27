package com.PB.dto.LOL.deprecated;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CurrentGameParticipant {
	private long championId;
	private Perks perks;
	private long profileIconId;
	private boolean bot;
	private long teamId;
	private String summonerName;
	private String summonerId;
	private long spell1Id;
	private long spell2Id;
	private List<GameCustomizationObject> gameCustomizationObjects;
}