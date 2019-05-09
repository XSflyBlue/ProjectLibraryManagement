<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>公告-大学生创新创业训练项目库管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body data-type="index">
	<%@include file='common/header-nologin.jsp'%>
	<div class="tpl-page-container">
	<%@include file='common/indexmenu.jsp'%>

		<div class="tpl-content-wrapper">
			<div class="tpl-content-page-title">公告</div>
			<ol class="am-breadcrumb">
				<li><a href="${pageContext.request.contextPath}/postlist" class="am-icon-home">公告列表</a></li>
				<li class="am-active">公告详情</li>
			</ol>
		</div>

		<div class="tpl-content-wrapper">

			<div class="tpl-portlet-components">
			    <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 公告详情
                    </div>
                </div>
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12">
							<form class="am-form" id="postcontent">
							</form>
						<hr>
						</div>
					</div>
				</div>
				<div class="tpl-alert"></div>
			</div>
		</div>
	</div>

	<%@include file='common/footer.jsp'%>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/echarts.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
$(function(){
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/postinfo',
        //数据格式是key/value
        data:'piId='+'<%= session.getAttribute("piId")%>',
        success:function(data){
			if(data!=null){
				var postinfo = '<div id="wrapper"><div class="content fl">'
				+'<div class="post_title"><center><h1>'+data.piTitle
				+'</h1></center><center>'
				+'<span id="source_baidu">发布时间：</span>'
				+'<span id="pubtime_baidu">'+moment(data.postEditTime).format('YYYY-MM-DD HH:mm:ss')+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'</span>'
				+'<span id="editor_baidu">发布人：<strong>'+data.uRealname+' </strong></span></center></div>'
				+'<div class="post_content" id="paragraph">'
				+'<p>'+data.piContent+'</p></div></div></div>';
				$('#postcontent').append(postinfo);
			}
		}
	});
});
</script>
</html>