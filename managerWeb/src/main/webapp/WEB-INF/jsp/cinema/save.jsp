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
                <form:form cssClass="form-horizontal" action="${pageContext.request.contextPath}/cinemas/${cinema.id}" method="post" modelAttribute="cinema">
                  <input type="hidden" name="_method" value="${empty cinema.id ? 'post':'put'}"/>
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
                        <label for="provinceCode" class="col-sm-2 control-label">省份</label>
                        <div class="col-sm-10">
                          <%--model.addAttribute("provices",provinces);--%>
                          <form:select cssClass="form-control" path="provinceCode" placeholder="省份">
                            <form:option value="">请选择省份</form:option>
                            <form:options items="${provices}" itemLabel="name" itemValue="code"></form:options>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">

                      <div class="form-group">
                        <label for="street" class="col-sm-2 control-label">街道</label>
                        <div class="col-sm-10">
                          <form:input path="street" cssClass="form-control"  placeholder="街道"/>
                        </div>
                      </div>


                      <div class="form-group">
                        <label for="longitude" class="col-sm-2 control-label">经度</label>
                        <div class="col-sm-10">
                          <form:input path="longitude" cssClass="form-control"  placeholder="经度"/>
                        </div>
                      </div>



                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="cityCode" class="col-sm-2 control-label">城市</label>
                        <div class="col-sm-10">
                         <%-- <form:input path="cityCode" cssClass="form-control"  placeholder="城市"/>--%>
                          <form:select cssClass="form-control" path="cityCode">
                            <form:option value="">请选择城市</form:option>
                          </form:select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="areaCode" class="col-sm-2 control-label">地区</label>
                        <div class="col-sm-10">
                          <form:select cssClass="form-control" path="areaCode">
                            <form:option value="">请选择地区</form:option>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="latitude" class="col-sm-2 control-label">维度</label>
                        <div class="col-sm-10">
                          <form:input path="latitude" cssClass="form-control"  placeholder="维度"/>
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

        //监听change事件
        $("#provinceCode").on("change",function(){
          var provinceCode = $(this).val();
          //get /areas/110000/areas
          //data,async,callBack
          //加载code下子节点
          request.get(request.contextPath+"/areas/"+provinceCode+"/areas",'',true,function(data){
            if(data.result){
              var $citySelect = $("#cityCode");
              $citySelect.empty();
              $("#areaCode").empty();
              $.each(data.data,function(index,item){
                $("<option value="+item.code+">"+item.name+"</option>").appendTo($citySelect);
              })
            }
          });
        });
        $("#cityCode").on("change",function(){
          var cityCode = $(this).val();
          request.get(request.contextPath+"/areas/"+cityCode+"/areas",'',true,function(data){
            if(data.result){
              var $areaSelect = $("#areaCode");
              $areaSelect.empty();
              $.each(data.data,function(index,item){
                $("<option value="+item.code+">"+item.name+"</option>").appendTo($areaSelect);
              })
            }
          });
        });


      });
    </script>
  </body>
</html>