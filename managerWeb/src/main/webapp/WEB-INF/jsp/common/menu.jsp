<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="neu" uri="http://java.sun.com/jsp/jstl/neu" %>
<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i>在线</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>

            <c:forEach items="${leftMenu}" var="topMenu">
                <%--判断:判断当前登录的用户有没有${topMenu.name}权限--%>
                <neu:permissionTag name="${topMenu.name}">

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>${topMenu.name}</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:forEach items="${topMenu.children}" var="childMenu">
                            <%--判断:判断当前登录的用户有没有${childMenu.name}权限--%>
                            <neu:permissionTag name="${childMenu.name}">
                                <li><a href="${pageContext.request.contextPath}${childMenu.url}"><i class="fa fa-circle-o"></i>${childMenu.name}</a></li>
                            </neu:permissionTag>
                        </c:forEach>
                    </ul>
                </li>
                </neu:permissionTag>
            </c:forEach>
<%--
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>系统管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${pageContext.request.contextPath}/users"><i class="fa fa-circle-o"></i>用户管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/roles"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/menus"><i class="fa fa-circle-o"></i> 菜单管理</a></li>
                </ul>
            </li>
--%>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span>Layout Options</span>
                    <span class="pull-right-container">
              <span class="label label-primary pull-right">4</span>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                    <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                    <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                    <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
                </ul>
            </li>

            <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
