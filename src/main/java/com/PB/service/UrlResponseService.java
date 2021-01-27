package com.PB.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.PB.dao.UrlResponseDao;
import com.PB.dto.LOL.UrlResponse;

@Service
public class UrlResponseService {
	@Autowired
	private RestTemplateBuilder restTemplateBuilder;
	@Autowired
	private UrlResponseDao urlResponseDao;

	public String callUrl(String url) {
		UrlResponse urlResponse = urlResponseDao.getUrlResponse(url);
		String rs = null;

		if (urlResponse == null) {
			RestTemplate restTemplate = restTemplateBuilder.build();
			rs = restTemplate.getForObject(url, String.class);
			urlResponseDao.saveUrlResponse(url, rs);
		} else if ( urlResponse.isOld() ) {
			RestTemplate restTemplate = restTemplateBuilder.build();
			rs = restTemplate.getForObject(url, String.class);
			urlResponseDao.updateUrlResponse(url, rs);
		}
		else {
			rs = urlResponse.getBody();
		}

		return rs;
	}
}