package com.neu.movie.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.movie.domain.Role;
import com.neu.movie.exception.BusiException;
import com.neu.movie.mapper.RoleMapper;
import com.neu.movie.mapper.UserMapper;
import com.neu.movie.query.RoleQuery;
import com.neu.movie.service.BaseServiceImpl;
import com.neu.movie.service.RoleService;
import com.neu.movie.utils.ConstantUtil;
import com.neu.movie.utils.MD5Util;
import com.neu.movie.utils.SysUtil;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role,RoleQuery> implements RoleService{

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper){
        this.baseMapper = roleMapper;
    }

    @Override
    public int[] findByUserId(Integer userId) {
        return ((RoleMapper)this.baseMapper).findByUserId(userId);
    }

    @Override
    public boolean bind(Integer roleId, String[] menuIds) {
        ((RoleMapper)this.baseMapper).unbind(roleId);
        for(String menuId : menuIds){
            ((RoleMapper)this.baseMapper).bind(roleId,menuId);
        }
        return true;
    }

    @Override
    public int[] findPermissionIds(Integer roleId) {
        return ((RoleMapper)this.baseMapper).findPermissionIds(roleId);
    }
}
