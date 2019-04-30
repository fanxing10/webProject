<%--
  Created by IntelliJ IDEA.
  User: WQSDP2019
  Date: 2019/4/19
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户新增</title>
	<link rel="stylesheet" href="../css/3.css" />
	<link rel="stylesheet" type="text/css" href="/css/2.css">
	<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<style>

	</style>
</head>
<body>

	<div id="div1">
		<p id="p1">甘肃省文化产业信息管理平台</p>
		<p id="p2">${name}，您好！</p>
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
	<div>
		<div id="div01">
			<p id="p01">专家编辑</p>
		</div>
		<form action="/expert?type=edit" method="post">
		<div id="div02">

			<input type="hidden" name="id" value="${expert.id}" style="border: none"><br>
			<div class="div001"><span class="span1" >姓名</span></div>
			<%--<div class="div002"><input type="text" name="name" value="${expert.name}" disabled="true"></div>--%>
			<div class="div002"><input type="text" name="name" value="${expert.name}" readonly="readonly"></div>
			<div class="div001"><span class="span1" >身份证号</span></div>
			<div class="div003"><input type="text" name="idCard" value="${expert.idNum}" readonly="readonly"></div><br>
			<div class="div004"><span class="span1">性别</span></div>
			<div class="div002"><input type="radio" name="sex"  value="男">男<input type="radio" name="sex" value="女">女</div>
			<div class="div001"><span class="span1">民族</span></div>
					<div class="div003"><select id="nation" name="nation">

						<option value="汉族">汉族</option>
						<option value="蒙古族">蒙古族</option>
						<option value="回族">回族</option>
						<option value="藏族">藏族</option>
						<option value="维吾尔族">维吾尔族</option>
						<option value="苗族">苗族</option>
						<option value="彝族">彝族</option>
						<option value="壮族">壮族</option>
						<option value="布依族">布依族</option>
						<option value="朝鲜族">朝鲜族</option>
						<option value="满族">满族</option>
						<option value="侗族">侗族</option>
						<option value="瑶族">瑶族</option>
						<option value="白族">白族</option>
						<option value="土家族">土家族</option>
						<option value="哈尼族">哈尼族</option>
						<option value="哈萨克族">哈萨克族</option>
						<option value="傣族">傣族</option>
						<option value="黎族">黎族</option>
						<option value="傈僳族">傈僳族</option>
						<option value="佤族">佤族</option>
						<option value="畲族">畲族</option>
						<option value="高山族">高山族</option>
						<option value="拉祜族">拉祜族</option>
						<option value="水族">水族</option>
						<option value="东乡族">东乡族</option>
						<option value="纳西族">纳西族</option>
						<option value="景颇族">景颇族</option>
						<option value="柯尔克孜族">柯尔克孜族</option>
						<option value="土族">土族</option>
						<option value="达斡尔族">达斡尔族</option>
						<option value="仫佬族">仫佬族</option>
						<option value="羌族">羌族</option>
						<option value="布朗族">布朗族</option>
						<option value="撒拉族">撒拉族</option>
						<option value="毛南族">毛南族</option>
						<option value="仡佬族">仡佬族</option>
						<option value="锡伯族">锡伯族</option>
						<option value="阿昌族">阿昌族</option>
						<option value="普米族">普米族</option>
						<option value="塔吉克族">塔吉克族</option>
						<option value="怒族">怒族</option>
						<option value="俄罗斯族">俄罗斯族</option>
						<option value="鄂温克族">鄂温克族</option>
						<option value="德昂族">德昂族</option>
						<option value="保安族">保安族</option>
						<option value="裕固族">裕固族</option>
						<option value="京族">京族</option>
						<option value="塔塔尔族">塔塔尔族</option>
						<option value="独龙族">独龙族</option>
						<option value="鄂伦春族">鄂伦春族</option>
						<option value="赫哲族">赫哲族</option>
						<option value="门巴族">门巴族</option>
						<option value="珞巴族">珞巴族</option>
						<option value="基诺族">基诺族</option></select>
					</div><br>
			<div class="div004"><span class="span1">出生年月</span></div>
			<div class="div002">
				<select  id="birth" name="birth" type="text" class="select_time" >
					<%--<option value="">出生年月</option>--%>
					<option value="${expert.birth}">${expert.birth}</option>
				</select></div>
			<div class="div001"><span class="span1">单位</span></div>
			<div class="div003"><input type="text" value="${expert.unit}" name="unit" required="required"></div><br>
			<div class="div004"><span class="span1">工作部门</span></div>
			<div class="div002"><input type="text" value="${expert.department}" name="department" required="required"></div>
			<div class="div001"><span class="span1">学科</span></div>
			<div class="div003"><input type="text" value="${expert.subject}" name="subject"></div><br>
			<div class="div004"><span class="span1">职务职称</span></div>
			<div class="div002"><input type="text" name="job" value="${expert.job}"></div>
			<div class="div001"><span class="span1">研究方向</span></div>
			<div class="div003"><input type="text" name="sArea" value="${expert.researchArea}" required="required"></div><br>
			<div class="div004"><span class="span1">行业分类</span></div>
			<div class="div002"><input type="text" name="industryCategory" value="${expert.industryCategory}" required="required"></div>
			<div class="div001"><span class="span1">联系电话</span></div>
			<div class="div003"><input type="text" name="phoneNum" value="${expert.phoneNum}" required="required"></div><br>
			<div class="div004"><span class="span1">邮箱</span></div>
			<div class="div002"><input type="text" name="email" value="${expert.email}" required="required"></div>
			<div class="div001"><span class="span1">地址</span></div>
			<div class="div003"><input type="text" name="address" value="${expert.address}"></div><br>
			<div class="div005">主要成就</div>
			<div class="div006"><input type="text" name="mainSuccess" value="${expert.mainSuccess}"></div><br>
			<div class="div005">荣誉奖励</div>
			<div class="div006"><input type="text" name="honor" value="${expert.honor}"></div>
		<div id="div03">
			<button class="button01" type="button" onclick="location.href='../jsp/main.jsp'">取消</button>
			<button class="button02" type="submit">保存</button>
		</div>
		</div>
		</form>
	</div>
		<script>


		$(document).ready(function () {
			$("select option[value="+'${expert.nation}'+"]").attr("selected", true);
			<%--var  s = "${expert.birth}";--%>
			<%--$('#birth').find("option[value=s]").attr("selected",true);--%>
			<%--alert(s);--%>
			$("input[name='sex'][value='"+'${expert.sex}'+"']").attr("checked",true);
		});
         $(document).ready(function(){
         	$("#button02").click(function(){
         		$("#").post("");
         	});
         });
        $(document).ready(
            window.onload=function(){////设置年份的选择
				var myDate= new Date();
				var year = myDate.getFullYear(); // 年份
				var month = myDate.getMonth() + 1; // 月份
				var startYear=myDate.getFullYear()-50;//起始年份 这个可以自定义前后多少年。
				var endYear=myDate.getFullYear()-18;//结束年份
				var obj=document.getElementsByClassName('select_time');
				var o;
				for (o = 0;o<obj.length;o++)        {
					for (var i=startYear;i<=endYear;i++)            {
						for (var j=1;j<=12;j++)                {
							obj[o].options.add(new Option(i+"-"+j,i+"-"+j));
							if (j == 12){
								obj[o].options.add(new Option("---------------",""));                    }                }            }          //  设置选中当前月
								$(obj[o]).find("option").each(function () {
									if ($(this).val() === year+"-"+month){
										$(this).attr("selected",true)
									}
								});
				}
            });

		</script>
		
	</body>
</html>