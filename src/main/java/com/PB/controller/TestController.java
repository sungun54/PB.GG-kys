package com.PB.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.PB.dao.TestDao;

// 프로젝트 시작할 때 처음 시도했던 메소드는 맨 아래에 주석 처리함.
@Controller
public class TestController {
	@Autowired
	private TestDao testDao;

	@RequestMapping("/usr/test/ChampPush")
	@ResponseBody
	public String ChampPush() {
		File file = new File("Champion.csv");

		List<String> lines = null;

		try {
			lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (String line : lines) {
			String[] array = line.split(",", -1);
			String array0 = array[0];
			String array1 = array[1];
			String array2 = array[2];
			String array3 = array[3];
			String array4 = array[4];
			String array5 = array[5];
			String array6 = array[6];
			String array7 = array[7];
			String array8 = array[8];
			String array9 = array[9];
			String array10 = array[10];
			String array11 = array[11];

			testDao.championPush(array0, array1, array2, array3, array4, array5, array6, array7, array8, array9, array10, array11);
		}

		return lines.get(0);
	}

	@RequestMapping("/usr/test/RunePush")
	@ResponseBody
	public String RunePush() {
		File file = new File("RunesReforged5.csv");

		List<String> lines = null;

		try {
			lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (String line : lines) {
			String[] array = line.split(",", -1);
			String array0 = array[0];
			String array1 = array[1];
			String array2 = array[2];
			String array3 = array[3];
			String array4 = array[4];
			String array5 = array[5];
			String array6 = array[6];
			String array7 = array[7];
			String array8 = array[8];
			String array9 = array[9];

			testDao.runePush(array0, array1, array2, array3, array4, array5, array6, array7, array8, array9);
		}

		return lines.get(0);
	}

	@RequestMapping("/usr/test/SpellPush")
	@ResponseBody
	public String SpellPush() {
		File file = new File("SummonerSpell.csv");

		List<String> lines = null;

		try {
			lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (String line : lines) {
			String[] array = line.split(",", -1);
			String array0 = array[0];
			String array1 = array[1];
			String array2 = array[2];
			String array3 = array[3];
			String array4 = array[4];
			String array5 = array[5];
			String array6 = array[6];
			String array7 = array[7];
			String array8 = array[8];
			String array9 = array[9];
			String array10 = array[10];

			testDao.spellPush(array0, array1, array2, array3, array4, array5, array6, array7, array8, array9, array10);
		}

		return lines.get(0);
	}
	
	@RequestMapping("/usr/test/ItemPush")
	@ResponseBody
	public String ItemPush() {
		File file = new File("Item.csv");

		List<String> lines = null;

		try {
			lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (String line : lines) {
			String[] array = line.split(",", -1);
			String array0 = array[0];
			String array1 = array[1];
			String array2 = array[2];
			String array3 = array[3];
			String array4 = array[4];
			String array5 = array[5];

			testDao.itemPush(array0, array1, array2, array3, array4, array5);
		}

		return lines.get(0);
	}
	
	
//	@Autowired
//	private RestTemplateBuilder restTemplateBuilder;
//	private final ObjectMapper objectMapper = new ObjectMapper();
//	private final String apiKey = "RGAPI-894eae05-e92e-4c69-b6db-f12f6622105c";
//
//	@RequestMapping("/usr/test/summonerFinal")
//	public String showSummonerFinal(Model model) {
//		return "LOL/summoner/summonerFinal";
//	}
//
//	@RequestMapping("/usr/test/domesticProTeam/list")
//	public String showDomesticProTeamList() {
//		return "LOL/domesticProTeam/list";
//	}
//	
//	@RequestMapping(value = "/usr/test/getLolApiMatchWinningTeamNo", method = RequestMethod.GET)
//	@ResponseBody
//	public int getLolApiMatchData(String matchId, HttpServletResponse response) throws IOException {
//		RestTemplate restTemplate = restTemplateBuilder.build();
//		JsonNode jsonNode = restTemplate.getForObject(
//				"https://kr.api.riotgames.com/lol/match/v4/matches/" + matchId + "?api_key=" + apiKey, JsonNode.class);
//
//		if (jsonNode.at("/teams/0/win").textValue().equals("Win")) {
//			return 0;
//		}
//
//		return 1;
//	}
//
//	@RequestMapping(value = "/usr/test/getLolApiMatchesData", method = RequestMethod.GET)
//	@ResponseBody
//	public int getLolApiMatchesTeamData(HttpServletResponse response) throws IOException {
//		RestTemplate restTemplate = restTemplateBuilder.build();
//		JsonNode jsonNode = restTemplate.getForObject(
//				"https://kr.api.riotgames.com/lol/match/v4/matches/4614877394?api_key=" + apiKey, JsonNode.class);
//
//		return Integer.parseInt(jsonNode.at("/teams/1/teamId").toString());
//	}
//
//	@RequestMapping("/usr/test/getLolApiMatches")
//	@ResponseBody
//	public List<Match> getLolApiMatches(String accountId) {
//		String apiUri = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?api_key="
//				+ apiKey;
//		RestTemplate restTemplate = restTemplateBuilder.build();
//		JsonNode jsonNode = restTemplate.getForObject(apiUri, JsonNode.class);
//
//		List<Match> matches = new ArrayList<>();
//
//		for (JsonNode matchNode : jsonNode.findPath("matches")) {
//			Match matchMap = objectMapper.convertValue(matchNode, new TypeReference<Match>() {
//			});
//			matches.add(matchMap);
//
//		}
//		return matches;
//	}
//
//	@RequestMapping("/usr/test/getLolApiMatchesMap")
//	@ResponseBody
//	public List<Map<String, Object>> getLolApiMatchesMap(String accountId) {
//		String apiUri = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?api_key="
//				+ apiKey;
//		RestTemplate restTemplate = restTemplateBuilder.build();
//		JsonNode jsonNode = restTemplate.getForObject(apiUri, JsonNode.class);
//
//		List<Map<String, Object>> matches = new ArrayList<>();
//
//		for (JsonNode matchNode : jsonNode.findPath("matches")) {
//			Map<String, Object> matchMap = objectMapper.convertValue(matchNode,
//					new TypeReference<Map<String, Object>>() {
//					});
//			matches.add(matchMap);
//
//		}
//
//		return matches;
//	}
}
