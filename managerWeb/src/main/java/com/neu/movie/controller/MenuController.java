package com.neu.movie.controller;

import com.github.pagehelper.PageInfo;
import com.neu.movie.domain.Menu;
import com.neu.movie.domain.Role;
import com.neu.movie.query.MenuQuery;
import com.neu.movie.query.RoleQuery;
import com.neu.movie.service.MenuService;
import com.neu.movie.service.RoleService;
import com.neu.movie.utils.JsonModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menus")
public class MenuController {

    @Autowired
    MenuService menuService;


    /**
     * 转发到列表界面
     * @return
     */
    @RequestMapping(value="",method= RequestMethod.GET)
    public String list(){
        return "menu/list";
    }


    @RequestMapping(value="",method=RequestMethod.GET,headers = {"X-Requested-With=XMLHttpRequest"})
    @ResponseBody
    public JsonModel list(MenuQuery query){
        JsonModel jsonModel = new JsonModel();
        PageInfo<Menu> pageInfo = menuService.findByQuery(query);//根据条件插叙数据
        jsonModel.setResult(true);
        jsonModel.setData(pageInfo.getList());
        jsonModel.setCount((int)pageInfo.getTotal());  //当前条件下记录数
        jsonModel.setMsg("查询成功");
        return jsonModel;
    }
    


}
