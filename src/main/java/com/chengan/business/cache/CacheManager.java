package com.chengan.business.cache;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import com.chengan.business.cache.dto.BaseModel;

@Component
public class CacheManager {

	@Autowired
	RedisTemplate<String, BaseModel> redisTemplate;
	@Autowired
	RedisTemplate<String, String> redisStr;

	public void save(String key, BaseModel model, int min) {
		ValueOperations<String, BaseModel> opsForValue = redisTemplate.opsForValue();
		if (min < 0)
			opsForValue.set(key, model);
		else
			opsForValue.set(key, model, min, TimeUnit.MINUTES);
	}

	public void save(String key, BaseModel model) {
		save(key, model, -1);
	}

	public BaseModel get(String key) {
		ValueOperations<String, BaseModel> opsForValue = redisTemplate.opsForValue();
		return opsForValue.get(key);
	}

	public void saveStr(String key, String value, int min) {
		ValueOperations<String, String> opsForValue = redisStr.opsForValue();
		if (min < 0)
			opsForValue.set(key, value);
		else
			opsForValue.set(key, value, min, TimeUnit.MINUTES);
	}

	public void saveStr(String key, String value) {
		saveStr(key, value, -1);
	}

	public String getStr(String key) {
		ValueOperations<String, String> opsForValue = redisStr.opsForValue();
		return opsForValue.get(key);
	}

}
