package com.PB.dto.LOL;

import com.PB.util.Util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiSummoner {
	private int uid;
	private String regDate;
	private String updateDate;
	private String accountId;
	private int profileIconId;
	private long revisionDate;
	private String name;
	private String id;
	private String puuid;
	private long summonerLevel;
	
	public boolean isOld() {
		long passedSeconds = Util.getPassedSeconds(updateDate);

		return passedSeconds > 60 * 60 * 24;
	}
	
	private LolApiLeagueEntry flexRank; // 솔랭
	private LolApiLeagueEntry soloRank; // 자랭
}