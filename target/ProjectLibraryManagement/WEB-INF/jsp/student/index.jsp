<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
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
</head>

<body data-type="index">

    <%@include file='../common/header-login.jsp' %>
    
    <div class="tpl-page-container">
    
    <%@include file='../student/indexmenu.jsp' %>

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
                                <button type="button" class="am-btn am-btn-default am-btn-success" data-toggle="modal" data-target="#edituserinfo">
                                     个人资料
                                </button>
                                <button type="button" onclick="reset()" class="am-btn am-btn-default am-btn-secondary">
                                     重置密码
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="am-g">
                    <div class="am-u-sm-12">
                    <input type="hidden" id="recentprojectid" name="recentprojectid" value="">
                        <form class="am-form">
                            <!-- 最近项目信息 -->
                            <div id="j_recentproject">
                            </div>
                             
                            <!-- 成员分组信息 -->
                            
                            <div id="j_member">
                            </div>
                            
                            <hr>
                        </form>
                    </div>
                </div>
                
                <!--大边距-->
                <div class="tpl-alert"></div>
            </div>
        </div>
    </div>
	<!-- 项目详情（Modal） -->
	<div class="modal fade" id="projectdetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="posturl" name="posturl" value="${pageContext.request.contextPath}">
					<input type="hidden" id="postid" name="postid" value="">
					<div id="j_projectinfo" class="form-group">
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
	
    <!-- 项目安排（Modal） -->
	<div class="modal fade" id="projectplan" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目安排</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="projectplanurl" name="projectplanurl" value="${pageContext.request.contextPath}" >
					<input type="hidden" id="projectplanid" name="projectplanid" value="">
					<div id="j_projectplan" class="form-group">
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
function member() {
	var pId = $('#recentprojectid').val();
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/listprojectuserno',
        //数据格式是key/value
        data:'projectid='+pId,
        success:function(data){//返回json结果
        	if(data!=null){
        		var projectuser='';
        		var teacher='';//导师信息
        		var leader='';//负责人信息
        		var student='';//其他学生信息

        		projectuser = '';
        		for(var i=0;i<data.length;i++){
        			if(data[i].uType==0){
        				leader = '<div class="caption font-green bold"><span class="am-icon-code"></span> 成员信息</div>'
        					+'<table class="table table-bordered"><thead><tr>'
        					+'<th>学生姓名</th><th>学院</th><th>学号</th><th>联系电话</th><th>E-mail</th></tr></thead><tbody>'
        					+'<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr>';
        			}else if(data[i].uType==1){
        				student+='<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr>';
        			}else if(data[i].uType==2){
        				teacher='<div class="caption font-green bold"><span class="am-icon-code"></span> 导师信息</div>'
        					+'<table class="table table-bordered"><thead><tr>'
        					+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th></tr></thead><tbody><tr>'
        					+'<td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].jobTitle+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td></tr></tbody></table>';
        			}
        		}
        		student +='</tbody></table>';
        		projectuser += leader+student+teacher;
        		$('#j_member').empty();
        		$('#j_member').append(projectuser);
			}
        }
    }); 
}

$(function(){
	$('#j_center').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_center').addClass("nav-link active");
	
	//初始化最近项目
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/recentproject',
        //数据格式是key/value
        data:type=1,
        success:function(data){//返回json结果
        	if(data!=null){
        		$('#recentprojectid').val(data.pbId);
        		$('#projectplanid').val(data.pbId);

                //项目状态
                var pbstatus='';
                if(data.pbStatus==null){
                	pbstatus='无';
                }else{
                	if(data.pbStatus==0){
                    	pbstatus='已结题';
                    }else if(data.pbStatus==1){
                    	pbstatus='立项中';
                    }else if(data.pbStatus==2){
                    	pbstatus='中期检查中';
                    }else if(data.pbStatus==3){
                    	pbstatus='结题验收中';
                    }else if(data.pbStatus==4){
                    	pbstatus='其他情况';
                    }else if(data.pbStatus==5){
                    	pbstatus='优秀项目';
                    }
                }
                
                //项目立项状态
                var psstatus='';
                if(data.psiOStatus==null||data.psiOStatus==''){
                	psstatus='暂无';
                }else{
                	if(data.psiOStatus==11){
                    	psstatus='待导师审核';
                    }else if(data.psiOStatus==12){
                    	psstatus='导师审核不通过';
                    }else if(data.psiOStatus==13){
                    	psstatus='待院系审核';
                    }else if(data.psiOStatus==14){
                    	psstatus='院系审核不通过';
                    }else if(data.psiOStatus==15){
                    	psstatus='待教务审核';
                    }else if(data.psiOStatus==16){
                    	psstatus='教务审核不通过';
                    }else if(data.psiOStatus==17){
                    	psstatus='待专家审核';
                    }else if(data.psiOStatus==17){
                    	psstatus='专家审核不通过';
                    }else if(data.psiOStatus==17){
                    	psstatus='立项成功';
                    }else{
                    	psstatus='暂无';
                    }
                }
                
                //项目中期状态
                var pmstatus='';
                if(data.pmiOStatus==null||data.pmiOStatus==''){
                	pmstatus='暂无';
                }else{
                	if(data.pmiOStatus==21){
                    	pmstatus='待导师审核';
                    }else if(data.pmiOStatus==22){
                    	pmstatus='导师审核不通过';
                    }else if(data.pmiOStatus==23){
                    	pmstatus='待院系审核';
                    }else if(data.pmiOStatus==24){
                    	pmstatus='院系审核不通过';
                    }else if(data.pmiOStatus==25){
                    	pmstatus='待教务审核';
                    }else if(data.pmiOStatus==26){
                    	pmstatus='教务审核不通过';
                    }else if(data.pmiOStatus==27){
                    	pmstatus='待专家审核';
                    }else if(data.pmiOStatus==28){
                    	pmstatus='专家审核不通过';
                    }else if(data.pmiOStatus==29){
                    	pmstatus='中期合格';
                    }else{
                    	pmstatus='暂无';
                    }
                }
                
                //项目验收状态
                var pestatus='';
                if(data.peiOStatus==null||data.peiOStatus==''){
                	pestatus='暂无';
                }else{
                	if(data.peiOStatus==31){
                    	pestatus='待导师审核';
                    }else if(data.peiOStatus==32){
                    	pestatus='导师审核不通过';
                    }else if(data.peiOStatus==33){
                    	pestatus='待院系审核';
                    }else if(data.peiOStatus==34){
                    	pestatus='院系审核不通过';
                    }else if(data.peiOStatus==35){
                    	pestatus='待教务审核';
                    }else if(data.peiOStatus==36){
                    	pestatus='教务审核不通过';
                    }else if(data.peiOStatus==37){
                    	pestatus='待专家审核';
                    }else if(data.peiOStatus==38){
                    	pestatus='专家审核不通过';
                    }else if(data.peiOStatus==39){
                    	pestatus='验收成功';
                    }else{
                    	pestatus='暂无';
                    }
                }
                
        		var projectdetail = '<div class="caption font-green bold"><span class="am-icon-code"></span> 最近项目</div>'
        		+'<table class="table table-bordered"><thead><tr>'
        		+'<th>项目名称</th><th>项目安排</th></tr></thead><tbody><tr>'
        		+'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+data.pbId+')">'+data.pbName+'</a></td>'
        		+'<td><a href="#projectplan" data-toggle="modal" onclick="ppId('+data.ppId+')">点击查看</a></td></tr></tbody></table>'
        		+'<div class="row"><div class="am-u-lg-3 am-u-md-6 am-u-sm-12">'
        		+'<div class="dashboard-stat blue"><div class="visual"></div>'
        		+'<div class="details"><div class="number"> '+pbstatus+' </div>'
        		+'<div class="desc"> 项目总体状态 </div></div></div></div>'
        		+'<div class="am-u-lg-3 am-u-md-6 am-u-sm-12">'
        		+'<div class="dashboard-stat red"><div class="visual"></div>'
        		+'<div class="details"><div class="number"> '+psstatus+' </div>'
        		+'<div class="desc"> 项目立项状态 </div></div></div></div>'
        		+'<div class="am-u-lg-3 am-u-md-6 am-u-sm-12">'
        		+'<div class="dashboard-stat green"><div class="visual"></div>'
        		+'<div class="details"><div class="number"> '+pmstatus+' </div>'
        		+'<div class="desc"> 项目中期状态 </div></div></div></div>'
        		+'<div class="am-u-lg-3 am-u-md-6 am-u-sm-12">'
        		+'<div class="dashboard-stat purple"><div class="visual"></div>'
        		+'<div class="details"><div class="number"> '+pestatus+' </div>'
        		+'<div class="desc"> 项目验收状态 </div></div></div></div></div>';

        		$('#j_recentproject').empty();
        		$('#j_recentproject').append(projectdetail);
			}
        },
        complete:function(){
        	//初始化成员信息
        	member();
        }
    }); 

});
</script>
</html>