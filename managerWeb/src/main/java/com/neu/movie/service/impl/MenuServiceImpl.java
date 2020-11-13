package com.neu.movie.service.impl;

import com.neu.movie.domain.Menu;
import com.neu.movie.mapper.MenuMapper;
import com.neu.movie.query.MenuQuery;
import com.neu.movie.service.BaseServiceImpl;
import com.neu.movie.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl extends BaseServiceImpl<Menu,MenuQuery> implements MenuService{

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper){
        this.baseMapper = menuMapper;
    }

    @Override
    public List<Menu> findLeftMenu() {
        return ((MenuMapper)this.baseMapper).findLeftMenu();
    }
}
