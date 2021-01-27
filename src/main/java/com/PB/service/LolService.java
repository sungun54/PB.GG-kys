package com.PB.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.PB.dao.LolApiDao;
import com.PB.dto.LOL.LolApiChampion;
import com.PB.dto.LOL.LolApiItem;
import com.PB.dto.LOL.LolApiSpell;
import com.PB.dto.LOL.LolApiSummoner;
import com.PB.dto.LOL.Rune;

@Service
public class LolService {
	@Autowired
	LolApiDao lolApiDao;

	@Autowired
	LolApiService lolApiService;

	public LolApiSummoner getLolApiSummoner(String name) {
		LolApiSummoner lolApiSummoner = lolApiDao.getLolApiSummoner(name);

		if (lolApiSummoner == null) {
			lolApiSummoner = lolApiService.getLolApiSummoner(name);
			lolApiDao.saveLolApiSummoner(lolApiSummoner);
		} else if (lolApiSummoner.isOld()) {
			lolApiSummoner = lolApiService.getLolApiSummoner(name);
			lolApiDao.updateLolApiSummoner(lolApiSummoner);
		}

		return lolApiSummoner;

	}

	public LolApiChampion getLolApiChampion(int key) {
		return lolApiDao.getLolApiChampion(key);
	}

	public LolApiSpell getLolApiSpell(int spellId) {
		return lolApiDao.getLolApiSpell(spellId);
	}

	public Rune getLolApiMainRune(int main) {
		return lolApiDao.getLolApiMainRune(main);
	}

	public Rune getLolApiSubRune(int sub) {
		return lolApiDao.getLolApiSubRune(sub);
	}

	public LolApiItem getLolApiItem(int key) {
		return lolApiDao.getLolApiItem(key);
	}

}
