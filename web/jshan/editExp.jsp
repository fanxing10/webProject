
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户新增</title>
		<link rel="stylesheet" href="../css/3.css" />
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	</head>
	<body>
		<div id="div01">
			<p id="p01">专家编辑</p>
		</div>
		<form action="">
		<div id="div02">
			<div class="div001"><span class="span1" >姓名</span></div>
			<div class="div002"><input type="text" name="" disabled="true"></div>
			<div class="div001"><span class="span1" >身份证号</span></div>
			<div class="div003"><input type="text" name="" value="13456789101234567" disabled="true"></div><br>
			<div class="div004"><span class="span1">性别</span></div>
			<div class="div002"><input type="radio" name="sex"  value="male">男<input type="radio" name="sex" value="female">女</div>
			<div class="div001"><span class="span1">民族</span></div>
			<div class="div003"><select  name="nation">
				<option value="1">汉族</option>  
    <option value="2">蒙古族</option>  
    <option value="3">回族</option>  
    <option value="4">藏族</option>  
    <option value="5">维吾尔族</option>  
    <option value="6">苗族</option>  
    <option value="7">彝族</option>  
    <option value="8">壮族</option>  
    <option value="9">布依族</option>  
    <option value="10">朝鲜族</option>  
    <option value="11">满族</option>  
    <option value="12">侗族</option>  
    <option value="13">瑶族</option>  
    <option value="14">白族</option>  
    <option value="15">土家族</option>  
    <option value="16">哈尼族</option>  
    <option value="17">哈萨克族</option>  
    <option value="18">傣族</option>  
    <option value="19">黎族</option>  
    <option value="20">傈僳族</option>  
    <option value="21">佤族</option>  
    <option value="22">畲族</option>  
    <option value="23">高山族</option>  
    <option value="24">拉祜族</option>  
    <option value="25">水族</option>  
    <option value="26">东乡族</option>  
    <option value="27">纳西族</option>  
    <option value="28">景颇族</option>  
    <option value="29">柯尔克孜族</option>  
    <option value="30">土族</option>  
    <option value="31">达斡尔族</option>  
    <option value="32">仫佬族</option>  
    <option value="33">羌族</option>  
    <option value="34">布朗族</option>  
    <option value="35">撒拉族</option>  
    <option value="36">毛南族</option>  
    <option value="37">仡佬族</option>  
    <option value="38">锡伯族</option>  
    <option value="39">阿昌族</option>  
    <option value="40">普米族</option>  
    <option value="41">塔吉克族</option>  
    <option value="42">怒族</option>  
    <option value="43">乌孜别克族</option>  
    <option value="44">俄罗斯族</option>  
    <option value="45">鄂温克族</option>  
    <option value="46">德昂族</option>  
    <option value="47">保安族</option>  
    <option value="48">裕固族</option>  
    <option value="49">京族</option>  
    <option value="50">塔塔尔族</option>  
    <option value="51">独龙族</option>  
    <option value="52">鄂伦春族</option>  
    <option value="53">赫哲族</option>  
    <option value="54">门巴族</option>  
    <option value="55">珞巴族</option>  
    <option value="56">基诺族</option></select>
			</div><br>
			<div class="div004"><span class="span1">出生年月</span></div>
			<div class="div002"><select  name="birth_time" type="text" class="select_time" >                          
				<option value="">出生年月</option>                        
			</select></div>
			<div class="div001"><span class="span1">单位</span></div>
			<div class="div003"><input type="text" name="" required="required"></div><br>
			<div class="div004"><span class="span1">工作部门</span></div>
			<div class="div002"><input type="text" name="" required="required"></div>
			<div class="div001"><span class="span1">学科</span></div>
			<div class="div003"><input type="text" name=""></div><br>
			<div class="div004"><span class="span1">职务职称</span></div>
			<div class="div002"><input type="text" name=""></div>
			<div class="div001"><span class="span1">研究方向</span></div>
			<div class="div003"><input type="text" name="" required="required"></div><br>
			<div class="div004"><span class="span1">行业分类</span></div>
			<div class="div002"><input type="text" name="" required="required"></div>
			<div class="div001"><span class="span1">联系电话</span></div>
			<div class="div003"><input type="text" name="" required="required"></div><br>
			<div class="div004"><span class="span1">邮箱</span></div>
			<div class="div002"><input type="text" name="" required="required"></div>
			<div class="div001"><span class="span1">地址</span></div>
			<div class="div003"><input type="text" name=""></div><br>
			<div class="div005">主要成就</div>
			<div class="div006"><input type="text" name=""></div><br>
			<div class="div005">荣誉奖励</div>
			<div class="div006"><input type="text" name=""></div>
		<div id="div03">
			<button class="button01" type="button" onclick="location.href='firstpage.jsp'">取消</button>
			<button class="button02" type="submit">保存</button>
		</div>
		</div>
		</form>
		<script>
			 
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
var endYear=myDate.getFullYear()+1;//结束年份        
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
						$(this).attr("selected",true)                }            });        }     });
		</script>
		
	</body>
</html>