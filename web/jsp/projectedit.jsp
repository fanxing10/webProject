<%--
  Created by IntelliJ IDEA.
  User: 16848
  Date: 2019/4/25
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>


<div id="div01">
    <p id="p01">项目修改</p>
</div>
<div id="div02">
    <form action="#">

        <input type="hidden" name="id" value="${plist.id}" style="border: none"><br>
        <div class="div001"><span class="span1">项目名称</span></div>
        <div class="div007" style="padding-right:2px;">
            <input type="text" name="projectName" value="${plist.projectName}" readonly="readonly"
                   style="background-color: #dcdde1"></div>
        <br>
        <div class="div001"><span class="span1">联系人</span></div>
        <div class="div002"><input type="text" name="applyer" value="${plist.applyer}"></div>
        <div class="div001"><span class="span1">电子邮箱</span></div>
        <div class="div008"><input type="text" name="email" value="${plist.email}"></div>
        <br>
        <div class="div001"><span class="span1">固定电话</span></div>
        <div class="div002"><input type="text" name="landlinePhone" value="${plist.landlinePhone}"></div>
        <div class="div001"><span class="span1">移动电话</span></div>
        <div class="div008"><input type="text" name="mobilePhone" value="${plist.mobilePhone}"></div>
        <br>
        <div class="div001"><span class="span1">项目总资产</span></div>
        <div class="div002"><input type="text" name="money" value="${plist.money}"></div>
        <div class="div001"><span class="span1">已完成投资</span></div>
        <div class="div008"><input type="text" name="moneyGiven" value="${plist.moneyGiven}"></div>
        <br>
        <div class="div001"><span class="span1">项目所处阶段</span></div>
        <div class="div007" style="padding-right:2px;">

            <input type="hidden" id="hidRadio" value="${plist.moment}"/>
            <input type="radio" name="moment" value="论证阶段">论证阶段
            <input type="radio" name="moment" value="启动阶段">启动阶段
            <input type="radio" name="moment" value="运行阶段">运行阶段
            <input type="radio" name="moment" value="项目结束">项目结束
        </div>
        <br>
        <div class="div010"><span class="span1">项目主要内容</span></div>
        <div class="div009" style="padding-left:2px;"><input type="text" name="promaryCoverage"
                                                             value="${plist.promaryCoverage}"></div>
        <div id="div03">
            <button class="button01" type="button" onclick="cancel()">取消</button>
            <button class="button02" type="submit" onclick="toedit()">提交</button>
        </div>
    </form>
</div>


<script>
    $(function () {
        var stats = $("#hidRadio").val();
        // alert("00"+stats);
        $("input[name='moment'][value='" + stats + "']").attr("checked", true);
    });
</script>

</body>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/3.css"/>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <title>项目修改</title>
    <script>
        function cancel() {
            $(document).ready(function () {
                $("#div6").load("../jsp/project.jsp");
            })

        }

        function toedit() {
            var url = "/project";
            var id = $("input[name='id']").val();
            var projectName = $("input[name='projectName']").val();
            var applyer = $("input[name='applyer']").val();
            var email = $("input[name='email']").val();
            var landlinePhone = $("input[name='landlinePhone']").val();
            var mobilePhone = $("input[name='mobilePhone']").val();
            var money = $("input[name='money']").val();
            var moment = $("input[name=moment]:checked").val();
            // var moment1 = check();
            // alert("momoent1"+moment1);
            var promaryCoverage = $("input[name='promaryCoverage']").val();
            var moneyGiven = $("input[name='moneyGiven']").val();
            var data = {
                "type": "edit",
                "id": id,
                "projectName": projectName,
                "applyer": applyer,
                "email": email,
                "landlinePhone": landlinePhone,
                "mobilePhone": mobilePhone,
                "money": money,
                "moment": moment,
                "promaryCoverage": promaryCoverage,
                "moneyGiven": moneyGiven
            };
            $.ajax({
                url: url,
                data: data,
                type: "post",
                async: false,
                success: function (data) {
                    alert(data);
                    alert("修改成功");
                    $("#div6").load(data);
                },
                error: function () {
                    alert("修改失败");
                }
            })
        }

        function check() {
            var radio = document.getElementsByName("moment");
            alert("radio:" + radio);
            for (var i = 1; i <= radio.length; i++) {
                if (radio[i].checked) {
                    return radio[i].vaule;
                }
            }
        }

    </script>
</head>

</html>