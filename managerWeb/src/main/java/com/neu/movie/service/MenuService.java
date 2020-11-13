package com.neu.movie.service;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.Role;
import com.neu.movie.query.MenuQuery;
import com.neu.movie.query.RoleQuery;

import javax.management.Query;
import java.util.List;

public interface MenuService extends BaseService<Menu, MenuQuery> {
    List<Menu> findLeftMenu();
}
