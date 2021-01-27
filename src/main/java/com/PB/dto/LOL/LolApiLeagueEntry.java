package com.PB.dto.LOL;

import com.PB.dto.LOL.deprecated.MiniSeries;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiLeagueEntry {
	private String leagueId;
	private String summonerId; 
	private String summonerName;
	private String queueType;
	private String tier;
	private String rank; 
	private int leaguePoints;
	private int wins;
	private int losses;
	private boolean hotStreak;
	private boolean veteran;
	private boolean freshBlood;
	private boolean inactive;
	private MiniSeries miniSeries;
	
	private int total;
	private String odds; // 승률
}