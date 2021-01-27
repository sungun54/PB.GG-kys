package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LolApiItem {
	private int id;
	private String key;
	private String name;
	private String explain;
	private int buyPrice;
	private int sellPrice;
	private String tag;
}