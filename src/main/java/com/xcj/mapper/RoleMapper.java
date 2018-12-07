package com.xcj.mapper;

import java.util.List;

import com.xcj.pojo.Role;
import com.xcj.utils.MyMapper;

public interface RoleMapper extends MyMapper<Role> {

	public List<Role> getRoleByUser(Long roleId);

}