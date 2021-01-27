package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiSpell {
	private int id;
	private String type; 
	private String version;
	private String data;
	private String spellId;
	private String name;
	private String description;
	private int cooldown;
	private int key;
	private int summonerLevel;
	private String mode;
	private int range;
}
