package com.xcj.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xcj.pojo.IMoocJSONResult;
import com.xcj.pojo.User;
import com.xcj.utils.JsonUtils;
import com.xcj.utils.RedisOperator;

@RestController
@RequestMapping("redis")
public class RedisController {
	
	@Autowired
	private StringRedisTemplate strRedis;
	
	@Autowired
	private RedisOperator redis;
	
	@RequestMapping("/test")
	public IMoocJSONResult test() {
		
		strRedis.opsForValue().set("imooc-cache", "hello 慕课网~~~~~~");
		
		User user = new User();
		user.setId(1001l);
		user.setUsername("明天");
		user.setPassword("abc123");
		strRedis.opsForValue().set("json:user", JsonUtils.objectToJson(user));
		
		User jsonUser = JsonUtils.jsonToPojo(strRedis.opsForValue().get("json:user2"), User.class);
		
		return IMoocJSONResult.ok(jsonUser);
	}
	
	@RequestMapping("/getJsonList")
	public IMoocJSONResult getJsonList() {
		
		User user = new User();
		user.setUsername("慕课网");
		user.setPassword("123456");
		
		User u1 = new User();
		u1.setUsername("imooc");
		u1.setPassword("123456");
		
		User u2 = new User();
		u2.setUsername("hello imooc");
		u2.setPassword("123456");
		
		List<User> userList = new ArrayList<>();
		userList.add(user);
		userList.add(u1);
		userList.add(u2);
		
		redis.set("json:info:userlist", JsonUtils.objectToJson(userList), 2000);
		
		String userListJson = redis.get("json:info:userlist");
		List<User> userListBorn = JsonUtils.jsonToList(userListJson, User.class);
		
		return IMoocJSONResult.ok(userListBorn);
	}
}