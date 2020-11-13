package com.neu.movie.mapper;

import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Menu;
import com.neu.movie.query.MenuQuery;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu,MenuQuery> {
    List<Menu> findLeftMenu();
}
