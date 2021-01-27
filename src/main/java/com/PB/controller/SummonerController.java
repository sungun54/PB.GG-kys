package com.PB.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PB.dto.LOL.LolApiChampion;
import com.PB.dto.LOL.LolApiItem;
import com.PB.dto.LOL.LolApiLeagueEntry;
import com.PB.dto.LOL.LolApiMatch;
import com.PB.dto.LOL.LolApiMatchReference;
import com.PB.dto.LOL.LolApiMatchlist;
import com.PB.dto.LOL.LolApiSpell;
import com.PB.dto.LOL.LolApiSummoner;
import com.PB.dto.LOL.Participant;
import com.PB.dto.LOL.ParticipantIdentity;
import com.PB.dto.LOL.ParticipantStats;
import com.PB.dto.LOL.Player;
import com.PB.dto.LOL.Rune;
import com.PB.service.LolApiService;
import com.PB.service.LolService;

@Controller
public class SummonerController {
	@Value("${custom.lolApi.apiKey}")
	private String apiKey;

	@Autowired
	private LolApiService lolApiService;
	@Autowired
	private LolService lolService;
	@Autowired
	RestTemplateBuilder restTemplateBuilder;

	@RequestMapping("/summoner")
	public String lolService__getLolApiSummoner(String userName, Model model) {

		/* 개인 가져오기 */
		LolApiSummoner lolApiSummoner = lolService.getLolApiSummoner(userName);
		
		if(lolApiSummoner == null) {
			return "LOL/error";
		}
		
		model.addAttribute("summoner", lolApiSummoner);

		String lolApiSummonerId = lolApiSummoner.getId();

		/* 개인(API) - 리그 리스트 가져오기 */
		List<LolApiLeagueEntry> lolApiLeagueEntryList = lolApiService.getLolApiLeagueEntry(lolApiSummonerId);

		for(LolApiLeagueEntry lolApiLeagueEntry : lolApiLeagueEntryList) {
			
			/* 개인(API) - 리그 리스트 - 리그 설정 */
			String queueType = lolApiLeagueEntry.getQueueType();
			
			DecimalFormat form = new DecimalFormat("#,##0.00");
			
			if(lolApiLeagueEntryList.size() == 2) {
				if (queueType.equals("RANKED_SOLO_5x5")) {
					lolApiSummoner.setFlexRank(lolApiLeagueEntry);
					
					int flexWins = lolApiSummoner.getFlexRank().getWins();
					int flexLosses = lolApiSummoner.getFlexRank().getLosses();
					int flexTotal = flexWins + flexLosses;
					lolApiSummoner.getFlexRank().setTotal(flexTotal);
					
					double flexOdds = flexWins / (double) (flexWins + flexLosses) * 100;
					String flexOddsRs = form.format(flexOdds);
					lolApiSummoner.getFlexRank().setOdds(flexOddsRs);
				} 
				else{
					lolApiSummoner.setSoloRank(lolApiLeagueEntry);
					
					int soloWins = lolApiSummoner.getSoloRank().getWins();
					int soloLosses = lolApiSummoner.getSoloRank().getLosses();
					int soloTotal = soloWins + soloLosses;
					lolApiSummoner.getSoloRank().setTotal(soloTotal);
			
					double soloOdds = soloWins / (double) (soloWins + soloLosses) * 100;
					String soloOddsRs = form.format(soloOdds);
					lolApiSummoner.getSoloRank().setOdds(soloOddsRs);
				}	
			} else if(lolApiLeagueEntryList.size() == 1) {
				if (queueType.equals("RANKED_FLEX_SR")) {
					lolApiSummoner.setSoloRank(lolApiLeagueEntry);
					
					int soloWins = lolApiSummoner.getSoloRank().getWins();
					int soloLosses = lolApiSummoner.getSoloRank().getLosses();
					int soloTotal = soloWins + soloLosses;
					lolApiSummoner.getSoloRank().setTotal(soloTotal);
					
					double soloOdds = soloWins / (double) (soloWins + soloLosses) * 100;
					String soloOddsRs = form.format(soloOdds);
					lolApiSummoner.getSoloRank().setOdds(soloOddsRs);
				} 
				else if (queueType.equals("RANKED_SOLO_5x5")) {
					lolApiSummoner.setFlexRank(lolApiLeagueEntry);
					
					int flexWins = lolApiSummoner.getFlexRank().getWins();
					int flexLosses = lolApiSummoner.getFlexRank().getLosses();
					int flexTotal = flexWins + flexLosses;
					
					double flexOdds = flexWins / (double) (flexWins + flexLosses) * 100;
					String flexOddsRs = form.format(flexOdds);
					
					lolApiSummoner.getFlexRank().setTotal(flexTotal);
					lolApiSummoner.getFlexRank().setOdds(flexOddsRs);
				}
			}
		}

		String accountId = lolApiSummoner.getAccountId();
		
		// 개인(API) - 매치리스트 가져오기
		LolApiMatchlist lolApiMatchlist = lolApiService.getLolApiMatchlist(accountId);
		
		if(lolApiMatchlist == null) {
			return "LOL/summoner";
		}
		
		model.addAttribute("matchlist", lolApiMatchlist);

		// 개인 - 매치리스트 - MatchReferences 가져오기
		List<LolApiMatchReference> lolApiMatchReferences = lolApiMatchlist.getMatches();
		model.addAttribute("matchReferences", lolApiMatchReferences);

		// 개인 - MatchReferences - MatchReference 가져오기
		for (LolApiMatchReference lolApiMatchReference : lolApiMatchReferences) {
			long gameId = lolApiMatchReference.getGameId();

			// 개인(API) - MatchReference - Match 가져오기
			LolApiMatch lolApiMatch = lolApiService.getLolApiMatch(gameId);

			int queueId = lolApiMatch.getQueueId();

			// 개인 - Match - GameType 설정
			switch (queueId) {

			case 420:
				lolApiMatch.setGameTypeKR("솔로 5:5 랭크");
				lolApiMatch.setGameType("RANKED_SOLO_5x5");
				break;
			case 430:
				lolApiMatch.setGameTypeKR("일반");
				break;
			case 440:
				lolApiMatch.setGameTypeKR("자유 5:5 랭크");
				lolApiMatch.setGameType("RANKED_FLEX_SR");
				break;
			case 450:
				lolApiMatch.setGameTypeKR("입문 봇전");
				break;
			case 830:
				lolApiMatch.setGameTypeKR("초보 봇전");
				break;
			case 840:
				lolApiMatch.setGameTypeKR("중급 봇전");
				break;
			case 850:
				lolApiMatch.setGameTypeKR("무작위 총력전");
				break;
			case 900:
				lolApiMatch.setGameTypeKR("URF 모드");
				break;
			}

			// 개인 - Match - passedTime 설정
			String passedTime;

			long currentTimeMillis = System.currentTimeMillis();
			long gameCreation = lolApiMatch.getGameCreation();
			long gameDuration = lolApiMatch.getGameDuration();

			long rs = ((currentTimeMillis - gameCreation) / 1000 - gameDuration) / 24 / 60 / 60;
			passedTime = rs + "일 전";

			if (rs < 1) {
				rs = ((currentTimeMillis - gameCreation) / 1000 - gameDuration) / 60 / 60;
				passedTime = rs + "시간 전";
				if (rs < 1) {
					rs = ((currentTimeMillis - gameCreation) / 1000 - gameDuration) / 60;
					passedTime = rs + "분 전";
					if (rs < 1) {
						rs = ((currentTimeMillis - gameCreation) / 1000 - gameDuration);
						passedTime = rs + "초 전";
					}
				}
			}

			lolApiMatch.setPassedTime(passedTime);

			// 개인 - Match - totalTime 설정
			long totalTime = gameCreation + gameDuration * 1000;

			Date date = new java.util.Date(totalTime);
			SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			dateFormat.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9"));

			String totalTimeStr = dateFormat.format(date);

			lolApiMatch.setTotalTime(totalTimeStr);

			// 개인 - Match - Participants 가져오기
			List<Participant> participants = lolApiMatch.getParticipants();

			int losingTeamTotalKills = 0;
			int winningTeamTotalKills = 0;
			int team100InvolvementRate = 0;
			int team200InvolvementRate = 0;

			int participantIdentitiesIndex = 0;

			for (Participant participant : participants) {
				ParticipantStats participantStats = participant.getStats();

				// 개인 - Match - Participants - participant - 팀(100, 200) 총합 킬 설정
				int teamId = participant.getTeamId();

				if (teamId == 100) {
					losingTeamTotalKills += participantStats.getKills();
				} else if (teamId == 200) {
					winningTeamTotalKills += participantStats.getKills();
				}
				
				lolApiMatch.setLosingTeamTotalKills(losingTeamTotalKills);
				lolApiMatch.setWinningTeamTotalKills(winningTeamTotalKills);

				int championId = participant.getChampionId();

				// 개인(API) - Match - Participants - participant - LolApiChampion 가져오기
				LolApiChampion lolApiChampion = lolService.getLolApiChampion(championId);

				// 개인 - Match - Participants - participant - Champion 설정
				participant.setLolApiChampion(lolApiChampion);

				// 개인 - Match - Participants - participant - ParticipantStats - 메인 룬 가져오기
				int main = participantStats.getPerk0();
				Rune mainRune = lolService.getLolApiMainRune(main);

				// 개인 - Match - Participants - participant - ParticipantStats - 서브 룬 가져오기
				int sub = participantStats.getPerkSubStyle();
				Rune subRune = lolService.getLolApiSubRune(sub);

				// 개인 - Match - Participants - participant - ParticipantStats - 메인 룬 설정
				participant.setMainRune(mainRune);

				// 개인 - Match - Participants - participant - ParticipantStats - 서브 룬 설정
				participant.setSubRune(subRune);

				// 개인 - Match - Participants - participant - Spell 설정
				int spell1Id = participant.getSpell1Id();
				LolApiSpell lolApispell1 = lolService.getLolApiSpell(spell1Id);
				participant.setSpell1(lolApispell1);

				int spell2Id = participant.getSpell2Id();
				LolApiSpell lolApispell2 = lolService.getLolApiSpell(spell2Id);
				participant.setSpell2(lolApispell2);

				// 개인 - Match - Participants - participant - ParticipantStats - KDA 가져오기
				int kills = participantStats.getKills();
				int deaths = participantStats.getDeaths();
				int assists = participantStats.getAssists();

				// 개인 - Match - Participants - participant - ParticipantStats - 평점 구하기
				double ratio;
				String ratioRs = null;

				if (deaths == 0) {
					ratio = (kills + assists) * 2;
					ratioRs = "Perfect";
				} else {
					DecimalFormat form = new DecimalFormat("#,##0.00:1");

					ratio = (kills + assists) / (double) deaths;
					ratioRs = form.format(ratio);
				}

				// 개인 - Match - Participants - participant - ParticipantStats - 평점(ratioRs) 설정
				participantStats.setRatio(ratio);
				participantStats.setRatioRs(ratioRs);

				// 개인 - Match - Participants - participant - ParticipantStats - CS 구하기
				int minions = participantStats.getTotalMinionsKilled();
				int neturalMinions = participantStats.getNeutralMinionsKilled();

				int cs = minions + neturalMinions;

				// 개인 - Match - Participants - participant - ParticipantStats - CS 설정
				participantStats.setCs(cs);

				// 개인 - Match - Participants - participant - ParticipantStats - 분당 CS 구하기
				double minuteCs = Math.round((cs / (gameDuration / 60.0) * 10)) / 10.0;

				// 개인 - Match - Participants - participant - ParticipantStats - 분당 CS 설정
				participantStats.setMinuteCs(minuteCs);

				// 개인(API) - Match - Participants - participant - ParticipantStats - item 가져오기
				int item0 = participantStats.getItem0();
				LolApiItem lolApiItem0 = lolService.getLolApiItem(item0);

				int item1 = participantStats.getItem1();
				LolApiItem lolApiItem1 = lolService.getLolApiItem(item1);

				int item2 = participantStats.getItem2();
				LolApiItem lolApiItem2 = lolService.getLolApiItem(item2);

				int item3 = participantStats.getItem3();
				LolApiItem lolApiItem3 = lolService.getLolApiItem(item3);

				int item4 = participantStats.getItem4();
				LolApiItem lolApiItem4 = lolService.getLolApiItem(item4);

				int item5 = participantStats.getItem5();
				LolApiItem lolApiItem5 = lolService.getLolApiItem(item5);

				int item6 = participantStats.getItem6();
				LolApiItem lolApiItem6 = lolService.getLolApiItem(item6);

				// 개인 - Match - Participants - participant - ParticipantStats - lolApiItem 설정
				participantStats.setLolApiItem0(lolApiItem0);
				participantStats.setLolApiItem1(lolApiItem1);
				participantStats.setLolApiItem2(lolApiItem2);
				participantStats.setLolApiItem3(lolApiItem3);
				participantStats.setLolApiItem4(lolApiItem4);
				participantStats.setLolApiItem5(lolApiItem5);
				participantStats.setLolApiItem6(lolApiItem6);

				// 개인 - Match - participantIdentities 가져오기
				List<ParticipantIdentity> participantIdentities = lolApiMatch.getParticipantIdentities();

				// 개인 - Match - participantIdentities - participantIdentity 가져오기
				ParticipantIdentity participantIdentity = participantIdentities.get(participantIdentitiesIndex++);

				// 개인 - Match - participantIdentities - participantIdentity - player 가져오기
				Player player = participantIdentity.getPlayer();

				String summonerName = player.getSummonerName();

				/* 단체 - 참가자 이름 설정 */
				participant.setSummonerName(summonerName);
				
				String summonerId = player.getSummonerId();
				
				String championIdStr = lolApiChampion.getChampionId();
				
				participantIdentity.setChampionId(championIdStr);
				
				/* 단체(API) - 참가자 리그 리스트 가져오기 */
				List<LolApiLeagueEntry> lolApiParticipantLeagueEntryList = lolApiService.getLolApiLeagueEntry(summonerId);

				for(LolApiLeagueEntry lolApiLeagueEntry : lolApiParticipantLeagueEntryList) {
					
					/* 단체(API) - 참가자 리그 리스트 - 리그 설정 */
					String queueType = lolApiLeagueEntry.getQueueType();
					
					DecimalFormat form = new DecimalFormat("#,##0.00");
					
					if(lolApiLeagueEntryList.size() == 2) {
						if (queueType.equals("RANKED_FLEX_SR")) {
							participant.setFlexRank(lolApiLeagueEntry);
							
							int flexWins = participant.getFlexRank().getWins();
							int flexLosses = participant.getFlexRank().getLosses();
							int flexTotal = flexWins + flexLosses;
							participant.getFlexRank().setTotal(flexTotal);
							
							double flexOdds = flexWins / (double) (flexWins + flexLosses) * 100;
							String flexOddsRs = form.format(flexOdds);
							participant.getFlexRank().setOdds(flexOddsRs);
						} 
						if (queueType.equals("RANKED_SOLO_5x5")) {
							participant.setSoloRank(lolApiLeagueEntry);
							
							int soloWins = participant.getSoloRank().getWins();
							int soloLosses = participant.getSoloRank().getLosses();
							int soloTotal = soloWins + soloLosses;
							participant.getSoloRank().setTotal(soloTotal);
					
							double soloOdds = soloWins / (double) (soloWins + soloLosses) * 100;
							String soloOddsRs = form.format(soloOdds);
							participant.getSoloRank().setOdds(soloOddsRs);
						}	
					} else if(lolApiLeagueEntryList.size() == 1) {
						if (queueType.equals("RANKED_FLEX_SR")) {
							participant.setSoloRank(lolApiLeagueEntry);
							
							int soloWins = participant.getSoloRank().getWins();
							int soloLosses = participant.getSoloRank().getLosses();
							int soloTotal = soloWins + soloLosses;
							participant.getSoloRank().setTotal(soloTotal);
							
							double soloOdds = soloWins / (double) (soloWins + soloLosses) * 100;
							String soloOddsRs = form.format(soloOdds);
							participant.getSoloRank().setOdds(soloOddsRs);
						} 
						else if (queueType.equals("RANKED_SOLO_5x5")) {
							participant.setFlexRank(lolApiLeagueEntry);
							
							int flexWins = participant.getFlexRank().getWins();
							int flexLosses = participant.getFlexRank().getLosses();
							int flexTotal = flexWins + flexLosses;
							
							double flexOdds = flexWins / (double) (flexWins + flexLosses) * 100;
							String flexOddsRs = form.format(flexOdds);
							
							participant.getFlexRank().setTotal(flexTotal);
							participant.getFlexRank().setOdds(flexOddsRs);
						}
					}
				}
			}
			
			for(Participant participantSecond : participants) {
				ParticipantStats participantStats = participantSecond.getStats();
				
				int kills = participantStats.getKills();
				int assists = participantStats.getAssists();
				
				// 관여율 구하기
				int ka = kills + assists;

				int teamId = participantSecond.getTeamId();
				
				if (teamId == 100) {
					team100InvolvementRate = (int) Math.round(ka / (double) lolApiMatch.getLosingTeamTotalKills() * 100);

				} else if (teamId == 200) {
					team200InvolvementRate = (int) Math.round(ka / (double) lolApiMatch.getWinningTeamTotalKills() * 100);
				}

				// 개인 - Match - Participants - participant - ParticipantStats - 팀(100, 200) 킬
				// 관여율 설정
				participantStats.setTeam100InvolvementRate(team100InvolvementRate);
				participantStats.setTeam200InvolvementRate(team200InvolvementRate);
			}
			
			// 개인 - MatchReference 안에 Match 적용
			lolApiMatchReference.setLolApiMatch(lolApiMatch);
		}

		return "LOL/summoner";
	}
}