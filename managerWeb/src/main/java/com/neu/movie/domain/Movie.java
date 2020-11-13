package com.neu.movie.domain;
import com.neu.movie.base.BaseDomain;
import java.math.BigDecimal;
/**
  * 
  * @ClassName: Movie
  * @Company: 麦子科技
  * @Description: Movie实体
  * @author 技术部-刘强峰
  * @date 2016年5月1日 下午1:38:35
  *
 */
public class Movie extends BaseDomain {
    //名字
    private String name;                                      
    //图片
    private String img;                                      
    //标签
    private String tag;                                      
    //上映时间
    private String borthday;                                      
    //预告
    private String preview;                                      
     //得分
    private Integer score;                                    
    //描述
    private String descr;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getBorthday() {
        return borthday;
    }

    public void setBorthday(String borthday) {
        this.borthday = borthday;
    }

    public String getPreview() {
        return preview;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
}