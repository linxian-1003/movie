<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="neu" uri="http://java.sun.com/jsp/jstl/neu" %>

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
            <div class="box">
                <div class="box-body">

                    <div class="row">
                        <form id="searchForm" action="" onsubmit="return false;">

                            <div class="col-xs-2">
                                <select class="form-control" name="name">
                                    <option value="">请选组</option>
                                    <option value="name">姓名</option>
                                    <option value="loginName">账号</option>
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

                    <div id="toolbar">
                        <neu:buttonTag auth="users_add">
                            <a href="${pageContext.request.contextPath}/users/addUI" type="button" class="btn bg-maroon btn-flat">添加</a>
                        </neu:buttonTag>
                        <neu:buttonTag auth="users_delete">
                            <button type="button" data-ope="delete" class="btn bg-olive btn-flat">删除</button>
                        </neu:buttonTag>
                        <neu:buttonTag auth="users_edit">
                            <button type="button" data-ope="edit" class="btn bg-orange btn-flat">编辑</button>
                        </neu:buttonTag>
                    </div>

                    <table id="table_user"></table>
                </div>
            </div>
            <!-- /.box -->

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

<!--引入bootstrap-table插件-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.css">
<script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table-zh-CN.js"></script>

<script>
    function prepareQueryParam(){
        var $it =  $("form[id=searchForm]");
        var conditionName = $it.find("select[name='name']").val();
        if(conditionName) {
            var conditionValue = $it.find("input[name='keyWords']").val();
            if (conditionValue) {
                var param = {};
                 return param[conditionName]=conditionValue;
            }
        }
    }
    $(document).ready(function () {
        $('.sidebar-menu').tree();


        $("form[id=searchForm]").on("submit",function(){
            var $it = $(this);
            var conditionName = $it.find("select[name='name']").val();
            if(conditionName){
                var conditionValue =  $it.find("input[name='keyWords']").val();
                if(conditionValue){
                    //拼接查询条件
                    var requestParam = {};
                    requestParam[conditionName]=conditionValue;
                    //刷新table插件
                    $table.bootstrapTable('refresh',{query:requestParam});
                }else{
                    $table.bootstrapTable('refresh');
                }
            }else{
                $table.bootstrapTable('refresh');
            }
            return false;
        });

        var $table;

        //监听删除按钮的事件
        $("#toolbar > button").on("click",function(){

            var $it = $(this);//this 哪个被点击了
            var ope = $it.data("ope");
            if("delete"==ope){
                //获取选中的数据（id）
                var idArray = $table.bootstrapTable('getAllSelections');

                //遍历
                idArray = $.map(idArray,function(item){
                    return item.id;
                });

                //idArray [2,3]
                var ids = idArray.join(",");

                $.ajax({
                    type : "post",  //_method=delete
                    url:"${requestContext.request.contextPath}/users/"+ids,
                    data:"_method=delete",
                    success:function(data){  //{"resulut":true | false,"msg":"删除成功"}
                        if(data.result){
                            //删除成功了
                            //刷新table的数据
                            $table.bootstrapTable('refresh');
                        }else{
                            //删除失败了
                            alert(data.msg);
                        }
                    }
                })
            }else if("edit"==ope){
                //获取选中的数据（id）
                var idArray = $table.bootstrapTable('getAllSelections');
                if(idArray.length==1){
                    var id = idArray[0].id;
                    window.location.href=request.contextPath+"/users/"+id+"/edit";
                }else{
                    alert("有且只能选中一条");
                }

            }

            //   <button type="button" data-ope="delete" class="btn bg-olive btn-flat">删除</button>
            //<button type="button" data-ope="edit" class="btn bg-orange btn-flat">编辑</button>
        });


        $table = $('#table_user').bootstrapTable({
            url: '${pageContext.request.contextPath}/users',  //数据来源[ajax]--->
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            smartDisplay:false,
            search: false,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                 //是否显示所有的列
            showRefresh: false,                 //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            queryParams : function (params) {  //params:查询参数
                params.pageSize=params.limit;
                params.page = (params.offset/params.pageSize)+1;
                delete params.limit;
                delete params.offset;

                var extralParam = prepareQueryParam();
                console.log(extralParam);
              /*  private Integer page=1;    //当前第几页
                private Integer pageSize=10; //每页显示多少条
                */
              //加上条件参数即可
                return params;
            },
            columns: [{
                checkbox: true
            },{
                field: 'name',
                title: '昵称'
            },{
                field: 'loginName',
                title: '账号'
            },{
                field: 'status',
                title: '状态',
                formatter: statusFormatter
            }],
            responseHandler: function(res) {
                //获取到服务响应回来的数据，先经过这里
               return {
                    "total": res.count,//总的记录数
                    "rows": res.data   //数据
                };
            }
        });
    });

    //0:未激活 1:已激活  2:已删除
    function statusFormatter(value, row, index){
        if("1"==value){
            return "已激活";
        }else if("0"==value){
            return "未激活";
        }else{
            return "已删除";
        }
    }
</script>
</body>
</html>

