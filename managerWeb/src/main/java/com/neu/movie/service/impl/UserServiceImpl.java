package com.neu.movie.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.movie.domain.Menu;
import com.neu.movie.domain.Role;
import com.neu.movie.domain.User;
import com.neu.movie.exception.BusiException;
import com.neu.movie.mapper.UserMapper;
import com.neu.movie.query.UserQuery;
import com.neu.movie.service.BaseServiceImpl;
import com.neu.movie.service.UserService;
import com.neu.movie.utils.ConstantUtil;
import com.neu.movie.utils.MD5Util;
import com.neu.movie.utils.SysUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<User,UserQuery> implements UserService {
    @Autowired
    public void setUserMapper(UserMapper userMapper){
        this.baseMapper = userMapper;
    }

    @Override
    public User login(String loginName, String password) {
        password = MD5Util.degist(password);
        return ((UserMapper)baseMapper).login(loginName,password);
    }

    @Override
    public List<Menu> findAllPermission(Integer userId) {
        return ((UserMapper)baseMapper).findAllPermission(userId);
    }

    @Override
    public boolean add(User user) {
        //保存user的时候同时也角色绑定

        //保存user
        user.setPassword(MD5Util.degist(SysUtil.getValue("password")));
        user.setStatus(ConstantUtil.STATUS_USER_UNACTIVED);
        super.add(user);

        //绑定

        List<Role> roles =  user.getRoles();
        if(roles!=null){
            int userId = user.getId();

            for(Role role : roles){
                ((UserMapper)baseMapper).bind(userId,role.getId());
            }
        }
        return true;
    }

    @Override
    public boolean update(User user) {
        //解除之前和当前user绑定的角色
        ((UserMapper)baseMapper).unbind(user.getId());
        List<Role> roles =  user.getRoles();
        if(roles!=null){
            int userId = user.getId();

            for(Role role : roles){
                ((UserMapper)baseMapper).bind(userId,role.getId());
            }
        }
        //重写绑定
        return super.update(user);
    }
}
