package com.xcj.mapper;

import com.xcj.pojo.User;
import com.xcj.utils.MyMapper;

public interface UserMapper extends MyMapper<User> {
	
	User queryUserByName(String userName);
}