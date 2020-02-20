<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /*将项目的根路径/ssm_crud/存入*/
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<html>
<head>
    <title>首页</title>
    <!--引入bootstrap和jquery，注意顺序问题-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="application/javascript"></script>
</head>
<body>
<input type="text" class="form-control" id="tableName" placeholder="请输入表格名称" data-toggle="tooltip" data-placement="top">

<script>
    function showPopover(target, msg) {
        target.attr("data-original-title", msg);
        $('[data-toggle="tooltip"]').tooltip();
        target.tooltip('show');
        target.focus();

        //2秒后消失提示框
        var id = setTimeout(
            function () {
                target.attr("data-original-title", "");
                target.tooltip('hide');
            }, 2000
        );
        alert("www");
    }
    showPopover($("#tableName"),"表名已存在");
</script>
</body>
</html>
