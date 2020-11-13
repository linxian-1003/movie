package com.neu.movie.listener;

import com.neu.movie.domain.Menu;
import com.neu.movie.service.MenuService;
import com.neu.movie.utils.SpringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //从数据库查找
        //service<---spring容器
        SpringUtil.init(sce.getServletContext());

        //查找一级和二级的菜单
       MenuService menuService = SpringUtil.getBean("menuServiceImpl");

       List<Menu> leftMenu = menuService.findLeftMenu();
       sce.getServletContext().setAttribute("leftMenu",leftMenu);
    }
}
