package com.neu.movie.interceptor;

import com.neu.movie.utils.ConstantUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object result = request.getSession().getAttribute(ConstantUtil.SESSION_KEY);
        String requestURI = request.getRequestURI();//  /movieManager/login
        if(result==null){
            if((request.getContextPath()+"/login").equals(requestURI)){
                return true;
            }else{
                response.sendRedirect(request.getContextPath()+"/login");
                return false;
            }
        }else{
            //判断是否又来登录
            if((request.getContextPath()+"/login").equals(requestURI)){
                response.sendRedirect(request.getContextPath()+"/main");
                return false;
            }
            return true;
        }
    }
}
