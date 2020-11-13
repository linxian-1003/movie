package com.neu.movie.mapper;

import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Cinema;
import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.query.CinemaQuery;
import com.neu.movie.query.UserQuery;
import org.apache.ibatis.annotations.Param;

import javax.management.Query;
import java.util.List;

public interface CinemaMapper extends BaseMapper<Cinema, CinemaQuery> {
}
