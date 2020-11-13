package com.neu.movie.controller;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.service.UserService;
import com.neu.movie.utils.ConstantUtil;
import com.neu.movie.utils.JsonModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @RequestMapping(value="main",method= RequestMethod.GET)
    public String main(){
        return "main";
    }

    /**
     * 跳转到登录界面
     * @return
     */
    @RequestMapping(value="login",method= RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value="login",method = RequestMethod.POST)
    @ResponseBody
    public JsonModel login(String loginName, String password, int remember, HttpSession session){

        JsonModel jsonModel = new JsonModel();


        User user = userService.login(loginName,password);

        if(user==null){
            //失败
            jsonModel.setResult(false);
            jsonModel.setMsg("账号或密码错误");
        }else{
            if(remember==1){
                //思路:账号和密码都放入到cookie中 TODO
                //Cookie cookie = new Cookie("remember","");
            }
            session.setAttribute(ConstantUtil.SESSION_KEY,user);

            //获取当前用户的所有权限,放入到session中
            List<Menu> menus =  userService.findAllPermission(user.getId());
            session.setAttribute(ConstantUtil.MENU_KEY,menus);
            jsonModel.setResult(true);
            jsonModel.setMsg("登录成功");
        }
        return jsonModel;
    }

    @RequestMapping(value="forbidden",method= RequestMethod.GET)
    public String forbidden(){
        return "forbidden";
    }
}