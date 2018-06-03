<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>在Form表单中使用验证码</title>
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	//刷新验证码
	function changeImg() {
		document.getElementById("validateCodeImg").src = "${pageContext.request.contextPath}/verifyCode?"
				+ Math.random()+"&flush=xxx";
	}
	//请求key/value，输出是json
	function responseJson(){
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/ListJson',
	        //请求是key/value这里不需要指定contentType，因为默认就 是key/value类型
	        //数据格式是key/value，商品信息
	        data:'page=2&pageSize=3',
	        success:function(data){//返回json结果
	            alert(data[0]);
	        }       
	    }); 
	}
</script>
</head>
<body>
	<h2>Hello World!</h2>
	<h2>${info}</h2>
	<h2>${user.uId}</h2>
	<a href="${pageContext.request.contextPath}/user/login">登陆</a>
	<button type="button" onclick="responseJson()">json</button>
	<form action="${pageContext.request.contextPath}/" method="post">
		验证码：<input type="text" name="validateCode" /> <img alt="验证码看不清，换一张"
			src="${pageContext.request.contextPath}/verifyCode?flush=xxx"
			id="validateCodeImg" onclick="changeImg()"> <a
			href="#" onclick="changeImg()">看不清，换一张</a> <br /> <input
			type="submit" value="提交">
	</form>
</body>
</html>
