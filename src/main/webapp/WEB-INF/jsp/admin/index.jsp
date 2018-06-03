<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人中心-大学生创新创业训练项目库管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="../assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/app.css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        img {
        max-width: 100%;
        max-height: 100%;
        }
    </style>
</head>

<body data-type="index">
    
    <%@include file='../common/header-login.jsp' %>
    
    <div class="tpl-page-container">
    
    <%@include file='../admin/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
               个人中心
            </div>
            <ol class="am-breadcrumb">
                <li><a href="${pageContext.request.contextPath}/" class="am-icon-home">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/loginCheck">个人中心</a></li>
                <li class="am-active">内容</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 个人中心
                    </div>
                </div>
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button type="button"
									class="am-btn am-btn-default am-btn-success"
									data-toggle="modal" data-target="#edituserinfo">个人资料</button>
								<button type="button" onclick="reset()"
									class="am-btn am-btn-default am-btn-secondary">重置密码</button>
							</div>
						</div>
                    </div>
                </div>
                <hr>
                <div class="am-g">
                    <div class="am-u-sm-12">
                    <input type="hidden" id="recentprojectid" name="recentprojectid" value="">
                        <form class="am-form">
                        <img src="../images/welcome.jpg"/>
                        </form>
                    </div>
                </div>
                
                <!--大边距-->
                <div class="tpl-alert"></div>
            </div>
        </div>
    </div>
    <%@include file='../common/footer.jsp' %>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/iscroll.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/echarts.min.js"></script>
    <script src="../js/moment.js"></script>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/myScript.js"></script>
</body>
<script type="text/javascript">
$(function(){
	$('#j_center').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_center').addClass("nav-link active");
});
</script>
</html>