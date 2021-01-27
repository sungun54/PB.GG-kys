package com.PB.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PB.dto.LOL.ChampionInfo;
import com.PB.dto.LOL.LolApiChampion;
import com.PB.service.LolApiService;
import com.PB.service.LolService;

@Controller
public class HomeController {
	@Value("${custom.lolApi.apiKey}")
	private String apiKey;
	
	@Autowired
	private LolApiService lolApiService;
	@Autowired
	private LolService lolService;
	
	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		ChampionInfo lolApiChampionInfo = lolApiService.getChampionInfo();

		List<Integer> freeChampionIds = lolApiChampionInfo.getFreeChampionIds();
		
		List<String> freeChampionIdsStr = new ArrayList<>();
		
		for(int freeChampionId : freeChampionIds) {
			LolApiChampion champion = lolService.getLolApiChampion(freeChampionId);
			
			String championId = champion.getChampionId();
			
			freeChampionIdsStr.add(championId);  
		}
		
		lolApiChampionInfo.setFreeChampionIdsStr(freeChampionIdsStr);
		
		model.addAttribute("championInfo", lolApiChampionInfo);
		
		return "home/main";
	}
	
	@RequestMapping("/")
	public String showIndex() {
		return "redirect:/usr/home/main";
	}
}