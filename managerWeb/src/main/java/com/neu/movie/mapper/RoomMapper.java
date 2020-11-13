package com.neu.movie.mapper;
import com.neu.movie.base.BaseMapper;
import com.neu.movie.domain.Room;
import com.neu.movie.query.RoomQuery;
import com.neu.movie.domain.Room;
import org.apache.ibatis.annotations.Mapper;
public interface RoomMapper extends BaseMapper<Room,RoomQuery> {
}