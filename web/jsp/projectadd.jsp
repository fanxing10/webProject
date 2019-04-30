<%--
  Created by IntelliJ IDEA.
  User: 16848
  Date: 2019/4/19
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/3.css" />
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
        <title>JSP Page</title>
	<script>
		function cancel() {
			$(document).ready(function () {
				$("#div6").load("../jsp/project.jsp");
			})

		}
		function check(value){
			if(isNaN(value)){
				return false;
			}else{
				return true;
			}
		}
		function toadd() {
			var url = "/project";
			var projectName = $("input[name='projectName']").val();
			var applyer = $("input[name='applyer']").val();
			var email = $("input[name='email']").val();
			var landlinePhone = $("input[name='landlinePhone']").val();
			var mobilePhone = $("input[name='mobilePhone']").val();
			var money = $("input[name='money']").val();
			// var moment = $("input[name='moment']").val();
			var moment = $("input[name=moment]:checked").val();
			var promaryCoverage = $("input[name='promaryCoverage']").val();
			var moneyGiven = $("input[name='moneyGiven']").val();
			var data = {"type":"add","projectName":projectName,"applyer":applyer,"email":email,"landlinePhone":landlinePhone,"mobilePhone":mobilePhone,"money":money,"moment":moment,"promaryCoverage":promaryCoverage,"moneyGiven":moneyGiven};
			if (check(money) && check(moneyGiven)){
				$.ajax({
					url:url,
					data:data,
					type:"post",
					success:function (data) {
						// alert(data);
						alert("添加成功");
						$("#div6").load(data);
					},
					error:function () {
						alert("添加失败");
					}
				})
			}
			else alert("请输入数字")
		}
	</script>
</head>
<body>
	<div id="div01">
			<p id="p01">项目申报</p>
	</div>
	<div id="div02">
			<div class="div001"><span class="span1">项目名称</span></div>
			<div class="div007" style="padding-right:2px;"><input type="text" name="projectName" ></div><br>
			<div class="div001"><span class="span1">联系人</span></div>
			<div class="div002"><input type="text" name="applyer"></div>
			<div class="div001"><span class="span1">电子邮箱</span></div>
			<div class="div008"><input type="text" name="email"></div><br>
			<div class="div001"><span class="span1">固定电话</span></div>
			<div class="div002"><input type="text" name="landlinePhone"></div>
			<div class="div001"><span class="span1">移动电话</span></div>
			<div class="div008"><input type="text" name="mobilePhone"></div><br>
			<div class="div001"><span class="span1">项目总资产</span></div>
			<div class="div002"><input type="text" name="money"></div>
			<div class="div001"><span class="span1">已完成投资</span></div>
			<div class="div008"><input type="text" name="moneyGiven"></div><br>
			<div class="div001"><span class="span1">项目所处阶段</span></div>
			<div class="div007"style="padding-right:2px;"><input type="checkbox" name="moment" value="论证阶段">论证阶段
				<input type="checkbox" name="moment" value="启动阶段">启动阶段
					<input type="checkbox" name="moment" value="运行阶段">运行阶段
						<input type="checkbox" name="moment" value="项目结束">项目结束 </div><br>
			<div class="div010"><span class="span1">项目主要内容</span></div>
			<div class="div009" style="padding-left:2px;"><input type="text" name="promaryCoverage"></div>
			<div id="div03">
			<button class="button01" type="button" onclick="cancel()">取消</button>
			<button  class="button02" type="submit" onclick="toadd()">提交</button>
			</div>
	</div>


</body>

</html>