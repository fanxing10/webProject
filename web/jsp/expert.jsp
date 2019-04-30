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
    <meta charset="UTF-8">
    <title>项目管理</title>
    <link rel="stylesheet" type="text/css" href="../css/2.css" />
    <link rel="stylesheet" type="text/css" href="../css/3.css" />
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
        function delInfo(id,name) {
            var confirm = "确认删除用户名为" + name + "的专家以及其所有信息吗"
            var sure = window.confirm(confirm);
            if (sure) {
                $.ajax({
                    url: "/expert",
                    async: true,
                    data: {
                        "type": "del",
                        "id": id,

                    },
                    success: function () {
                        alert("成功删除用户名为" + name + "的专家");
                        // 删除成功后刷新页面
                        $("#div6").load("/expert")
                        // window.location.reload();
                    },
                    error: function () {
                        alert("删除失败");
                    },
                    dataType: "text"
                })
            }
        }
    </script>
</head>
<body>
<div id="div6">
    <div id="div3">
        <p>专家列表</p>
    </div>
    <div id="div4">
        <div id="div5">
            <button id="buttonAdd" >新增</button>
            <button id="buttonQuery">查看项目</button>
            <button >删除</button>
            <button id="allocate" >分配项目</button>
        </div>
        <div id="div7">
            <table id="table1" cellpadding="15px" cellspacing="2px">
                <tr id="tr1" class="trClass">
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
                    <td>操作</td>
                </tr>
                <c:forEach items="${lists}" var="list" varStatus="idx">
                    <tr class="trClass">
                        <td><input type="radio" name="select" value="${list.id}"></td>
                        <td>${list.id}</td>
                        <td>${list.name}</td>
                        <td>${list.industryCategory}</td>
                        <td>${list.sex}</td>
                        <td>${list.nation}</td>
                        <td>${list.birth}</td>
                        <td>${list.unit}</td>
                        <td>${list.job}</td>
                        <td>${list.department}</td>
                        <td>${list.subject}</td>
                        <td>${list.researchArea}</td>
                        <td><a href="/expert?type=toEdit&id=${list.id}" id="edit">编辑 </a>
                            <a href="javascript:void(0);" id="del" onclick="delInfo(${list.id},'${list.name}') ">删除</a>
                        </td>
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
        </div>
    </div>
</div>
    <script>

        $(document).ready(function () {

            $("#buttonAdd").click(function () {
                $("#div4").load("../jsp/expertadd.jsp");
            })

            $("#allocate").click(function () {
                var id = $("input[type='radio']:checked").val();
                if(id !=null){
                    $.ajax({
                        url:"/expert",
                        data: {"type":"allocate","id":id},
                        type: "post",
                        success: function (data) {
                            $("#div4").load(data);
                        },
                        error: function () {
                            alert("分配项目出错");
                        }
                    })
                }else alert("请选择专家！");
            });
            $("#buttonQuery").click(function () {
                var id = $("input[type='radio']:checked").val();

                if (id != null){
                    $.ajax({
                        url:"/expert",
                        data: {"type":"query","id":id},
                        type: "post",
                        success: function (data) {
                            $("#div4").load(data);
                        },
                        error: function () {
                            alert("查询项目出错,");
                        }
                    })
                }else alert("error,请确定是否选择了专家")
            })
        });


    </script>



<script type="text/javascript">
    var pageSize = 5;    //每页显示的记录条数
    var curPage=0;        //当前页
    var lastPage;        //最后页
    var direct=0;        //方向
    var len;            //总行数
    var page;            //总页数
    var begin;
    var end;


    $(document).ready(function display(){
        len =$("#table1 tr").length - 1;    // 求这个表的总行数，剔除第一行介绍
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
            len =$("#table1 tr").length - 1;
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
        $("#table1 tr").hide();    // 首先，设置这行为隐藏
        $("#table1 tr").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
            if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                $(this).show();
        });
    }
</script>
</body>
</html>