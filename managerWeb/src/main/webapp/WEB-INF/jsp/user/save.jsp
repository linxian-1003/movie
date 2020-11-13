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
                <!-- form start -->
                <%--  model.addAttribute("user",user);--%>
                <!--
                  put  /users/1
                -->
                <form:form cssClass="form-horizontal" action="${pageContext.request.contextPath}/users/${user.id}" method="post" modelAttribute="user">
                  <input type="hidden" name="_method" value="${empty user.id ? 'post':'put'}"/>
                  <form:hidden path="id"/>
                  <div class="box-body">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                          <form:input path="name" cssClass="form-control"  placeholder="名称"/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="header" class="col-sm-2 control-label">头像</label>
                        <div class="col-sm-10">
                          <form:input path="header" cssClass="form-control"  placeholder="头像"/>
                        </div>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="loginName" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                          <form:input path="loginName" readonly="${empty user.id ? 'false':'true'}" cssClass="form-control"  placeholder="账号"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="loginName" class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10">
                           <!--显示全部角色
                           items:需要遍历集合,给定全部角色
                           -->
                           <form:select cssClass="form-control" path="roles" items="${roleList}" itemLabel="name" itemValue="id"></form:select>
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

    <!-- validate -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/plugins/validate/css/bootstrapValidator.min.css">
    <script src="${pageContext.request.contextPath}/static/dist/plugins/validate/js/bootstrapValidator.min.js"></script>
    <script>
      $(document).ready(function () {
        $('.sidebar-menu').tree();


        $('#user').bootstrapValidator({
          message: 'This value is not valid',
          feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
            name: {//input name="loginName"
              message: '账号无效',
              validators: {//校验规则
                notEmpty: {
                  message: '账号不能为空'
                }
              }
            }
          }
        }).on('success.form.bv', function(e) {

          var $form = $(e.target);
          var optionSelected = $form.find("select[id='roles']>option:selected");

          var length = optionSelected.length;
          for(var i=0;i<length;i++){
            var id = $(optionSelected[i]).val();
            //console.log(id);
            var option = $('<input type="hidden" name="roles['+i+'].id" value="'+id+'"/>');
            option.appendTo($form);
          }
          //自己删除自己
          $form.find("select[id='roles']").removeAttr("name");
          $form.find("input[name='_roles']").remove();
        });
      });
    </script>
  </body>
</html>