package com.neu.movie.service.impl;

import org.springframework.stereotype.Service;
import com.neu.movie.mapper.RoomMapper;
import com.neu.movie.domain.Room;
import com.neu.movie.query.RoomQuery;
import com.neu.movie.service.RoomService;
import com.neu.movie.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class RoomServiceImpl extends BaseServiceImpl<Room, RoomQuery> implements RoomService{

	@Autowired
	public void setRoomMapper(RoomMapper roomMapper){
		this.baseMapper = roomMapper;
	}
}