package com.neu.movie.service;

import com.github.pagehelper.PageInfo;
import com.neu.movie.base.BaseDomain;
import com.neu.movie.base.BaseQuery;

//E extends BaseQuery代表的是E必须是extends BaseQuery

public interface BaseService<T extends BaseDomain,E extends BaseQuery> {
    PageInfo<T> findByQuery(E query);

    boolean deleteByIds(String[] idArray);

    boolean add(T T);

    T findById(int TId);

    boolean update(T T);
}
