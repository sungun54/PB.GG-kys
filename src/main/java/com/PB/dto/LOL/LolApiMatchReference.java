package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiMatchReference {
	private long gameId;
	private String role;
	private int season;
	private String platformId;
	private int champion;
	private int queue;
	private String lane;
	private long timestamp;
	
	private LolApiMatch lolApiMatch;	
}