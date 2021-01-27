package com.PB.dto.LOL.deprecated;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MiniSeries {
	private int losses;
	private String progress;
	private int target;
	private int wins;
}