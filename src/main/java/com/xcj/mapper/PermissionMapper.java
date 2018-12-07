package com.xcj.mapper;

import java.util.List;

import com.xcj.pojo.Permission;
import com.xcj.utils.MyMapper;

public interface PermissionMapper extends MyMapper<Permission> {
	
	public List<Permission> findPermsByRoleId(Long id);
}