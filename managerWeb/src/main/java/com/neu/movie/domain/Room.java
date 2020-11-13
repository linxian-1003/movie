package com.neu.movie.domain;
import com.neu.movie.base.BaseDomain;
import java.math.BigDecimal;
/**
  * 
  * @ClassName: Room
  * @Company: 麦子科技
  * @Description: Room实体
  * @author 技术部-刘强峰
  * @date 2016年5月1日 下午1:38:35
  *
 */
public class Room extends BaseDomain {
    //房间名字
    private String name;                                      
     //座位数量
    private Integer seatCount;                                    
     //购买数量
    private int buyCount;
     //剩余数量
    private int leafCount;
    //电影名字
    private String movieName;                                      
     //电影院
    private Integer cinemaId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(Integer seatCount) {
        this.seatCount = seatCount;
    }

    public Integer getBuyCount() {
        return buyCount;
    }

    public void setBuyCount(Integer buyCount) {
        this.buyCount = buyCount;
    }

    public Integer getLeafCount() {
        return leafCount;
    }

    public void setLeafCount(Integer leafCount) {
        this.leafCount = leafCount;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }
}