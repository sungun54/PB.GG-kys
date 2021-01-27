package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BannedChampion {
	private int pickTurn;
	private long championId;
	private long teamId;
}