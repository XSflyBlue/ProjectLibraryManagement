<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> 公告管理-大学生创新创业训练项目库管理系统</title>
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
    <link rel="stylesheet" href="kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="kindeditor/plugins/code/prettify.css"/>

</head>

<body data-type="index">
    <%@include file='../common/header-login.jsp' %>
    <div class="tpl-page-container">
    <%@include file='../manager/indexmenu.jsp' %>

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
                <div class="am-g" id="addbutton">
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
            </div>
        </div>
    </div>
    
    <!-- 公告详情（Modal） -->
	<div class="modal fade" id="postdetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">公告详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12">
						<input type="hidden" id="piId" name="piId" value="">
							<form class="am-form" id="postcontent">
							</form>
						<hr>
						</div>
					</div>
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
	
	<!-- 新增公告（Modal） -->
	<div class="modal fade" id="addpost" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增公告</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
				<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>公告标题</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="addpostname" class="form-control" size="30"><input type="hidden" id="postname"></td>
								</tr>
							</tbody>
						</table>
						
						<div>
							<h4>
								公告正文：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpostcontent"></textarea>
							<input type="hidden" id="postcontent">
							<input type="hidden" id="addpostid" name="addpostid" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addpost()">提交</button>
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
    <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
</body>
<script type="text/javascript">
function addpost() {
	var postname = $('#addpostname').val();
	var postcontent = $('#addpostcontent').val();
	var content = encodeURIComponent(postcontent);
	var postid = $('#addpostid').val();
	if(addpostname==''||addpostcontent==''){
        alert('信息不完整');
        return false;
	}
	if(postid==''||postid==null){//新增
		if(confirm("是否确认发布公告？")){
			//异步请求
			$.ajax({
		        type:'post',
		        url:'${pageContext.request.contextPath}/addpost',
		        //数据格式是key/value
		        data:'postname='+postname+'&postcontent='+content,
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
		var originalpostcontent = $('#postcontent').val();
	    var originalpostname = $('#postname').val();
	    if(originalpostcontent==postcontent && postname==originalpostname){
	        alert('信息未更改');
	        return false;
	    }
		if(confirm("是否确认修改公告？")){
			//异步请求
			$.ajax({
		        type:'post',
		        url:'${pageContext.request.contextPath}/addpost',
		        //数据格式是key/value
		        data:'postid='+postid+'&postname='+postname+'&postcontent='+content,
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
function deletepost(postid) {
	if(confirm("是否确认删除公告？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/deletepost',
	        //数据格式是key/value
	        data:'postid='+postid,
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
                    +'<th class="table-set">操作</th>'
                    +'</tr></thead>'
				//内容
				$(data.list).each(function(index,item){
					var num = index+1;
					posts +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#postdetail" data-toggle="modal" onclick="putpostid('+item.piId+')">'
                    +item.piTitle+'</a></td>'
                    +'<td class="am-hide-sm-only">'+item.uName+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.postEditTime).format('YYYY-MM-DD HH:mm:ss')+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" data-target="#postdetail" onclick="putpostid('+item.piId+')">详情</button>';
                    
					var role = "${user.role}";
					if(role==1){//教务管理员有修改、删除权限
						posts += '<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#addpost" '
                            +'onclick="putpostid('+item.piId+')"> 编辑</button>'
                            +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                            +'onclick="deletepost('+item.piId+')"> 删除</button>';
					}
					posts += '</div></div></td></td></tr></tbody>';
				});
				$('#j_posts').append(posts);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function putpostid(piId) {
	if(piId==0){
		$('#piId').val('');
	}else{
		$('#piId').val(piId);
	}
}
$(function(){
	//功能列表
	$('#j_menu2').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu2').addClass("nav-link active");
	$('#j_postmenu').addClass("active");
	$('#j_submenu2').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	//公告栏
	postlist(1);
	//编辑器
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('#addpostcontent', {
			cssPath : "kindeditor/plugins/code/prettify.css",
			uploadJson : "kindeditor/jsp/upload_json.jsp",
			fileManagerJson : "kindeditor/jsp/file_manager_json.jsp",
			allowFileManager : true,
			resizeType:0,
			width:"100%",height:"200px",
			afterCreate : function() { 
		         this.sync(); 
	        }, 
	        afterBlur:function(){ 
	            this.sync(); 
	        }            
		});
		prettyPrint();
	});
	//公告编辑框
	$('#addpost').on('show.bs.modal', function () {
		var piId = $('#piId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/postinfo',
	        //数据格式是key/value
	        data:'piId='+piId,
	        success:function(data){
				if(data!=null&&data!=''){
					$('#addpostid').val(piId);
					$('#addpostname').val(data.piTitle);
					$('#postname').val(data.piTitle);
					$('#postcontent').val(data.piContent);
					editor.html(data.piContent);
				}else{
					$('#addpostid').val('');
					$('#addpostname').val('');
					editor.html('');
				}
			}
		});
	})
	//新增按钮
	var role = "${user.role}";
	if(role==1){
		//新增按钮
		var menu = '<div class="am-u-sm-12 am-u-md-6"><div class="am-btn-toolbar">'
			+'<div class="am-btn-group am-btn-group-xs">'
			+'<button type="button" class="am-btn am-btn-default am-btn-success" '
			+'data-toggle="modal" data-target="#addpost" onclick="putpostid(0)">'
			+'<span class="am-icon-plus"></span>新增</button></div></div></div>';
			
		$('#addbutton').empty();
		$('#addbutton').append(menu);
	}
	
	$('#postdetail').on('show.bs.modal', function () {
		var piId = $('#piId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/postinfo',
	        //数据格式是key/value
	        data:'piId='+piId,
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
					$('#postcontent').empty();
					$('#postcontent').append(postinfo);
				}
			}
		});
	})
});
</script>
</html>