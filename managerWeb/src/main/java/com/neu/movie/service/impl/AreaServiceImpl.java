package com.neu.movie.service.impl;

import com.neu.movie.domain.Area;
import com.neu.movie.mapper.AreaMapper;
import com.neu.movie.query.AreaQuery;
import com.neu.movie.service.BaseServiceImpl;
import com.neu.movie.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaServiceImpl extends BaseServiceImpl<Area,AreaQuery> implements AreaService {
    @Autowired
    public void setAreaMapper(AreaMapper areaMapper){
        this.baseMapper = areaMapper;
    }
}
