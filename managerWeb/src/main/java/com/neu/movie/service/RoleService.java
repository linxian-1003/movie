package com.neu.movie.service;

import com.neu.movie.domain.Role;
import com.neu.movie.query.RoleQuery;

public interface RoleService extends BaseService<Role,RoleQuery> {
    int[] findByUserId(Integer userId);

    boolean bind(Integer roleId, String[] menuIds);

    int[] findPermissionIds(Integer roleId);
}
