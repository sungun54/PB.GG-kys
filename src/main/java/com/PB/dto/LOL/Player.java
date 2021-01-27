package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Player {
	private int profileIcon;	
	private String accountId;		
	private String matchHistoryUri;		
	private String currentAccountId;	
	private String currentPlatformId;		
	private String summonerName;		
	private String summonerId;	
	private String platformId;
}