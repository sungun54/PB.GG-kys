package com.PB.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import com.PB.dto.LOL.ChampionInfo;
import com.PB.dto.LOL.LolApiLeagueEntry;
import com.PB.dto.LOL.LolApiMatch;
import com.PB.dto.LOL.LolApiMatchlist;
import com.PB.dto.LOL.LolApiSummoner;
import com.PB.util.Util;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class LolApiService {
	private static final int HTTP_STATUS_CODE_DATA_NOT_FOUND = 404;
	private static final int HTTP_STATUS_CODE_RATE_LIMIT_EXCEEEDED = 429;

	@Value("${custom.lolApi.apiKey}")
	private String apiKey;
	private String apiUrlHead = "https://kr.api.riotgames.com/lol/";

	@Autowired
	private UrlResponseService urlResponseService;

	private boolean isHTTP_STATUS_CODE_DATA_NOT_FOUND(String message) {
		return message.indexOf(HTTP_STATUS_CODE_DATA_NOT_FOUND + "") != -1;
	}
	
	private boolean isRateLimitExceededExceptionMessage(String message) {
		return message.indexOf(HTTP_STATUS_CODE_RATE_LIMIT_EXCEEEDED + "") != -1;
	}
	
	public ChampionInfo getChampionInfo() {
		while (true) {
			try {
				String rs = urlResponseService
						.callUrl(apiUrlHead + "platform/v3/champion-rotations" + "?api_key=" + apiKey);

				ChampionInfo championInfo = Util.getObjectFromJsonString(rs, ChampionInfo.class);

				return championInfo;
			} catch (HttpClientErrorException e) {
				if (isRateLimitExceededExceptionMessage(e.getMessage())) {
					Util.sleep(500);
					continue;
				}
				
				if (isHTTP_STATUS_CODE_DATA_NOT_FOUND(e.getMessage())) {
					return null;
				}

				throw e;
			}
		}
	}

	public LolApiSummoner getLolApiSummoner(String name) {
		while (true) {
			try {
				String rs = urlResponseService
						.callUrl(apiUrlHead + "summoner/v4/summoners/by-name/" + name + "?api_key=" + apiKey);

				LolApiSummoner lolApiSummoner = Util.getObjectFromJsonString(rs, LolApiSummoner.class);

				return lolApiSummoner;
			} catch (HttpClientErrorException e) {
				if (isRateLimitExceededExceptionMessage(e.getMessage())) {
					Util.sleep(500);
					continue;
				}
				
				if (isHTTP_STATUS_CODE_DATA_NOT_FOUND(e.getMessage())) {
					return null;
				}

				throw e;
			}
		}
	}

	public LolApiMatchlist getLolApiMatchlist(String accountId) {

		int beginIndex = 0;
		int endIndex = 2;

		while (true) {
			try {
				String rs = urlResponseService.callUrl(apiUrlHead + "match/v4/matchlists/by-account/" + accountId
						+ "?endIndex=" + endIndex + "&beginIndex=" + beginIndex + "&api_key=" + apiKey);

				LolApiMatchlist lolApiMatchlist = Util.getObjectFromJsonString(rs, LolApiMatchlist.class);

				return lolApiMatchlist;
			} catch (HttpClientErrorException e) {
				if (isRateLimitExceededExceptionMessage(e.getMessage())) {
					Util.sleep(500);
					continue;
				}
				
				if (isHTTP_STATUS_CODE_DATA_NOT_FOUND(e.getMessage())) {
					return null;
				}

				throw e;
			}
		}
	}

	public LolApiMatch getLolApiMatch(long gameId) {
		while (true) {
			try {
				String rs = urlResponseService
						.callUrl(apiUrlHead + "match/v4/matches/" + gameId + "?api_key=" + apiKey);

				LolApiMatch lolApiMatch = Util.getObjectFromJsonString(rs, LolApiMatch.class);

				return lolApiMatch;
			} catch (HttpClientErrorException e) {
				if (isRateLimitExceededExceptionMessage(e.getMessage())) {
					Util.sleep(500);
					continue;
				}

				throw e;
			}
		}
	}

	public List<LolApiLeagueEntry> getLolApiLeagueEntry(String summonerId) {
		while (true) {
			try {
				String rs = urlResponseService
						.callUrl(apiUrlHead + "league/v4/entries/by-summoner/" + summonerId + "?api_key=" + apiKey);

				List<LolApiLeagueEntry> lolApiLeagueEntryList = Util.getObjectFromJsonString(rs, List.class);

				ObjectMapper mapper = new ObjectMapper();
				
				List<LolApiLeagueEntry> leagueEntryList = mapper.convertValue(lolApiLeagueEntryList, new TypeReference<List<LolApiLeagueEntry>>() {});
				
				return leagueEntryList;

			} catch (HttpClientErrorException e) {
				if (isRateLimitExceededExceptionMessage(e.getMessage())) {
					Util.sleep(500);
					continue;
				}

				throw e;
			}
		}
	}
}