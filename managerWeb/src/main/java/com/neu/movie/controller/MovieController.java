package com.neu.movie.controller;

import com.neu.movie.utils.JsonModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import com.neu.movie.domain.Movie;
import com.neu.movie.query.MovieQuery;
import com.neu.movie.service.MovieService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/movies")
public class MovieController extends BaseController<Movie,MovieQuery>{
	
	@Autowired
	public void setMovieService(MovieService movieService) {
		this.baseService = movieService;
	}

	@Override
	public  Movie beforeEdit( Movie  movie) {
	    return movie;
	}

	@Override
	public void beforeSaveUI(Model model, Movie  movie) {

	}

	@ResponseBody
	@RequestMapping("new")
	public JsonModel movieNew(String cinemaId){
		JsonModel jsonModel = new JsonModel();
		List<Movie> movieList = ((MovieService)this.baseService).movicNew(cinemaId);
		jsonModel.setData(movieList);
		jsonModel.setResult(true);
		return jsonModel;
	}
	@ResponseBody
	@RequestMapping("old")
	public JsonModel movicOld(String cinemaId){
		JsonModel jsonModel = new JsonModel();
		List<Movie> movieList = ((MovieService)this.baseService).movieOld(cinemaId);
		jsonModel.setData(movieList);
		jsonModel.setResult(true);
		return jsonModel;
	}
}