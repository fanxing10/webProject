
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>甘肃省文化产业项目信息管理平台</title>
		<link rel="stylesheet" type="text/css" href="../css/2.css">
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

	</head>
	<body>
		<div id="div1">
			<p id="p1">甘肃省文化产业信息管理平台</p>
			<p id="p2">管理员，您好！</p>
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
		</div>
		<div id="div6">
		<div id="div3">
			<p>专家列表</p>
		</div>
		
		<div id="div4">
			<div id="div5">
			<button id="button2">新增</button>
			<button id="button4">编辑</button>
			<button id="button1">删除</button>
			<button id="button3">分配项目</button>
			
			</div>
			<div id="div7">
				<table id="table1" cellpadding="15px" cellspacing="2px">
					
					<tr id="tr1">
						<td></td>
						<td>序号</td>
						<td>姓名</td>
						<td>专家类别</td>
						<td>性别</td>
						<td>民族</td>
						<td>出生年月</td>
						<td>工作单位</td>
						<td>职务</td>
						<td>工作部门</td>
						<td>学科</td>
						<td>研究方向</td>
						
					</tr>
					<tr id="tr2">
						<td><input type="checkbox" ></td>
						<td>1</td>
						<td>李磊</td>
						<td>专家学者</td>
						<td>男</td>
						<td>汉</td>
						<td>1991.08</td>
						<td>兰州大学</td>
						<td>教授</td>
						<td>行政部</td>
						<td>工学</td>
						<td>人工智能</td>
					
					</tr>
					
					<tr id="tr3">
						<td><input type="checkbox" ></td>
						<td>2</td>
						<td>李磊</td>
						<td>专家学者</td>
						<td>男</td>
						<td>汉</td>
						<td>1991.08</td>
						<td>兰州大学</td>
						<td>教授</td>
						<td>行政部</td>
						<td>工学</td>
						<td>人工智能</td>
					
					</tr>
					
				</table>
			</div>
			
		</div>
		
		</div>
		<script>
			
           $(document).ready(function () {
                $("#a1").click(function () {
                     $("#div6").load("projectmana.jsp");
               });
           });
           $(document).ready(function () {
                $("#a2").click(function () {
                     $("#div6").load("expertmana.jsp");
               });
           });
         $(document).ready(function(){
         	$("#button1").click(function(){
         		$("input").show();
         	});
         });
          $(document).ready(function () {
                $("#button2").click(function () {
                     $("#div4").load("expertadd.jsp");
               });
           });
           $(document).ready(function () {
                $("#button3").click(function () {
                     $("#div4").load("allocation.jsp");
               });
           });
           $(document).ready(function () {
                $("#button4").click(function () {
                     $("#div4").load("editExp.jsp");
               });
           });
        </script>
	</body>
</html>
