package com.xcj.service;

import java.util.List;

import com.xcj.pojo.User;

public interface UserService {

	public void saveUser(User user) throws Exception;

	public void updateUser(User user);

	public void deleteUser(String userId);

	public User queryUserById(String userId);
	
	public User queryUserByName(String userName);

	public List<User> queryUserList(User user);
	
	public List<User> queryUserListPaged(User user, Integer page, Integer pageSize);
	
}
