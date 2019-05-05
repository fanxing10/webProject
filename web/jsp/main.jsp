<%--
  Created by IntelliJ IDEA.
  User: WQSDP2019
  Date: 2019/4/16
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>甘肃省文化产业项目信息管理平台</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/2.css">

</head>
<body>
<div id="div1">
    <p id="p1">甘肃省文化产业信息管理平台</p>
    <p id="p2">${name}，您好！
        <a id="exit" href="../login.jsp">退出</a></p>

</div>
<div id="div2">
    <ul>
        <li><a href="#" id="a2">专家库管理</a></li>
        <li><a href="#" id="a1">项目管理</a></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <div id="div6">

    </div>

</div>

<script>


    $("#div6").load("/expert");

    $(document).ready(function () {
        $("#a1").click(function () {
            $("#div6").load("/project");
        });
        $("#a2").click(function () {
            $("#div6").load("/expert");
        });
        $("#button1").click(function(){
            $(".trClass>input").show();
            // $("input").show();
        });
        $("#buttonAdd").click(function () {
            $("#div6").load("../jsp/expertadd.jsp");
        })
    });
</script>


</body>
</html>