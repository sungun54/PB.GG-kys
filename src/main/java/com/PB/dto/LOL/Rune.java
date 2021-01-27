package com.PB.dto.LOL;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Rune {
	private int id;
	private int runeId;
	private String key;
	private String icon; 
	private String name;
	private int slotsRunesId;
	private String slotsRunesKey;
	private String slotsRunesName;
	private String slotsRunesIcon;
	private String slotsRunesShortDesc;
	private String slotsRunesLongDesc;
}