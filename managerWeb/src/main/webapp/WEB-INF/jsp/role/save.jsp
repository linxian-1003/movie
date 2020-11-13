<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/jsp/common/common.jsp"%>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

      <!-- 头部-->
      <%@ include file="/WEB-INF/jsp/common/top.jsp"%>

      <!-- 菜单-->
      <%@ include file="/WEB-INF/jsp/common/menu.jsp"%>

      <!-- 内容-->
      <!-- 内容-->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Blank page
            <small>it all starts here</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Examples</a></li>
            <li class="active">Blank page</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->

          <div class="row">
            <!-- right column -->
            <div class="col-md-12">
              <div class="box">

                <!--
                   添加和编辑
                      添加  /users    post
                      编辑  /users/{id}  put
                -->
                <form:form cssClass="form-horizontal" action="${pageContext.request.contextPath}/roles/${role.id}" method="post" modelAttribute="role">

                  <input type="hidden" name="_method" value="${empty role.id ? 'post':'put'}"/>

                  <form:hidden path="id"/>
                  <div class="box-body">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                          <form:input path="name" cssClass="form-control"  placeholder="名称"/>
                          <form:errors path="name"></form:errors>
                          <!--含义:从request作用域中获取属性为role的nam的值回显
                                                               modelAttribute="role"
                          -->
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                          <form:input path="remark" cssClass="form-control"  placeholder="备注"/>
                        </div>
                      </div>
                    </div>

                    </div>
                    <div class="box-footer">
                      <button type="reset" class="btn btn-default btn-flat">重 置</button>
                      <button type="submit" class="btn btn-success btn-flat">提交</button>
                    </div>
                </form:form>
              </div>
            </div>
          </div>
        </section>
        <!-- /.content -->
      </div>
      <%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
      <%@ include file="/WEB-INF/jsp/common/setting.jsp"%>
    </div>
    <!-- ./wrapper -->

    <script src="${pageContext.request.contextPath}/static/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/static/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/static/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/static/dist/js/demo.js"></script>



    <script>
      $(document).ready(function () {
        $('.sidebar-menu').tree();
      });
    </script>
  </body>
</html>