<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          <h1>电影管理<small>查询\添加\修改</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Fixed</li>
          </ol>
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box box-success">

                <div class="box-body">

                  <!-- 添加搜索条件 -->
                  <div class="box-body">
                    <div class="row">
                      <form id="searchForm" action="" onsubmit="return false;">

                        <div class="col-xs-2">
                          <select class="form-control" name="name">
                            <option value="">请选组</option>
                            <option value="name">YY</option>
                          </select>
                        </div>

                        <div class="col-xs-2">
                          <input type="text" name="keyWords" class="form-control" placeholder="关键字">
                        </div>
                        <div class="col-xs-2">
                          <button type="submit" class="btn bg-olive btn-flat">查询</button>
                        </div>
                      </form>
                    </div>
                  </div>

                  <div id="toolbar">
                    <neu:buttonTag auth="movies_add">
                      <a href="${pageContext.request.contextPath}/movies/addUI" type="button" class="btn bg-maroon btn-flat">添加</a>
                    </neu:buttonTag>
                    <neu:buttonTag auth="users_delete">
                      <button type="button" data-ope="delete" class="btn bg-olive btn-flat">删除</button>
                    </neu:buttonTag>
                    <neu:buttonTag auth="users_edit">
                      <button type="button" data-ope="edit" class="btn bg-orange btn-flat">编辑</button>
                    </neu:buttonTag>
                  </div>


                  <table id="movie_table"></table>
                </div>
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

    <!--引入bootstrap-table插件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.css">
    <script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table-zh-CN.js"></script>
  </body>

  <!-- page script -->
  <script type="text/javascript">
	  $(function (){
		  var $table;
		  $("#searchForm").on("submit",function(e){
			  var param = $(this).serializeObject();
			  $table.bootstrapTable('refresh',{query:param});
			  return false;
		  });

		  $("#toolbar > button").click(function(){
			  var idArray = $table.bootstrapTable('getAllSelections');
			  if(idArray.length==0){
				  alert("至少选择一条记录");
				  return;
			  }
			  idArray = $.map(idArray,function(item){
				  return item.id;
			  });
			  var ope = $(this).data("ope");
			  if("delete"==ope){
				  var ids = idArray.join(",");
				  request.ajax(request.contextPath+"/movies/"+ids,"delete",{},true,function(data){
					  if(data.result){
						  $table.bootstrapTable('refresh');
					  }else{
						  alert(data.msg);
					  }
				  });
			  }else if("edit"==ope){
				  //界面跳转
				  window.location.href=request.contextPath+"/movies/"+idArray[0]+"/edit";
			  }
		  });

		  var queryUrl = request.contextPath+'movies';
		  $table = $('#movie_table').bootstrapTable({
			  url: queryUrl,                      //请求后台的URL（*）
			  method: 'GET',                      //请求方式（*）
			  toolbar: '#toolbar',                //工具按钮用哪个容器
			  striped: true,                      //是否显示行间隔色
			  cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			  pagination: true,                   //是否显示分页（*）
			  sortable: true,                     //是否启用排序
			  sortOrder: "asc",                   //排序方式

			  sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）

			  pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
			  pageSize: 10,                       //每页的记录行数（*）
			  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）

			  clickToSelect: true,                //是否启用点击选中行
			  uniqueId: "id",                     //每一行的唯一标识，一般为主键列
			  //得到查询的参数
              queryParams : function (params) {  //params:查询参数
                  params.pageSize=params.limit;
                  params.page = (params.offset/params.pageSize)+1;
                  delete params.limit;
                  delete params.offset;
                  return params;
              },

              columns: [{
                  checkbox: true,
                  visible: true                  //是否显示复选框
              },{
                  field: 'name',
                  title: '名字'
              },{
                  field: 'img',
                  title: '图片'
              },{
                  field: 'tag',
                  title: '标签'
              },{
                  field: 'borthday',
                  title: '上映时间'
              },{
                  field: 'preview',
                  title: '预告'
              },{
                  field: 'score',
                  title: '得分'
              },{
                  field: 'xx',
                  title: '预览',
                  formatter: previewFormatter
              }],
           
			  onLoadError: function () {
				  //加载失败触发
			  },
			  responseHandler: function(res) {
				  return {
					  "total": res.total,//总页数
					  "rows": res.data   //数据
				  };
			  }
		  });
	  });

      //0:未激活 1:已激活  2:已删除
      function previewFormatter(value, row, index){
        return '<button id="btn_preview" data-role="'+row.id+'" type="button" class="btn btn-success btn-xs">预览</button>';
      }
  </script>
</html>