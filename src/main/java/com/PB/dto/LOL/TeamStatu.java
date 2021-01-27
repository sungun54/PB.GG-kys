package com.PB.dto.LOL;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TeamStatu {
	private int teamId;
	private String win;
	private boolean firstBlood;
	private boolean firstTower;
	private boolean firstInhibitor;
	private boolean firstBaron;
	private boolean firstDragon;
	private boolean firstRiftHerald;
	private int towerKills;
	private int inhibitorKills;
	private int baronKills;
	private int dragonKills;
	private int vilemawKills;
	private int riftHeraldKills;
	private int dominionVictoryScore;
	private List<TeamBans> bans;
}