<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"/>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！ -->

    <!--
    web路径问题
    不以/开始的是相对路径，以当前资源的路径为基准，容易出现问题
    以/开始的是绝对路径，以服务器根路径为基准，推荐使用
    -->
    <% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>

    <%--引入Bootstrap的CSS资源--%>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>

    <title>首页</title>
</head>
<body>

<h1>Hello World</h1>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</body>
</html>