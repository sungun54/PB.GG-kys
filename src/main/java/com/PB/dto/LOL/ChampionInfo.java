package com.PB.dto.LOL;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChampionInfo {
	private int maxNewPlayerLevel;
	private List<Integer> freeChampionIdsForNewPlayers;
	private List<Integer> freeChampionIds;
	private List<String> freeChampionIdsStr;
}