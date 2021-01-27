package com.PB.dto.LOL;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiMatchlist {
	private int startIndex;
	private int totalGames;
	private int endIndex;
	private List<LolApiMatchReference> matches;
} 