package com.neu.movie.service.impl;

import org.springframework.stereotype.Service;
import com.neu.movie.mapper.MovieMapper;
import com.neu.movie.domain.Movie;
import com.neu.movie.query.MovieQuery;
import com.neu.movie.service.MovieService;
import com.neu.movie.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class MovieServiceImpl extends BaseServiceImpl<Movie, MovieQuery> implements MovieService{

	@Autowired
	public void setMovieMapper(MovieMapper movieMapper){
		this.baseMapper = movieMapper;
	}

	@Override
	public List<Movie> movicNew(String cinemaId) {
		return ((MovieMapper)this.baseMapper).movieNew(cinemaId);
	}

	@Override
	public List<Movie> movieOld(String cinemaId) {
		return ((MovieMapper)this.baseMapper).movieOld(cinemaId);
	}
}