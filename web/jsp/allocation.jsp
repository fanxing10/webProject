<%--
  Created by IntelliJ IDEA.
  User: 16848
  Date: 2019/4/25
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>分配项目</title>
        <link rel="stylesheet" href="../css/4.css" />
        <link rel="stylesheet" href="../css/3.css" />
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<script>
			function cancel() {
				$(document).ready(function () {
					$("#div6").load("../jsp/expert.jsp");
				})
			}

			function commit() {
				// var id = $("input[type='radio']:checked").val();

				<!--获取选中复选框的值-->
				var ids = new Array();
				$("input[type='checkbox']:checked").each(function (i) {
					ids[i] = $(this).val();
				});
				// alert(ids);
				$.ajax({
					url:"/expert",
					data: {
						"type":"allocateSave",
						"ids":ids,
						"expertId":${expertId}
					},
					type: "post",
					traditional: true,//这里设置为true
					success: function (data) {
						alert("项目分配成功");
						$("#div4").load(data);
					}
				})

			}
		</script>
    </head>
    <body>
    	<div id="div01">
			<p id="p01">可以给${eName}专家分配的项目:</p>
		</div>
		<div id="div02">
			<table id="table2">
				<tr id="tr4">
					<td></td>
					<td>序号</td>
					<td>项目名称</td>
					<td>项目所处阶段</td>
					<td>项目总资产</td>
				</tr>
				<c:forEach items="${otherProjects}" var="list" varStatus="idx">
					<tr>
						<%--<td><input type="radio" name="select" value="${list.id}"></td>--%>
						<td><input type="checkbox" name="select" value="${list.id}"></td>
						<td>${list.id}</td>
						<td>${list.projectName}</td>
						<%--<td>${list.promaryCoverage}</td>--%>
						<%--<td>${list.money}</td>--%>
						<td>${list.moment}</td>
						<td>${list.money}</td>
						<%--<td>${list.appleTime}</td>--%>
						<%--<td>${list.applyer}</td>--%>
						<%--<td>${list.mobilePhone}</td>--%>
						<%--<td>${list.landlinePhone}</td>--%>
					</tr>

				</c:forEach>
			</table>
			<div id="div03">
			<button class="button01" type="button" onclick="cancel()">取消</button>
			<button class="button02" type="submit" onclick="commit()">确定</button>
		</div>
		</div>
 	</body>
</html>