package com.neu.movie.mapper;
import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Movie;
import com.neu.movie.query.MovieQuery;
import com.neu.movie.domain.Movie;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface MovieMapper extends BaseMapper<Movie,MovieQuery> {
    List<Movie> movieNew(String cinemaId);

    List<Movie> movieOld(String cinemaId);
}