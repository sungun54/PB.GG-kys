package com.PB.dto.LOL;

import java.util.List;

import com.PB.dto.LOL.deprecated.Mastery;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Participant {
	private int participantId;
	private int championId;
	private List<Rune> runes;
	private ParticipantStats stats;
	private int teamId;
	private ParticipantTimeline timeline;
	private int spell1Id;
	private int spell2Id;
	private String highestAchievedSeasonTier;
	private List<Mastery> masteries;
	
	private LolApiChampion lolApiChampion;
	private Rune mainRune;
	private Rune subRune;
	private LolApiSpell Spell1;
	private LolApiSpell Spell2;
	private LolApiLeagueEntry soloRank;
	private LolApiLeagueEntry flexRank;
	private String summonerName;
}