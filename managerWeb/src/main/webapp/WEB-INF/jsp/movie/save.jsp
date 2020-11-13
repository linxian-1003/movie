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

          <h1 th:text="${empty movie.id  ? '添加电影':'编辑电影'}"></h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
            <li><a href="#">电影管理</a></li>
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
                <form:form class="form-horizontal" action="${pageContext.request.contextPath}/movies/${empty movie.id ?'':movie.id}" method="post" modelAttribute="movie">
                  <form:input type="hidden" path="id" />
                  <input type="hidden" name="_method" value="${empty movie.id  ? 'POST':'PUT'}">
    
                  <div class="box-body">   
                  
  	  
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                          <form:input type="text"  path="name"  cssClass="form-control" placeholder="名字" data-bv-notempty="true"/>
                        </div>
                      </div>
  	  
                      <div class="form-group">
                        <label for="img" class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-10">
                          <form:input type="text" path="img" cssClass="form-control" placeholder="图片" data-bv-notempty="true"/>
                        </div>
                      </div>
                    </div>
  	  
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="tag" class="col-sm-2 control-label">标签</label>
                        <div class="col-sm-10">
                          <form:input type="text"  path="tag"  cssClass="form-control" placeholder="标签" data-bv-notempty="true"/>
                        </div>
                      </div>
  	  
                      <div class="form-group">
                        <label for="borthday" class="col-sm-2 control-label">上映时间</label>
                        <div class="col-sm-10">
                          <form:input type="text" path="borthday" cssClass="form-control" placeholder="上映时间" />
                        </div>
                      </div>
                    </div>
  	  
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="preview" class="col-sm-2 control-label">预告</label>
                        <div class="col-sm-10">
                          <form:input type="text"  path="preview"  cssClass="form-control" placeholder="预告" />
                        </div>
                      </div>
  	  
                      <div class="form-group">
                        <label for="score" class="col-sm-2 control-label">得分</label>
                        <div class="col-sm-10">
                          <form:input type="text" path="score" cssClass="form-control" placeholder="得分" />
                        </div>
                      </div>
                    </div>
  	  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="descr" class="col-sm-1 control-label">描述</label>
                        <div class="col-sm-10">
                          <form:textarea path="descr" rows="10" cols="80"></form:textarea>
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

    <!--ckeditor-->
    <script src="${pageContext.request.contextPath}/static/bower_components/ckeditor/ckeditor.js"></script>



    <script type="text/javascript">
        $(function(){
          CKEDITOR.replace('descr');
        });
    </script>
  </body>
</html>
 
 
