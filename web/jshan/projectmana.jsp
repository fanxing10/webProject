
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>项目管理</title>
		<link rel="stylesheet" href="../css/2.css" />
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	</head>
	<body>
		<div id="div6">
		<div id="div3">
			<p>项目申报</p>
		</div>
		
		<div id="div4">
			<div id="div5">
			<button id="button3">新增</button>
			<button id="button7">编辑</button>
			<button id="button1">删除</button>
			</div>
		<div id="div7">		
			<table id="table1" cellpadding="15px" cellspacing="2px">
					<tbody><tr id="tr1">
						<td></td>
						<td>序号</td>
						<td>项目名称</td>
						<td>项目内容</td>
						<td>申报金额（万元）</td>
						<td>项目状态</td>
						<td>申报提交时间</td>
						<td>提交人</td>
						<td>联系方式</td>
						<td>固定电话</td>
						
					</tr>
					<tr id="tr2">
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>丝绸之路文化项目</td>
						<td>内容若干</td>
						<td>50</td>
						<td>通过</td>
						<td>2019.4.13</td>
						<td>向西</td>
						<td>123456789</td>
						<td>123456</td>
						
					</tr>
					
					<tr id="tr3">
						<td><input type="checkbox"></td><td>2</td>
						<td>丝绸之路文化项目</td>
						<td>内容若干</td>
						<td>50</td>
						<td>通过</td>
						<td>2019.4.13</td>
						<td>向西</td>
						<td>123456789</td>
						<td>123456</td>
					</tr>
					
				</tbody></table>
			</div>
		</div>
		<script>
			$(document).ready(function(){
         	$("#button1").click(function(){
         		$("input").show();
         	});
         });
         $(document).ready(function(){
         	$("#button3").click(function(){
         		$("#div4").load("projectadd.jsp");
         	});
         });
         $(document).ready(function(){
         	$("#button7").click(function(){
         		$("#div4").load("editproject.jsp");
         	});
         });
         
		</script>
	</body>
</html>
