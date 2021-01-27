package com.PB.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.PB.dto.LOL.LolApiChampion;
import com.PB.dto.LOL.LolApiItem;
import com.PB.dto.LOL.LolApiSpell;
import com.PB.dto.LOL.LolApiSummoner;
import com.PB.dto.LOL.Rune;

@Mapper
public interface LolApiDao {
	LolApiSummoner getLolApiSummoner(@Param("name") String name);

	void saveLolApiSummoner(LolApiSummoner lolApiSummoner);

	void updateLolApiSummoner(LolApiSummoner lolApiSummoner);

	LolApiChampion getLolApiChampion(int key);

	LolApiSpell getLolApiSpell(int spellId);

	Rune getLolApiMainRune(int main);

	Rune getLolApiSubRune(int sub);

	LolApiItem getLolApiItem(int key);
}
