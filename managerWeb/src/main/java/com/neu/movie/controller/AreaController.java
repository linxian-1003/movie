package com.neu.movie.controller;

import com.github.pagehelper.PageInfo;
import com.neu.movie.domain.Area;
import com.neu.movie.domain.Cinema;
import com.neu.movie.query.AreaQuery;
import com.neu.movie.query.CinemaQuery;
import com.neu.movie.service.AreaService;
import com.neu.movie.service.CinemaService;
import com.neu.movie.utils.JsonModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("areas")
public class AreaController {

    @Autowired
    AreaService areaService;


    @RequestMapping(value="{code}/areas",method= RequestMethod.GET,headers = {"X-Requested-With=XMLHttpRequest"})
    @ResponseBody
    public JsonModel list(@PathVariable("code") String code){
        JsonModel jsonModel = new JsonModel();

        AreaQuery query = new AreaQuery();
        query.setPaging(false);
        query.setParentCode(code);
        PageInfo<Area> pageInfo = areaService.findByQuery(query);

        jsonModel.setResult(true);
        jsonModel.setData(pageInfo.getList());
        jsonModel.setMsg("查询成功");
        return jsonModel;
    }

}
