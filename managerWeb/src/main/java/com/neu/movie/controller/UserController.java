package com.neu.movie.controller;

import com.neu.movie.domain.Role;
import com.neu.movie.domain.User;
import com.neu.movie.query.RoleQuery;
import com.neu.movie.query.UserQuery;
import com.neu.movie.service.RoleService;
import com.neu.movie.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("users")
public class UserController extends BaseController<User,UserQuery>{

    @Autowired
    public void setUserService(UserService userService){
        this.baseService = userService;
    }

    @Autowired
    RoleService roleService;

    @Override
    public User beforeEdit(User user) {
        User temp = new User();
        temp.setId(user.getId());
        temp.setName(user.getName());
        temp.setHeader(user.getHeader());
        return temp;
    }

    @Override
    public void beforeSaveUI(Model model, User user) {
        if(user==null){
            //去到添加界面
            RoleQuery roleQuery = new RoleQuery();
            roleQuery.setPaging(false);
            List<Role> roleList = roleService.findByQuery(roleQuery).getList();
            model.addAttribute("roleList",roleList);
        }else{
            //编辑
            RoleQuery roleQuery = new RoleQuery();
            roleQuery.setPaging(false);
            List<Role> roleList = roleService.findByQuery(roleQuery).getList();
            model.addAttribute("roleList",roleList);

            //回显
            //user
            int [] roleIds = roleService.findByUserId(user.getId());

            if(roleIds!=null && roleList!=null){

                for(Role role : roleList){

                   for(int roleId: roleIds){
                       if(role.getId()==roleId){
                           //当前角色有和当前user绑定
                           user.getRoles().add(role);
                           break;
                       }
                   }
                }
            }
        }
    }
}
