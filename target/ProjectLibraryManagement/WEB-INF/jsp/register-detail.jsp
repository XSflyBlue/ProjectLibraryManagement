<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>注册-大学生创新创业训练项目库管理系统</title>
	<script type="text/javascript">
	//表单验证
	function registerSubmit() {
		var tip = document.getElementById('tip');
		var flag = false;
		var college = document.getElementById('college');
		var major = document.getElementById('major');
		var note = document.getElementById('note');
		var tel = document.getElementById('tel');
		var usr = "${userNew.role}";

		if(college.value.length==0 || major.value.length==0
				|| note.value.length==0 || tel.value.length==0){
			tip.innerHTML="信息不完整";
			flag = false;
			return;
		}
		if(usr=="5"){//学生
			document.getElementById("userType").value = 0;
			var a = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/
				if (!a.test(note.value)) {
					tip.innerHTML="日期格式不正确!如：2018-08-08";
					flag = false;
					return;
				}
		}

		var mobile = /^1[3|4|5|6|7|8|9]\d{9}$/;
		var phone  = /^0\d{2,3}-?\d{7,8}$/;
		if (mobile.test(tel.value) || phone.test(tel.value)) {
			flag = true;
		} else {
			tip.innerHTML="手机或电话格式不正确!如：13000000000/023|0880-2333333";
			flag = false;
		}
		if(flag == true && confirm("是否提交注册信息？")){
			document.registerform.submit();
		}
	}
	</script>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css">
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">注册</h1>
	<div class="container">
		<div class="col-md-12">
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" id= "registerform" name="registerform"
			action="${pageContext.request.contextPath}/user/registerDetail" method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="college"  name="college" placeholder="">
			          </div>
			          <div class="col-md-6">
			            <label for="major" class="control-label">专业</label>
			            <input type="text" class="form-control" id="major" name="major" placeholder="">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			          <c:if test="${userNew!=null&&userNew.role==5}">
			            <label for="note" class="control-label">入校时间</label>
			            <input type="text" class="form-control" id="note" name="note" placeholder="2018-01-01">
			           </c:if>
			           <c:if test="${userNew!=null&&userNew.role==4}">
			            <label for="note" class="control-label">职称</label>
			            <input type="text" class="form-control" id="note" name="note" placeholder="">
			           </c:if>
			          </div>
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="tel" name="tel" placeholder="">
			          </div>
			        </div>
			        <div class="form-group">
			        <div class="col-md-12">
						<div class="control-wrapper">
							<font size="3" color="red" id="tip"></font>
						</div>
						<div class="control-wrapper">
							<font size="3" color="red" id="info">${info}</font>
						    </div>
					    </div>
				    </div>

			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="button" value="完成注册" class="btn btn-info" onclick="registerSubmit()">
			            <a href="${pageContext.request.contextPath}/user/login" class="pull-right">跳过，直接登录</a>
			          </div>
			        </div>
			        <input type="hidden" id="userType" name="userType" value="1">
				</div>
		      </form>
		</div>
	</div>
	<!-- Modal -->
	<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</body>
</html>