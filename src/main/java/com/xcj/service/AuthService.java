package com.xcj.service;

import java.util.List;

import com.xcj.pojo.Role;

public interface AuthService {
	
	public List<Role> getRoleByUser(Long roleId);

}
