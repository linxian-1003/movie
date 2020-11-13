<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                    <ul id="menuTree" class="ztree"></ul>
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

    <!--ztree-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/plugins/ztree/css/zTreeStyle/zTreeStyle.css">
    <script src="${pageContext.request.contextPath}/static/dist/plugins/ztree/js/jquery.ztree.core.js"></script>



<script type="text/javascript">

    var $treeObj;
    //ztree配置信息
    var setting = {
        async : {
            enable : true,
            type : "get",
            url : "${pageContext.request.contextPath}/menus", //数据地址
            autoParam : [ "id=parentId" ],
            dataFilter : filter
        }
    };
    function filter(treeId, parentNode, responseData) {


        var data = responseData.data;

       $.each(data,function(index,item){
            delete item.children;
            item.isParent=item.level<3;
        })


        return data;
        /*
        var datas = childNodes.rows;
        //遍历
        $.each(datas, function(index, item) {
            item.isParent = !item.leaf;
        });
        return datas;*/
    }

    $(document).ready(function () {
        $('.sidebar-menu').tree();
        //创建ztree
        $treeObj = $.fn.zTree.init($("#menuTree"), setting);
    });
</script>
</body>
</html>

