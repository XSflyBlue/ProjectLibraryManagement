<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>注册-大学生创新创业训练项目库管理系统</title>
	<script type="text/javascript">
	//表单验证
	function registerStuSubmit() {
		var check = checkInput();
		if(check ==true && confirm("是否提交注册信息？")){
			document.registerform.submit();
		}
	}
	function registerTeSubmit() {
		document.getElementById("userType").value = 1;
		var check = checkInput();
		if(check==true && confirm("是否提交注册信息？")){
			document.registerform.submit();
		}
	}
	function checkInput() {
		var tip = document.getElementById('tip');

		var uName = document.getElementById('uName');
		var uRealname = document.getElementById('uRealname');
		var email = document.getElementById('email');
		var uCode = document.getElementById('uCode');
		var sex = document.getElementsByName('sex');
		var uPassword = document.getElementById('uPassword');
		var uPassword2 = document.getElementById('uPassword2');
		var isAgree = document.getElementById('isAgree');

		if(uName.value.length==0 || uRealname.value.length==0 
				|| email.value.length==0 || uCode.value.length==0
			    || uPassword.value.length==0 
				|| uPassword2.value.length==0 || isAgree.checked != true){
			tip.innerHTML="信息不完整";
			return false;
		}
		var tagflag = false;
		for (var i = sex.length - 1; i >= 0; i--) {
			if(sex[i].checked){
				tagflag = true;
			}
		}
		if(tagflag==false){
			tip.innerHTML="信息不完整";
			return false;
		}

		var userpattern = /^\w{3,}$/;  //用户名格式正则表达式：用户名要至少三位
		if(!userpattern.test(uName.value)){
			uName.value="";
	  		uName.focus();
	  		tip.innerHTML="用户名至少三位";
	        return false;
		}
		var re = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
	  	if (!re.test(email.value)){
	  		email.value="";
	  		email.focus();
	  		tip.innerHTML="邮箱格式错误";
	        return false;
	    }

	    var pattern = /^\w{6,}$/; //密码至少6位
	    if(!pattern.test(uPassword.value)){
	    	uPassword.value="";
			uPassword2.value="";
			uPassword.focus();
	    	tip.innerHTML="密码过短";
	    	return false;
	    }

		if(uPassword.value != uPassword2.value){
			uPassword.value="";
			uPassword2.value="";
			uPassword.focus();
			tip.innerHTML="密码输入不一致！";
			return false;
		}
		return true;
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
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="../css/templatemo_style.css" rel="stylesheet" type="text/css">
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">注册</h1>
	<div class="container">
		<div class="col-md-12">
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" id= "registerform" name="registerform"
			action="${pageContext.request.contextPath}/user/registerCheck" method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="uName" class="control-label">用户名</label>
			            <input type="text" class="form-control" id="uName" name="uName" placeholder="" value="${uName}">
			          </div>
			          <div class="col-md-6">
			            <label for="uRealname" class="control-label">真实姓名</label>
			            <input type="text" class="form-control" id="uRealname" name="uRealname" value="${uRealname}">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <label for="email" class="control-label">Email</label>
			            <input type="email" class="form-control" id="email" name="email" value="${email}">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			            <label for="uCode" class="control-label">学号/工号</label>
			            <input type="text" class="form-control" id="uCode" name="uCode" value="${uCode}">
			          </div>
			          <div class="col-md-6 templatemo-radio-group">
			          	<label class="radio-inline">
		          			<input type="radio" name="sex" id="sex" value="0"> 男
		          		</label>
		          		<label class="radio-inline">
		          			<input type="radio" name="sex" id="sex" value="1"> 女
		          		</label>
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			            <label for="password" class="control-label">密码</label>
			            <input type="password" class="form-control" id="uPassword" name="uPassword" placeholder="">
			          </div>
			          <div class="col-md-6">
			            <label for="password" class="control-label">确认密码</label>
			            <input type="password" class="form-control" id="uPassword2" placeholder="">
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
			            <label><input type="checkbox" id="isAgree">我同意 <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal">服务协定</a></label>
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="button" value="注册成为学生" class="btn btn-info" onclick="registerStuSubmit()">
			            <input type="button" value="注册成为教师" class="btn btn-info" onclick="registerTeSubmit()">
			            <input type="button" value="返回主页" class="btn btn-danger" onclick="returnIndex()">
			            <a href="${pageContext.request.contextPath}/user/login" class="pull-right">登录</a>
			          </div>
			        </div>
				</div>
				<input type="hidden" id="userType" name="userType" value="0">
		      </form>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="templatemo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="myModalLabel">服务协定</h4>
	      </div>
	      <div class="modal-body">
	      	<p>点击勾选即表明同意该协定。作者<a rel="nofollow" href="https://github.com/XSflyBlue">github</a></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</body>
</html>