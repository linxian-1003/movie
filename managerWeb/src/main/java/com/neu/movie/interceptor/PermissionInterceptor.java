package com.neu.movie.interceptor;

import com.neu.movie.domain.Menu;
import com.neu.movie.domain.User;
import com.neu.movie.utils.ConstantUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.List;

public class PermissionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        //如果是管理员
        User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
        if(user!=null && user.getName().equals("admin")){
            return true;
        }


        //拦截是否有权限
        //获取当前请求的auth【规则:requestMapping_对应方法】

        HandlerMethod method = (HandlerMethod) handler;
        String name = method.getMethod().getName();

        RequestMapping requestMapping =  method.getBeanType().getAnnotation(RequestMapping.class);
        if(requestMapping==null){
            return true;
        }

        String requestMappingValue =requestMapping.value()[0];

        String auth = requestMappingValue+"_"+name;
        System.out.println(auth); //users_list users_add

        //当前用户的权限
        List<Menu> menuList = (List<Menu>) request.getSession().getAttribute(ConstantUtil.MENU_KEY);
        for(Menu menu : menuList){
            if(menu.getAuth().equals(auth)){
                return  true;
            }
        }
        //去到没有权限的界面
        //判断是否ajax
        //

        response.sendRedirect(""+request.getContextPath()+"/forbidden");
        return false;
    }
}
