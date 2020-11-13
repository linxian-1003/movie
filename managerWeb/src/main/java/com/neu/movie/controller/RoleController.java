package com.neu.movie.controller;

import com.neu.movie.domain.Role;
import com.neu.movie.query.RoleQuery;
import com.neu.movie.service.RoleService;
import com.neu.movie.utils.JsonModel;
import com.neu.movie.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("roles")
public class RoleController extends BaseController<Role,RoleQuery>{

    @Autowired
    public void setRoleService(RoleService roleService){
        this.baseService = roleService;
    }
    @Override
    public Role beforeEdit(Role role) {
        Role temp = new Role();
        temp.setId(role.getId());
        temp.setName(role.getName());
        temp.setRemark(role.getRemark());
        return temp;
    }

    @Override
    public void beforeSaveUI(Model model, Role role) {

    }

    @RequestMapping(value="{id}/auth",method = RequestMethod.PUT)
    @ResponseBody
    public JsonModel auth(@PathVariable("id") Integer roleId, @RequestParam(required = false,defaultValue = "") String menuId){
        String [] menuIds= null;
        if(!StringUtil.isEmpty(menuId)){
            menuIds = menuId.split(",");
        }
        boolean sign = ((RoleService)this.baseService).bind(roleId,menuIds);
        JsonModel jsonModel = new JsonModel();
        jsonModel.setResult(sign);
        jsonModel.setMsg(sign ? "授权成功":"授权失败");
        return jsonModel;
    }

    /**
     * 根据角色获取权限id
     * @param roleId
     * @return
     */
    @RequestMapping(value="{id}/auth",method = RequestMethod.GET)
    @ResponseBody
    public JsonModel auth(@PathVariable("id") Integer roleId){
        //permission 权限
       int [] menuId = ((RoleService)this.baseService).findPermissionIds(roleId);
        JsonModel jsonModel = new JsonModel();
        jsonModel.setResult(true);
        jsonModel.setData(menuId);
        return jsonModel;
    }

}
