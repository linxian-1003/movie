package com.neu.movie.service;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.query.UserQuery;

import java.util.List;

public interface UserService extends BaseService<User,UserQuery> {
    User login(String loginName, String password);

    List<Menu> findAllPermission(Integer userId);
}
