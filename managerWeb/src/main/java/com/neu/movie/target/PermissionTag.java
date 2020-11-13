package com.neu.movie.target;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.utils.ConstantUtil;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.List;

public class PermissionTag extends TagSupport {

    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int doStartTag() throws JspException {
        HttpSession session = pageContext.getSession();
        //如果是管理员
       User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
       if(user.getName().equals("admin")){
           return TagSupport.EVAL_BODY_INCLUDE;
       }


        //TagSupport.EVAL_BODY_INCLUDE
             //执行标签体的内容
        //TagSupport.SKIP_BODY
             //不执行标签体的内容

        //判断当前用户有没有指定的权限

        //获取到当前用户的权限
     /*   List<Menu> menus =  userService.findAllPermission(user.getId());
        session.setAttribute(ConstantUtil.MENU_KEY,menus);*/

        List<Menu> menus = (List<Menu>) session.getAttribute(ConstantUtil.MENU_KEY);

        //没有任何权限
        if(menus==null || menus.isEmpty() ){
            return TagSupport.SKIP_BODY;
        }

        for(Menu menu : menus){
            if(menu.getName().equals(name)){
                //执行里面的内容
                return TagSupport.EVAL_BODY_INCLUDE;
            }
        }
        //跳过里面的内容
        return TagSupport.SKIP_BODY;
    }

    //步骤
        //新建类 extends TagSupport
        //编写逻辑
        //WEB-INF/xx.tld
}
