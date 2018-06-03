<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>登录-大学生创新创业训练项目库管理系统</title>
	<script type="text/javascript">
	//刷新验证码
	function changeImg() {
		document.getElementById("validateCodeImg").src = "${pageContext.request.contextPath}/verifyCode?"
				+ Math.random()+"&flush=xxx";
		}
	//表单验证
	function loginSubmit() {
		var nametip = checkUserName();
		if(!nametip){
			return;
			}
		var passtip = checkPassword();
		if(!passtip){
			return;
		}
		var codetip = checkCode();
		if(!codetip){
			return;
		}
		document.loginform.submit();
	}
     //验证用户名   
	function checkUserName(){
    	 var username = document.getElementById('username'); 
    	 var errname = document.getElementById('tip'); 
    	 var pattern = /^\w{3,}$/;  //用户名格式正则表达式：用户名要至少三位 
    	 var re = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
    	 if(username.value.length == 0){ 
    		 errname.innerHTML="用户名不能为空";
    		 return false; 
    		 } 
    	 if(pattern.test(username.value)||re.test(username.value)){ 
    		 return true; 
    		 }
    	 else{
    		 errname.innerHTML="用户名不合规范";
    		 errname.value="";
    		 errname.focus();
    		 return false; 
		     } 
		  } 
     //验证密码   
     function checkPassword(){
    	 var userpasswd = document.getElementById('password'); 
    	 var errPasswd = document.getElementById('tip');
    	 if(userpasswd.value.length == 0){ 
    		 errPasswd.innerHTML="密码不能为空";
    		 return false; 
    		 } 
    	 var pattern = /^\w{6,}$/; //密码至少6位 
    	 if(!pattern.test(userpasswd.value)){ 
		    errPasswd.innerHTML="密码过短";
		    return false; 
		    } 
    	 else{ 
		     return true; 
    		 } 
		  } 
    function checkCode() {
    	var verifyCode = document.getElementById('verifyCode');
    	var errcode = document.getElementById('tip'); 
    	if(verifyCode.value.length == 0){ 
    		errcode.innerHTML="验证码不能为空";
		    return false; 
		}else{
		    return true;
		}
	}
	//跳转回主页
	function returnIndex() {
		window.location.href='${pageContext.request.contextPath}/';
	}
    </script>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css">
</head>
<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">登录</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" id= "loginform" name="loginform" role="form" 
			action="${pageContext.request.contextPath}/user/loginCheck" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
							<c:if test="${uname==null}"><input type="text" class="form-control" id="username" name="username" placeholder="用户名/邮箱"></c:if>
							<c:if test="${uname!=null}"><input type="text" class="form-control" id="username" name="username" value="${uname}"></c:if>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
							<input type="password" class="form-control" id="password" name="password" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="verifyCode" class="control-label fa-label"><i class="fa fa-circle"></i></label>
							<input type="text" class="form-control" id="verifyCode" name="verifyCode" placeholder="验证码" style="width: 60%; display: inline-block; margin-right: 30px;">
							<img alt="验证码看不清，换一张" src="${pageContext.request.contextPath}/verifyCode" id="validateCodeImg" onclick="changeImg()">
						</div>
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
						<div class="control-wrapper">
							<input type="button" value="登录" class="btn btn-info" onclick="loginSubmit()">
							<input type="button" value="返回主页" class="btn btn-danger" onclick="returnIndex()">
							<a href="${pageContext.request.contextPath}/user/reset" class="text-right pull-right">忘记密码?</a>
						</div>
					</div>
				</div>
				<hr>
			</form>
			<div class="text-center">
				<a href="${pageContext.request.contextPath}/user/register" class="templatemo-create-new">注册新用户 <i class="fa fa-arrow-circle-o-right"></i></a>
			</div>
		</div>
	</div>
</body>
</html>