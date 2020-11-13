package com.neu.movie.mapper;

import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Role;
import com.neu.movie.query.RoleQuery;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper extends BaseMapper<Role,RoleQuery> {
    int[] findByUserId(Integer userId);

    int unbind(Integer roleId);

    int bind(@Param("roleId") Integer roleId,@Param("menuId")String menuId);

    int[] findPermissionIds(Integer roleId);
}
