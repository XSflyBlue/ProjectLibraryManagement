<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>友情链接管理-大学生创新创业训练项目库管理系统</title>
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
    <%@include file='../common/header-login.jsp' %>
    <div class="tpl-page-container">
    <%@include file='../admin/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                友情链接管理
            </div>
            <ol class="am-breadcrumb">
                <li class="am-active">链接列表</li>
            </ol>
        </div>

        <div class="tpl-content-wrapper">

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 友情链接列表
                    </div>
                </div>
                <div class="am-g" id="addbutton">
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="j_links" class="am-table am-table-striped am-table-hover table-main">
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
    
    <!-- 新增链接（Modal） -->
	<div class="modal fade" id="addlink" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增链接</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
				<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>站点名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="addlinkname" class="form-control" size="30"><input type="hidden" id="linkname"></td>
								</tr>
							</tbody>
						</table>
						
						<div>
							<h4>
								站点地址：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addlinkurl" class="form-control" rows="5"></textarea>
							<input type="hidden" id="linkurl">
							<input type="hidden" id="linkid" name="linkid" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addlink()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
    <%@include file='../common/footer.jsp' %>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/echarts.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/myScript.js"></script>
</body>
<script type="text/javascript">
function postlist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listLinks',
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
				$('#j_links').empty();
				var links = '<thead><tr>'
                    +'<th class="table-id">序号</th>'
                    +'<th class="table-title">站名</th>'
                    +'<th class="table-author am-hide-sm-only">网址</th>'
                    +'<th class="table-set">操作</th>'
                    +'</tr></thead>'
				//内容
				$(data.list).each(function(index,item){
					var num = index+1;
					links +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="'+item.liUrl+'">'
                    +item.liName+'</a></td>'
                    +'<td class="am-hide-sm-only">'+item.liUrl+'</td>'
					+'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">';
                    
					var role = "${user.role}";
					if(role==0){//修改、删除权限
						links += '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#addlink" '
                            +'onclick="putlinkid('+item.liId+')"> 编辑</button>'
                            +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                            +'onclick="deletelink('+item.liId+')"> 删除</button>';
					}
					links += '</div></div></td></tr></tbody>';
				});
				$('#j_links').append(links);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}

function putlinkid(linkid) {
	if(linkid==0){
		$('#linkid').val('');
	}else{
		$('#linkid').val(linkid);
	}
}
function addlink() {
	var linkname = $('#addlinkname').val();
	var linkurl = $('#addlinkurl').val();
	var liurl = encodeURIComponent(linkurl);
	var linkid = $('#linkid').val();
	if(addlinkname==''||addlinkurl==''){
        alert('信息不完整');
        return false;
	}
	if(linkid==''||linkid==null){//新增
		if(confirm("是否确认新增链接？")){
			//异步请求
			$.ajax({
		        type:'post',
		        url:'${pageContext.request.contextPath}/addlink',
		        //数据格式是key/value
		        data:'linkname='+linkname+'&linkurl='+liurl,
		        success:function(data){//返回json结果
		        	if(data!=null){
		        		if(data==0){
		        			alert('操作失败');
		        		}else if(data==-1){
		        			alert('参数错误');
		        		}else if(data==-2){
		        			alert('标题已存在');
		        		}else if(data==1){
		        			alert('操作成功');
		        			document.location.reload();
		        		}
					}
		        },
		        error:function()
		        {
		            alert('请求出错');
		        }
		    }); 
		}
	}else{//编辑
		var originallinkname = $('#linkname').val();
	    var originallinkurl = $('#linkurl').val();
	    if(originallinkname==linkname && linkurl==originallinkurl){
	        alert('信息未更改');
	        return false;
	    }
		if(confirm("是否确认修改链接？")){
			//异步请求
			$.ajax({
		        type:'post',
		        url:'${pageContext.request.contextPath}/addlink',
		        //数据格式是key/value
		        data:'linkid='+linkid+'&linkname='+linkname+'&linkurl='+liurl,
		        success:function(data){//返回json结果
		        	if(data!=null){
		        		if(data==0){
		        			alert('操作失败');
		        		}else if(data==-1){
		        			alert('参数错误');
		        		}else if(data==-2){
		        			alert('标题已存在');
		        		}else{
		        			alert('操作成功');
		        			document.location.reload();
		        		}
					}
		        },
		        error:function()
		        {
		            alert('请求出错');
		        }
		    }); 
		}
	}
}
//删除公告
function deletelink(linkid) {
	if(confirm("是否确认删除公告？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/deletelink',
	        //数据格式是key/value
	        data:'linkid='+linkid,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		if(data==0){
	        			alert('操作失败');
	        		}else if(data==-1){
	        			alert('参数错误');
	        		}else if(data==1){
	        			alert('操作成功');
	        			document.location.reload();
	        		}
				}
	        },
	        error:function()
	        {
	            alert('请求出错');
	        }
	    }); 
	}
}

$(function(){
	//功能列表
	$('#j_linksmenu').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_linksmenu').addClass("nav-link active");
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	//公告栏
	postlist(1);
	
	//新增按钮
	var role = "${user.role}";
	if(role==0){
		//新增按钮
		var menu = '<div class="am-u-sm-12 am-u-md-6"><div class="am-btn-toolbar">'
			+'<div class="am-btn-group am-btn-group-xs">'
			+'<button type="button" class="am-btn am-btn-default am-btn-success" '
			+'data-toggle="modal" data-target="#addlink" onclick="putlinkid(0)">'
			+'<span class="am-icon-plus"></span>新增</button></div></div></div>';
			
		$('#addbutton').empty();
		$('#addbutton').append(menu);
	}
	
	$('#addlink').on('show.bs.modal', function () {
		var linkid = $('#linkid').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/linkinfo',
	        //数据格式是key/value
	        data:'linkid='+linkid,
	        success:function(data){
				if(data!=null&&data!=''){
					$('#addlinkname').val(data.liName);
					$('#linkname').val(data.liName);
					$('#addlinkurl').val(data.liUrl);
					$('#linkurl').val(data.liUrl);
				}else{
					$('#addlinkname').val('');
					$('#linkname').val('');
					$('#addlinkurl').val('');
					$('#linkurl').val('');
				}
			}
		});
	})
});
</script>
</html>