<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页-大学生创新创业训练项目库管理系统</title>
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
                首页
            </div>
            <ol class="am-breadcrumb">
                <li><a href="${pageContext.request.contextPath}/" class="am-icon-home">首页</a></li>
                <li class="am-active">内容</li>
            </ol>
            <div class="tpl-content-scope">
                <div class="note note-info">
                    <h3>大学生创新创业训练项目库管理系统
                        <span class="close" data-close="note"></span>
                    </h3>
                    <p></p>
                    <p><span class="label label-danger">提示:</span>右上角“管理中心”进行登陆</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>公告</span>
                        </div>
                        <div class="actions">
                            <ul class="actions-btn">
                                <li class="green"><a href="${pageContext.request.contextPath}/postlist">
                                    <span>更多</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="am-tabs tpl-index-tabs" data-am-tabs>
                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                <div id="wrapperA" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul id="j_posts" class="tpl-task-list tpl-task-remind">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>优秀项目</span>
                        </div>
                        <div class="actions">
                            <ul class="actions-btn">
                                <li class="green"><a href="${pageContext.request.contextPath}/excellentProjectlist">
                                    <span>更多</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="am-tabs tpl-index-tabs" data-am-tabs>
                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                <div id="wrapperA" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul id="j_excellentProject" class="tpl-task-list tpl-task-remind">
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>资料下载</span>
                        </div>
                        <div class="actions">
                            <ul class="actions-btn">
                                <li class="green"><a href="${pageContext.request.contextPath}/filelist">
                                    <span>更多</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="am-tabs tpl-index-tabs" data-am-tabs>
                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                <div id="wrapperA" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul id="j_file" class="tpl-task-list tpl-task-remind">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>友情链接</span>
                        </div>
                        <div class="actions">
                            <ul class="actions-btn">
                                <li class="green"><a href="${pageContext.request.contextPath}/linklist">
                                    <span>更多</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="am-tabs tpl-index-tabs" data-am-tabs>
                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                <div id="wrapperA" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul id="j_links" class="tpl-task-list tpl-task-remind">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
function downfile(sfId){
	var sfName = $('#s'+sfId).val();
	if(sfName==''){
        alert("错误");  
        return false  
	}
	window.location.href = '${pageContext.request.contextPath}/download?filename='+sfName;
}
$(function(){
	$('#j_indexbutton').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_indexbutton').addClass("nav-link active");
	//公告栏
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listPost',
        //数据格式是key/value
        data:'page=1&pageSize=7',
        success:function(data){//返回json结果
        	if(data!=null){
				$(data.list).each(function(index,item){
					var links = '<li><div class="cosB">'
					+moment(item.postEditTime).format('YYYY-MM-DD')+'</div>'
					+'<div class="cosA">'
					+'<span class="cosIco"><i class="fa fa-bullhorn" aria-hidden="true"></i></span>'
					+'<span> <a href="${pageContext.request.contextPath}/postdetail?piId='+item.piId+'">'
					+item.piTitle+'</a>'
					+'</span></div></li>';
					$('#j_posts').append(links);
				});
			}
        }
    }); 
	
	//优秀项目
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listexcellentProject',
        //数据格式是key/value
        data:'page=1&pageSize=7',
        success:function(data){//返回json结果
        	if(data!=null){
				$(data.list).each(function(index,item){
					var links = '<li><div class="cosB">'
					+moment(item.pbCreateTime).format('YYYY-MM-DD')+'</div>'
					+'<div class="cosA">'
					+'<span class="cosIco"><i class="fa fa-file-text" aria-hidden="true"></i></span>'
					+'<span>'
					+item.pbName
					+'</span></div></li>';
					$('#j_excellentProject').append(links);
				});
			}
        }
    }); 
	//资料下载
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listfile',
        //数据格式是key/value
        data:'page=1&pageSize=7',
        success:function(data){//返回json结果
        	if(data!=null){
				$(data.list).each(function(index,item){
					//文件名
					var obj = item.sfName;
					var num = obj.lastIndexOf("\_");
					obj = obj.substring(num+1,obj.length);
					
					var links = '<li><div class="cosB">'+moment(item.upTime).format('YYYY-MM-DD')+'</div>'
					+'<div class="cosA">'
					+'<span class="cosIco label-danger"><i class="fa fa-download" aria-hidden="true"></i></span>'
					+'<span> <a href="#" onclick="downfile('+item.sfId+')">'
					+obj+'</a><input type="hidden" id="s'+item.sfId+'" value="'+item.sfName+'">'
					+'</span></div></li>';
					$('#j_file').append(links);
				});
			}
        }
    }); 
	//友情链接
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listLinks',
        //数据格式是key/value
        data:'page=1&pageSize=7',
        success:function(data){//返回json结果
        	if(data!=null){
				$(data.list).each(function(index,item){
					var links = '<li><div class="cosB">'+item.liId+'</div>'
					+'<div class="cosA">'
					+'<span class="cosIco label-danger"><i class="fa fa-chain" aria-hidden="true"></i></span>'
					+'<span> <a href="'+item.liUrl+'">'
					+item.liName+'</a>'
					+'</span></div></li>';
					$('#j_links').append(links);
				});
			}
        }
    }); 
});
</script>
</html>