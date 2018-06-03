<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>资料下载-大学生创新创业训练项目库管理系统</title>
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
                资料下载
            </div>
            <ol class="am-breadcrumb">
                <li class="am-active">资料文件列表</li>
            </ol>
        </div>

        <div class="tpl-content-wrapper">

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 资料文件列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="j_file" class="am-table am-table-striped am-table-hover table-main">
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
    
    <!-- 文件详情（Modal） -->
	<div class="modal fade" id="filedetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">帮助详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
				    <input type="hidden" id="fileid" name="fileid" value="">
					<div id="j_filedetail" class="form-group">
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
        url:'${pageContext.request.contextPath}/listfile',
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
				$('#j_file').empty();
				var links = '<thead><tr>'
                    +'<th class="table-id">序号</th>'
                    +'<th class="table-title">文件名</th>'
                    +'<th class="table-title">上传时间</th>'
                    +'<th class="table-title">文件类型</th>'
                    +'<th class="table-author am-hide-sm-only">文件大小</th>'
                    +'<th class="table-set">操作</th>'
                    +'</tr></thead>';
				//内容
				$(data.list).each(function(index,item){
					//类型
					var type = '';
					if(item.sfType==0){
						type = 'doc或docx';
					}else if(item.sfType==1){
						type = 'xls或xlsx';
					}else if(item.sfType==2){
						type = 'pdf';
					}else if(item.sfType==3){
						type = 'zip';
					}
					//
					var obj = item.sfName;
					var num = obj.lastIndexOf("\_");
					obj = obj.substring(num+1,obj.length);
				    
					//序号
					var num = index+1;
					links +='<tbody><tr><td>'+num+'</td>'
                    +'<td>'+obj+'</a></td>'
                    +'<td class="am-hide-sm-only">'+moment(item.upTime).format('YYYY-MM-DD')+'</td>'
                    +'<td>'+type+'</a></td>'
                    +'<td>'+item.sfSize+'KB</a></td>'
					+'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" '
                    +'data-toggle="modal" data-target="#filedetail" onclick="putfileid('+item.sfId+')"> 详情</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" '
                    +' onclick="downfile('+item.sfId+')"> 下载</button><input type="hidden" id="s'+item.sfId+'" value="'+item.sfName+'">';

                    links += '</div></div></td></tr></tbody>';
				});
				$('#j_file').append(links);
			}else{
				$('#j_file').empty();
				var links = '<thead><tr>'
                    +'<th class="table-id">序号</th>'
                    +'<th class="table-title">文件名</th>'
                    +'<th class="table-title">上传时间</th>'
                    +'<th class="table-title">文件类型</th>'
                    +'<th class="table-author am-hide-sm-only">文件大小</th>'
                    +'<th class="table-set">操作</th>'
                    +'</tr></thead>';
				$('#j_file').append(links);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function downfile(sfId){
	var sfName = $('#s'+sfId).val();
	if(sfName==''){
        alert("错误");  
        return false  
	}
	window.location.href = '${pageContext.request.contextPath}/download?filename='+sfName;
}

function putfileid(fileid){
	$('#fileid').val(fileid);
}

$(function(){
	$('#j_filebutton').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_filebutton').addClass("nav-link active");
	//文件列表
	postlist(1);
	
	$('#filedetail').on('show.bs.modal', function () {
		var fileid = $('#fileid').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/fileinfo',
	        //数据格式是key/value
	        data:'fileid='+fileid,
	        success:function(data){
				if(data!=null&&data!=''){
					//类型
					var type = '';
					if(data.sfType==0){
						type = 'doc或docx';
					}else if(data.sfType==1){
						type = 'xls或xlsx';
					}else if(data.sfType==2){
						type = 'pdf';
					}else if(data.sfType==3){
						type = 'zip';
					}
					//
					var obj = data.sfName;
					var num = obj.lastIndexOf("\_");
					obj = obj.substring(num+1,obj.length);
	        		var detail = '<table class="table table-bordered"><thead><tr>'
	        			+'<th>点击下载</th></tr></thead><tbody><tr>'
	        			+'<td><button type="button" class="btn btn-default form-control" '
	                    +' onclick="downfile('+data.sfId+')"> 下载</button></td>'
	        			+'</tr></tbody></table>'
	        			+'<h4>文件名：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+obj+'</p></div>'
		        		+'<h4>文件类型：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+type+'</p></div>'
		        		+'<h4>上传时间：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+moment(data.upTime).format('YYYY-MM-DD')+'</p></div>'
		        		+'<h4>文件大小：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+data.sfSize+'KB</p></div>'
		        		+'<h4>文件简介：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+data.sfBrief+'</p></div>';
	        		$('#j_filedetail').empty();
	        		$('#j_filedetail').append(detail);
				}
			}
		});
	})
});
</script>
</html>