package com.neu.movie.service;

import com.neu.movie.domain.Movie;
import com.neu.movie.query.MovieQuery;
import com.neu.movie.service.BaseService;

import java.util.List;

public interface MovieService extends BaseService<Movie,MovieQuery> {
    List<Movie> movicNew(String cinemaId);

    List<Movie> movieOld(String cinemaId);
}