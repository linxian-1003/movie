<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

  <head>
    <%@ include file="/WEB-INF/jsp/common/common.jsp"%>
  </head>

  <body class="hold-transition skin-blue fixed sidebar-mini">
    <div class="wrapper">

      <!-- 头部-->
      <%@ include file="/WEB-INF/jsp/common/top.jsp"%>

      <!-- 菜单-->
      <%@ include file="/WEB-INF/jsp/common/menu.jsp"%>
    
      <div class="content-wrapper">
        <section class="content-header">

          <h1 th:text="${empty room.id  ? '添加房间':'编辑房间'}"></h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
            <li><a href="#">房间管理</a></li>
            <li class="active">列表</li>
          </ol>
        </section>
        
        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- right column -->
            <div class="col-md-12">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <!-- form start -->
                <form:form class="form-horizontal" action="${pageContext.request.contextPath}/rooms/${empty room.id ?'':room.id}" method="post" modelAttribute="room">
                  <form:input type="hidden" path="id" />
                  <input type="hidden" name="_method" value="${empty room.id  ? 'POST':'PUT'}">
    
                  <div class="box-body">   
                  
  	  
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">房间名字</label>
                        <div class="col-sm-10">
                          <form:input type="text"  path="name"  cssClass="form-control" placeholder="房间名字" />
                        </div>
                      </div>
  	  
                      <div class="form-group">
                        <label for="seatCount" class="col-sm-2 control-label">座位数量</label>
                        <div class="col-sm-10">
                          <form:input type="text" path="seatCount" cssClass="form-control" placeholder="座位数量" />
                        </div>
                      </div>
                    </div>

                    <div class="col-md-6">
  	  
                      <div class="form-group">
                        <label for="cinemaId" class="col-sm-2 control-label">电影院</label>
                        <div class="col-sm-10">
                          <form:select path="cinemaId"  cssClass="form-control"  items="${cinemas}" itemValue="id" itemLabel="name">
                          </form:select>
                        </div>
                      </div>
                    </div>
      
     
                  </div>
                  <div class="box-footer">
                    <button type="reset" class="btn btn-default btn-flat">重 置</button>
                    <button type="submit" class="btn btn-success btn-flat">保 存</button>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </section>
      </div>
      <%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
      <%@ include file="/WEB-INF/jsp/common/setting.jsp"%>
    </div>

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

    <script type="text/javascript">
        $(function(){
            $("form[id='room']").bootstrapValidator({
          	  feedbackIcons: {
          		  valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                }
            }); 
        });
    </script>
  </body>
</html>
 
 
