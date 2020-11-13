package com.neu.movie.service.impl;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.Role;
import com.neu.movie.domain.Cinema;
import com.neu.movie.mapper.CinemaMapper;
import com.neu.movie.query.CinemaQuery;
import com.neu.movie.service.BaseServiceImpl;
import com.neu.movie.service.CinemaService;
import com.neu.movie.utils.ConstantUtil;
import com.neu.movie.utils.MD5Util;
import com.neu.movie.utils.SysUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CinemaServiceImpl extends BaseServiceImpl<Cinema,CinemaQuery> implements CinemaService {
    @Autowired
    public void setCinemaMapper(CinemaMapper cinemaMapper){
        this.baseMapper = cinemaMapper;
    }
}
