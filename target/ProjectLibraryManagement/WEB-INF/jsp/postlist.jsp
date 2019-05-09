<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body data-type="index">
    <%@include file='common/header-nologin.jsp' %>
    <div class="tpl-page-container">
    <%@include file='common/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                公告
            </div>
            <ol class="am-breadcrumb">
                <li class="am-active">公告列表</li>
            </ol>
        </div>

        <div class="tpl-content-wrapper">

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 公告列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="j_posts" class="am-table am-table-striped am-table-hover table-main">
                                </table>
                                <div class="am-cf">
                                    <div class="am-fr">
                                        <ul id="j_page" class="am-pagination tpl-pagination">
                                        </ul>
                                    </div>
                                </div>
                                <hr>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>
        </div>
    </div>

    <%@include file='common/footer.jsp' %>

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
function postlist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listPost',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10',
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="getGoalPage('+data.firstPage+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="getGoalPage('+data.firstPage+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="getGoalPage('+item+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="getGoalPage('+item+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="getGoalPage('+data.lastPage+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="getGoalPage('+data.lastPage+')">»</a></li>';
				}
				
				$('#j_page').empty();
				$('#j_page').append(pages);
				$('#j_posts').empty();
				var posts = '<thead><tr>'
                    +'<th class="table-id">序号</th>'
                    +'<th class="table-title">标题</th>'
                    +'<th class="table-author am-hide-sm-only">作者</th>'
                    +'<th class="table-date am-hide-sm-only">修改日期</th>'
                    +'</tr></thead>'
				//内容
				$(data.list).each(function(index,item){
					var num = index+1;
					posts +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="${pageContext.request.contextPath}/postdetail?piId='+item.piId+'">'
                    +item.piTitle+'</a></td>'
                    +'<td class="am-hide-sm-only">'+item.uName+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.postEditTime).format('YYYY-MM-DD HH:mm:ss')+'</td></tr></tbody>';
				});
				$('#j_posts').append(posts);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
$(function(){
	$('#j_postbutton').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_postbutton').addClass("nav-link active");
	//公告栏
	postlist(1);
});
</script>
</html>