<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
    function check() {
    	var tip = document.getElementById('tip');
    	var password = document.getElementById('password');
    	var password2 = document.getElementById('password2');
    	
		if(password.value.length==0 || password2.value.length==0){
			tip.innerHTML="信息不完整";
			return false;
		}
		var pattern = /^\w{6,}$/; //密码至少6位
	    if(!pattern.test(password.value)){
	    	password.value="";
			password2.value="";
			password.focus();
	    	tip.innerHTML="密码过短";
	    	return false;
	    }

		if(password.value != password2.value){
			password.value="";
			password2.value="";
			password.focus();
			tip.innerHTML="密码输入不一致！";
			return false;
		}
		document.form.submit();
	}
    </script>
	<title>重置密码-大学生创新创业训练项目库管理系统</title>
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
			<h1 class="margin-bottom-15">重置密码</h1>
			<form class="form-horizontal templatemo-forgot-password-form templatemo-container" role="form" id= "form" name="form"
			action="${pageContext.request.contextPath}/user/resetPWD" method="post">
				<div class="form-group">
		          <div class="col-md-12">
		          	请输入你的密码，并确认密码
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
		            <input type="hidden" name="id" value="${param.id}">
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="password" class="form-control" id="password2" name="password2" placeholder="请确认密码">
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
		            <input type="button" value="重置" class="btn btn-danger" onclick="check()">
                    <br><br>
                    <a href="${pageContext.request.contextPath}/user/login">登陆页</a>
                    <a href="${pageContext.request.contextPath}/">主页</a>
		          </div>
		        </div>
		      </form>
		</div>
	</div>
</body>
</html>