package com.neu.movie.controller;

import com.neu.movie.domain.Cinema;
import com.neu.movie.exception.ParamException;
import com.neu.movie.query.CinemaQuery;
import com.neu.movie.service.CinemaService;
import com.neu.movie.service.SeatService;
import com.neu.movie.utils.JsonModel;
import com.neu.movie.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import com.neu.movie.controller.BaseController;
import com.neu.movie.domain.Room;
import com.neu.movie.query.RoomQuery;
import com.neu.movie.service.RoomService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/rooms")
public class RoomController extends BaseController<Room,RoomQuery>{

	@Autowired
	CinemaService cinemaService;

	@Autowired
	SeatService seatService;


	@Autowired
	public void setRoomService(RoomService roomService) {
		this.baseService = roomService;
	}

	@Override
	public  Room beforeEdit( Room  room) {
	    return room;
	}

	@Override
	public void beforeSaveUI(Model model, Room  room) {
		CinemaQuery cinemaQuery = new CinemaQuery();
		cinemaQuery.setPaging(false);
		List<Cinema> cinemaList = cinemaService.findByQuery(cinemaQuery).getList();
		model.addAttribute("cinemas",cinemaList);
	}


	@RequestMapping(value="{id}/seats/batch",method= RequestMethod.POST,headers = {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel batchSeat(@PathVariable("id") int roomId){
		JsonModel jsonModel = new JsonModel();

		//调用seatService.add
		seatService.batchAdd(roomId);

		jsonModel.setResult(true);
		jsonModel.setMsg("成功");
		return jsonModel;
	}



	@RequestMapping(value="{id}/task",method = RequestMethod.GET)
	public String task(Model model,@PathVariable("id") Integer roomId){
		model.addAttribute("roomId",roomId);
		return "room/task";
	}

	//request.contextPath+"/rooms/"+roomId+"/seats/batch post
}