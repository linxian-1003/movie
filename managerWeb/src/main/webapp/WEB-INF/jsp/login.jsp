<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
  <title>登录</title>
  <%@ include file="/WEB-INF/jsp/common/common.jsp"%>
  </head>
  <body class="hold-transition login-page">
  <div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form method="post" id="form_login">
    <div class="form-group has-feedback">
      <input type="text" name="loginName" class="form-control" placeholder="Email">
      <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
    </div>
    <div class="form-group has-feedback">
      <input type="password" name="password" class="form-control" placeholder="Password">
      <span class="glyphicon glyphicon-lock form-control-feedback"></span>
    </div>
    <div class="row">
      <div class="col-xs-8">
      <div class="checkbox icheck">
        <label>
        <input type="checkbox" value="1" name="remember">记住我
        </label>
      </div>
      </div>
      <!-- /.col -->
      <div class="col-xs-4">
      <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
      </div>
      <!-- /.col -->
    </div>
    </form>
  </div>
  <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/plugins/iCheck/square/blue.css">
  <!-- iCheck -->
  <script src="${pageContext.request.contextPath}/static/dist/plugins/iCheck/icheck.min.js"></script>

  <!-- validate -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/plugins/validate/css/bootstrapValidator.min.css">
  <script src="${pageContext.request.contextPath}/static/dist/plugins/validate/js/bootstrapValidator.min.js"></script>

  <script>
  $(function () {
    $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' /* optional */
    });


      $('#form_login').bootstrapValidator({
              message: 'This value is not valid',
              feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              },
              fields: {
                  loginName: {//input name="loginName"
                      message: '账号无效',
                      validators: {//校验规则
                          notEmpty: {
                              message: '账号不能为空'
                          }
                      }
                  },
                  password: {
                      validators: {
                          notEmpty: {
                              message: '密码不能为空'
                          }
                      }
                  }
              }
          }).on('success.form.bv', function(e) {
              // Prevent form submission
              e.preventDefault();
              // Get the form instance
              var $form = $(e.target);//$('#form_login')

              var loginName = $form.find("input[name=loginName]").val();
              var password = $form.find("input[name=password]").val();
              var remember = $form.find("input[name=remember]").val();

              $.ajax({
                      url:"${pageContext.request.contextPath}/login",
                      type : "post",
                      data: "loginName="+loginName+"&password="+password+"&remember="+remember,
                      success: function(data){
                              console.log(data);
                              if(data.result){
                                      //去到首页
                                      window.location.href="${pageContext.request.contextPath}/main";
                              }else{
                                      alert(data.msg);
                              }
                      }
              })


          });
  });
  </script>
  </body>
</html>
