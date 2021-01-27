package com.PB.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDao {
	void championPush(String array0, String array1, String array2, String array3, String array4, String array5,
			String array6, String array7, String array8, String array9, String array10, String array11);
	
	void runePush(String array0, String array1, String array2, String array3, String array4, String array5,
			String array6, String array7, String array8, String array9);

	void spellPush(String array0, String array1, String array2, String array3, String array4, String array5,
			String array6, String array7, String array8, String array9, String array10);
	
	void itemPush(String array0, String array1, String array2, String array3, String array4, String array5);
}
