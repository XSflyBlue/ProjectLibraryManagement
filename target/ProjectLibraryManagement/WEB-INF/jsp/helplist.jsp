<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>网站帮助-大学生创新创业训练项目库管理系统</title>
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
                网站帮助
            </div>
            <ol class="am-breadcrumb">
                <li class="am-active">帮助列表</li>
            </ol>
        </div>

        <div class="tpl-content-wrapper">

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 帮助列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="j_help" class="am-table am-table-striped am-table-hover table-main">
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
    
    <!-- 帮助详情（Modal） -->
	<div class="modal fade" id="helpdetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">帮助详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="helpid" name="helpid" value="">
					<div id="j_helpdetail" class="form-group">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
        url:'${pageContext.request.contextPath}/listhelp',
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
				$('#j_help').empty();
				var links = '<thead><tr>'
                    +'<th class="table-id">序号</th>'
                    +'<th class="table-title">帮助主题</th>'
                    +'<th class="table-title">帮助类型</th>'
                    +'<th class="table-title">帮助内容</th>'
                    +'<th class="table-set">操作</th>'
                    +'</tr></thead>'
				//内容
				$(data.list).each(function(index,item){
					var num = index+1;
					links +='<tbody><tr><td>'+num+'</td>'
                    +'<td>'+item.hTitle+'</a></td>'
                    +'<td class="am-hide-sm-only">'+item.hType+'</td>'
                    +'<td>'+item.hContent.substring(0,35)+'……</a></td>'
					+'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" '
                    +'data-toggle="modal" data-target="#helpdetail" onclick="puthelpid('+item.hId+')"> 详情</button>';
                    
                    links += '</div></div></td></tr></tbody>';
				});
				$('#j_help').append(links);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function puthelpid(helpid) {
	if(helpid==0){
		$('#helpid').val('');
	}else{
		$('#helpid').val(helpid);
	}
}

$(function(){
	$('#j_helpbutton').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_helpbutton').addClass("nav-link active");
	//公告栏
	postlist(1);
	
	$('#helpdetail').on('show.bs.modal', function () {
		var helpid = $('#helpid').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/helpinfo',
	        //数据格式是key/value
	        data:'helpid='+helpid,
	        success:function(data){
				if(data!=null&&data!=''){
	        		var detail = '<h4>帮助主题：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+data.hTitle+'</p></div>'
		        		+'<h4>帮助类型：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+data.hType+'</p></div>'
		        		+'<h4>帮助内容：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+data.hContent+'</p></div>';
	        		$('#j_helpdetail').empty();
	        		$('#j_helpdetail').append(detail);
				}
			}
		});
	})
});
</script>
</html>