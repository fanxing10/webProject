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
        <title>XXX项目查询</title>
        <link rel="stylesheet" href="../css/2.css" />
        <link rel="stylesheet" href="../css/3.css" />
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    </head>
    <body>
    	<div id="div01">
			<p id="p01">"${expertName}"专家项目查询</p>
		</div>
		<div id="div10">
			
			<table id="table01" cellpadding="10px" cellspacing="2px">
				<tr id="tr1">
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
				<c:forEach items="${projects}" var="list" varStatus="idx">
					<tr>
						<td><input type="radio" name="select" ></td>
						<td>${list.id}</td>
						<td>${list.projectName}</td>
						<td>${list.promaryCoverage}</td>
						<td>${list.money}</td>
						<td>${list.moment}</td>
						<td>${list.appleTime}</td>
						<td>${list.applyer}</td>
						<td>${list.mobilePhone}</td>
						<td>${list.landlinePhone}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="pag_box">
			 	<a id="btn0"></a>
			 	<input class="fenye" id="pageSize" type="text" size="1" maxlength="2" value="getDefaultValue()"/><a> 条 </a> <a href="#" id="pageSizeSet">设置</a>&nbsp;
			 	<a id="sjzl"></a>&nbsp;
			 	<a  href="#" id="btn1">首页</a>
                <a  href="#" id="btn2">上一页</a>
                <a  href="#" id="btn3">下一页</a>
                <a  href="#" id="btn4">尾页</a>&nbsp;
                 <a>转到&nbsp;</a>
                <input class="fenye" id="changePage" type="text" size="1" maxlength="4"/>
                <a>页&nbsp;</a>
                <a  href="#" id="btn5">跳转</a>
			</div>
			<div id="div04">
				<button class="button01" type="button" onclick="location.href='../jsp/main.jsp'">确定</button>
				<button class="button02" type="button" id="button6">添加项目</button>
			</div>
		</div>
		<script>
			 $(document).ready(function () {
                $("#button6").click(function () {
					$.ajax({
						url:"/expert",
						data: {"type":"allocate","id":${expertId}},
						type: "post",
						success: function (data) {
							$("#div4").load(data);
						},
						error: function () {
							alert("分配项目出错");
						}
					})


                     // $("#div4").load("allocation.jsp");
               });
           });
		</script>


		<script type="text/javascript">
            var pageSize = 3;    //每页显示的记录条数
			var curPage=0;        //当前页
			var lastPage;        //最后页
			var direct=0;        //方向
            var len;            //总行数
            var page;            //总页数
            var begin;
            var end;


            $(document).ready(function display(){
                len =$("#table01 tr").length - 1;    // 求这个表的总行数，剔除第一行介绍
                page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                // alert("page==="+page);
                curPage=1;    // 设置当前为第一页
                displayPage(1);//显示第一页

                document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";    // 显示当前多少页
                document.getElementById("sjzl").innerHTML="数据总量 " + len + "";        // 显示数据量
                document.getElementById("pageSize").value = pageSize;



                $("#btn1").click(function firstPage(){    // 首页
                    curPage=1;
                    direct = 0;
                    displayPage();
                });
                $("#btn2").click(function frontPage(){    // 上一页
                    direct=-1;
                    displayPage();
                });
                $("#btn3").click(function nextPage(){    // 下一页
                    direct=1;
                    displayPage();
                });
                $("#btn4").click(function lastPage(){    // 尾页
                    curPage=page;
                    direct = 0;
                    displayPage();
                });
                $("#btn5").click(function changePage(){    // 转页
                    curPage=document.getElementById("changePage").value * 1;
                    if (!/^[1-9]\d*$/.test(curPage)) {
                        alert("请输入正整数");
                        return ;
                    }
                    if (curPage > page) {
                        alert("超出数据页面");
                        return ;
                    }
                    direct = 0;
                    displayPage();
                });


                $("#pageSizeSet").click(function setPageSize(){    // 设置每页显示多少条记录
                    pageSize = document.getElementById("pageSize").value;    //每页显示的记录条数
                    if (!/^[1-9]\d*$/.test(pageSize)) {
                        alert("请输入正整数");
                        return ;
                    }
                    len =$("#table01 tr").length - 1;
                    page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                    curPage=1;        //当前页
                     direct=0;        //方向
                     firstPage();
                });
            });

            function displayPage(){
                if(curPage <=1 && direct==-1){
                    direct=0;
                    alert("已经是第一页了");
                    return;
                } else if (curPage >= page && direct==1) {
                    direct=0;
                    alert("已经是最后一页了");
                    return ;
                }

                lastPage = curPage;

                // 修复当len=1时，curPage计算得0的bug
                if (len > pageSize) {
                    curPage = ((curPage + direct + len) % len);
                } else {
                    curPage = 1;
                }


                document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";        // 显示当前多少页

                begin=(curPage-1)*pageSize + 1;// 起始记录号
                end = begin + 1*pageSize - 1;    // 末尾记录号


                if(end > len ) end=len;
                $("#table01 tr").hide();    // 首先，设置这行为隐藏
                $("#table01 tr").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
                    if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                        $(this).show();
                });
			}
		</script>
 	</body>
</html>