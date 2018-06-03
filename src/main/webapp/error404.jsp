<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>404错误</title>

<style type="text/css">
body, code, dd, div, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6,
	input, legend, li, ol, p, pre, td, textarea, th, ul {
	margin: 0;
	padding: 0
}

body {
	font: 14px/1.5 'Microsoft YaHei', '微软雅黑', Helvetica, Sans-serif;
	min-width: 1200px;
	background: #f0f1f3;
}

:focus {
	outline: 0
}

h1, h2, h3, h4, h5, h6, strong {
	font-weight: 700
}

a {
	color: #428bca;
	text-decoration: none
}

a:hover {
	text-decoration: underline
}

.error-page {
	background: #f0f1f3;
	padding: 80px 0 180px
}

.error-page-container {
	position: relative;
	z-index: 1
}

.error-page-main {
	position: relative;
	background: #f9f9f9;
	margin: 0 auto;
	width: 617px;
	-ms-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 50px 50px 70px
}

.error-page-main:before {
	content: '';
	display: block;
	background: url(images/errorPageBorder.png?1427783409637);
	height: 7px;
	position: absolute;
	top: -7px;
	width: 100%;
	left: 0
}

.error-page-main h3 {
	font-size: 24px;
	font-weight: 400;
	border-bottom: 1px solid #d0d0d0
}

.error-page-main h3 strong {
	font-size: 54px;
	font-weight: 400;
	margin-right: 20px
}

.error-page-main h4 {
	font-size: 20px;
	font-weight: 400;
	color: #333
}

.error-page-actions {
	font-size: 0;
	z-index: 100
}

.error-page-actions div {
	font-size: 14px;
	display: inline-block;
	padding: 30px 0 0 10px;
	width: 50%;
	-ms-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	color: #838383
}

.error-page-actions ol {
	list-style: decimal;
	padding-left: 20px
}

.error-page-actions li {
	line-height: 2.5em
}

.error-page-actions:before {
	content: '';
	display: block;
	position: absolute;
	z-index: -1;
	bottom: 17px;
	left: 50px;
	width: 200px;
	height: 10px;
	-moz-box-shadow: 4px 5px 31px 11px #999;
	-webkit-box-shadow: 4px 5px 31px 11px #999;
	box-shadow: 4px 5px 31px 11px #999;
	-moz-transform: rotate(-4deg);
	-webkit-transform: rotate(-4deg);
	-ms-transform: rotate(-4deg);
	-o-transform: rotate(-4deg);
	transform: rotate(-4deg)
}

.error-page-actions:after {
	content: '';
	display: block;
	position: absolute;
	z-index: -1;
	bottom: 17px;
	right: 50px;
	width: 200px;
	height: 10px;
	-moz-box-shadow: 4px 5px 31px 11px #999;
	-webkit-box-shadow: 4px 5px 31px 11px #999;
	box-shadow: 4px 5px 31px 11px #999;
	-moz-transform: rotate(4deg);
	-webkit-transform: rotate(4deg);
	-ms-transform: rotate(4deg);
	-o-transform: rotate(4deg);
	transform: rotate(4deg)
}
</style>

</head>
<body>

	<div class="error-page">
		<div class="error-page-container">
			<div class="error-page-main">
				<h3>
					<strong>404</strong>糟糕。网页跟丢了！
				</h3>
				<div class="error-page-actions">
					<div>
						<h4>可能原因：</h4>
						<ol>
							<li>网络信号差</li>
							<li>找不到请求的页面</li>
							<li>输入的网址不正确</li>
						</ol>
					</div>
					<div>
						<h4>可以尝试：</h4>
						<ul>
							<li><a href="${pageContext.request.contextPath}/">返回首页</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div class="footer" style="text-align: center;">Powered by
		flyblue, Copyright© 2018</div>
	<!-- //footer -->
</body>
</html>