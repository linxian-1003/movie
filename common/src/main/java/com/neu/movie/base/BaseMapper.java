package com.neu.movie.base;

import java.util.List;

//E extends BaseQuery代表的是E必须是extends BaseQuery

public interface BaseMapper<T extends BaseDomain,E extends BaseQuery> {
    List<T> findByQuery(E query);

    int deleteByIds(String[] idArray);

    int add(T T);

    T findById(int TId);

    int update(T T);
}
