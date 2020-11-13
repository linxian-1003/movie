package com.neu.movie.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.neu.movie.base.BaseDomain;
import com.neu.movie.base.BaseMapper;
import com.neu.movie.base.BaseQuery;
import com.neu.movie.exception.BusiException;
import com.neu.movie.utils.MD5Util;


import javax.annotation.Resource;
import java.util.List;

public class BaseServiceImpl<T extends BaseDomain,E extends BaseQuery> implements BaseService<T,E>{

    protected BaseMapper<T,E> baseMapper;

    @Override
    public PageInfo<T> findByQuery(E query) {
        PageInfo<T> pageInfo=null;
        if(query.isPaging()){
            //要分页
            PageHelper.startPage(query.getPage(),query.getPageSize());
            Page<T> page= (Page<T>) baseMapper.findByQuery(query);
            pageInfo = page.toPageInfo();
        }else{
            //不用分页
            List<T> users = baseMapper.findByQuery(query);
            pageInfo = new PageInfo<>();
            pageInfo.setList(users);
            pageInfo.setSize(users.size());
        }
        return pageInfo;
    }

    @Override
    public boolean deleteByIds(String[] idArray) {
        int count = baseMapper.deleteByIds(idArray);
        if(count!=idArray.length){
            throw new BusiException("删除失败");
        }
        return true;
    }

    @Override
    public boolean add(T t) {
        return baseMapper.add(t)==1;
    }

    @Override
    public T findById(int id) {
        return baseMapper.findById(id);
    }

    @Override
    public boolean update(T t) {
        return baseMapper.update(t)==1;
    }
}
