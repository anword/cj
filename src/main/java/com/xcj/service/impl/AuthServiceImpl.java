package com.xcj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcj.mapper.PermissionMapper;
import com.xcj.mapper.RoleMapper;
import com.xcj.pojo.Permission;
import com.xcj.pojo.Role;

@Service
public class AuthServiceImpl {
	
	@Autowired
	private PermissionMapper permissionMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> getRoleByUser(Long roleId) {
		return roleMapper.getRoleByUser(roleId);
	}

	public List<Permission> findPermsByRoleId(Long id) {
		return permissionMapper.findPermsByRoleId(id);
	}
	
}
