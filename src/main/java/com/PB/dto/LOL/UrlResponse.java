package com.PB.dto.LOL;

import com.PB.util.Util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UrlResponse {
	private int uid;
	private String regDate;
	private String updateDate;
	private String url;
	private String body;

	public boolean isOld() {
		long passedSeconds = Util.getPassedSeconds(updateDate);

		return passedSeconds > 60 * 60 * 24;
	}
}