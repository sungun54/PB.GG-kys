package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiChampion {
	private int id;
	private String championId;
	private int key;
	private String name;
	private String title;
	private String explain;
	private String partype;
	
	private String type;
	private String version;
	private String blurb;
	private String image;
	private String imageSprite;
	private String tags1;
	private String tags2;
}