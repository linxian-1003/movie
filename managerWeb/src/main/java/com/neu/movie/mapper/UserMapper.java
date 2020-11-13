package com.neu.movie.mapper;

import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.query.UserQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<User,UserQuery> {

    //alt + enter 快速修复
    User login(@Param("loginName") String loginName, @Param("password") String password);

    int bind(@Param("userId") int userId, @Param("roleId") Integer roleId);

    int unbind(Integer userId);

    List<Menu> findAllPermission(Integer userId);
}
