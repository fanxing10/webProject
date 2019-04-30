<%--
  Created by IntelliJ IDEA.
  User: WQSDP2019
  Date: 2019/4/15
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <style>
        /*web background*/
        .container{
            display:table;
            height:100%;
        }

        .row{
            display: table-cell;
            vertical-align: middle;
        }
        /* centered columns styles */
        .row-centered {
            text-align:center;
        }
        .col-centered {
            display:inline-block;
            float:none;
            text-align:left;
            margin-right:-4px;
        }
    </style>
    <script>
        function check() {
            // var userid = document.getElementById("userId");\
            var userid = $("#userId").val();
            var password = $("#password").val();

            // alert(userid+password);
            if (!userid.length>0 ) {
                document.getElementById("pid1").innerText ="用户名不能为空";
                return false;
            }
            if (!password.length>0){
                document.getElementById("pid2").innerText ="密码不能为空";
                return false;
            }
            return true;
        }
    </script>
    <script>
        var error = '<%=request.getParameter("error")%>';
        if (error == 'yes'){
            $(document).ready(function () {
                $("#pid").text("用户名或密码错误!");
            })
        }
    </script>
</head>

<body>
<div class="container">
    <div class="row row-centered">
        <div class="well col-md-6 col-centered">
            <h2>欢迎登录</h2>
            <form action="<c:url value="login"/>" method="post" role="form">
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" id="userId" name="userId" width="30px" placeholder="请输入用户ID"/> <p id="pid1"></p>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/> <p id="pid2"></p>
                </div>
                <br>
                <p id="pid"></p>
                <button type="submit" class="btn btn-success btn-block" onclick="return check()">登录</button>

            </form>
        </div>
    </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>

<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>