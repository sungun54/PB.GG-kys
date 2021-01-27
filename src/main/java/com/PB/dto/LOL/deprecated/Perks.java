package com.PB.dto.LOL.deprecated;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Perks {
	private List<Long> perkIds;
	private long perkStyle;
	private long perkSubStyle;
}