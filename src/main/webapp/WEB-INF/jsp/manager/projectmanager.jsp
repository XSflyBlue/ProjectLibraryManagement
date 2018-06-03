<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目管理-大学生创新创业训练项目库管理系统</title>
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

    <%@include file='../manager/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                项目管理
            </div>
            <ol class="am-breadcrumb">
                <li>项目管理列表</li>
                <li class="am-active">内容</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目管理列表
                    </div>
                </div>
                <div class="am-g">
                    <div class="am-u-sm-12">
                    <input type="hidden" id="recentprojectid" name="recentprojectid" value="">
                        <form class="am-form">
                            <!-- 项目信息 -->
                            <table id="j_projectlist" class="table table-bordered">
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
	
	<!-- 成员管理（Modal） -->
	<div class="modal fade" id="editprojectuser" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目成员管理</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>项目名称</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="projectuserPbname"></td>
							</tr>
						</tbody>
					</table>

					<h4>
						评审信息<span class="close" data-close="note"></span>
					</h4>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<input type="button" id="addteacherbutton" class="am-btn am-btn-default am-btn-success"
								value="添加" onclick="addteacher()">
							<div class="col-md-6">
								<div class="control-wrapper">
									<input type="text" class="form-control" id="ucode2"
										placeholder="请输入评审专家编号">
								</div>
							</div>
						</div>
					</form>

					<div id="projectuserTeacher"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
    <!-- 成员信息（Modal） -->
	<div class="modal fade" id="projectuser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="projectuserurl" name="projectuserurl" value="${pageContext.request.contextPath}" >
					<input type="hidden" id="projectuserid" name="projectuserid" value="">
					<div id="j_projectuser" class="form-group">
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
function projectList(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/listuserproject',
        //数据格式是key/value
        data:'page='+page+'&pageSize=5',
        success:function(data){//返回json结果
        	if(data!=null&&data!=''){
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
				$('#j_projectlist').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">编号</th>'
				+'<th class="table-title">项目名称</th>'
				+'<th class="table-type">项目级别</th>'
				+'<th class="table-type">项目类型</th>'
				+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
                +'<th class="table-set">操作</th>'
                +'<th class="table-set">项目状态</th></tr></thead>';
				//内容
				$(data.list).each(function(index,item){
					//序号
					var num = index+1;
                    //项目级别
                    var level='';
                    if(item.pbLevel=='0'){
                    	level='国家级';
                    }else if(item.pbLevel=='1'){
                    	level='省部级';
                    }else if(item.pbLevel=='2'){
                    	level='校级';
                    }
                    //项目类型
                    var type='';
                    if(item.pbType=='0'){
                    	type='大学生创新创业训练';
                    }else if(item.pbType=='1'){
                    	type='大学生科研训练计划';
                    }
                    //项目状态
                    var pbstatus='';
                    if(item.pbStatus==null){
                    	pbstatus='无';
                    }else{
                    	if(item.pbStatus==0){
                        	pbstatus='已结题';
                        }else if(item.pbStatus==1){
                        	pbstatus='立项中';
                        }else if(item.pbStatus==2){
                        	pbstatus='中期检查中';
                        }else if(item.pbStatus==3){
                        	pbstatus='结题验收中';
                        }else if(item.pbStatus==4){
                        	pbstatus='其他情况';
                        }else if(item.pbStatus==5){
                        	pbstatus='优秀项目';
                        }
                    }
                    
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td>'+level+'</td><td>'+type+'</td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">';
                	project +='<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" data-target="#projectdetail"'
                        +' onclick="pId('+item.pbId+')">详情</button>';
                    
                    //切换状态
                    if(item.pbStatus==0||item.pbStatus==5||(item.pbStatus==4&&item.poiOStatus==49)){
                        //管理员权限
                        project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#newfund" '
                            +'onclick="changestatus('+item.pbId+','+item.pbStatus+')"> 切换状态</button>';
                    }
                    //专家指定
                    if(item.pbStatus==1&&(item.psiOStatus==''||item.psiOStatus<=11)){
                    	project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#editprojectuser" '
                            +'onclick="puid('+item.pbId+')"> 评审指定</button>';
                    }
                    
                    project += '</div></div></td>'
                    +'<td class="am-hide-sm-only">'+pbstatus+'</td>'
                    +'</tr></tbody>'
				});
				$('#j_projectlist').append(project);
			}else{
				$('#j_projectlist').empty();
				var project = '<thead><tr>'
					+'<th class="table-id">编号</th>'
					+'<th class="table-title">项目名称</th>'
					+'<th class="table-type">项目级别</th>'
					+'<th class="table-type">项目类型</th>'
					+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
	                +'<th class="table-set">操作</th>'
	                +'<th class="table-set">项目验收状态</th></tr></thead>';
				$('#j_projectlist').append(project);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function changestatus(pbId,pstatus){
	if(pstatus==null||pbId==null||(pstatus!=0&&pstatus!=5&&pstatus!=4))
    {
        alert('非法操作');
        return false;
    }
	if(pstatus==0){
		pstatus=5;
	}else if(pstatus==5){
		pstatus=0
	}
    //异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/changestatus',
        //数据格式是key/value
        data:'projectId='+pbId+'&pstatus='+pstatus,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		return true;
        		}else{
        			alert('操作失败');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        },
        complete:function()
        {
            document.location.reload();
        }
    }); 
}
//添加评审
function addteacher(){
	var pId = $('#projectuserid').val();
	var ucode = $('#ucode2').val();
	var ppid = $('#projectuserPpid').val();
	if(ucode==''){
        alert('请输入教师号');
        return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addteacher',
        //数据格式是key/value
        data:'ucode='+ucode+'&ppid='+ppid+'&pId='+pId+'&type=1',
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		return true;
        		}else if(data==0){
        			alert('操作失败');
        		}else if(data==-1){
        			alert('用户不存在');
        		}else if(data==-8){
        			alert('非专家');
        		}else if(data==-2){
        			alert('项目安排不存在');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        },
        complete:function()
        {
        	projectuser();
        }
    });
}
//删除成员
function deleteprojectuser(puId) {
	if(puId=='')
    {
        alert('错误');
        return false;
    }
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/deleteprojectuser',
        //数据格式是key/value
        data:'puId='+puId,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		return true;
        		}else{
        			alert('操作失败');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        },
        complete:function()
        {
        	projectuser();
        }
    });
}

//删除导师
function deleteteacher(puId) {
	deleteprojectuser(puId);
	$("#addteacherbutton").attr('disabled',false); 
}

//获取成员管理页面信息
function projectuser() {
	var pId = $('#projectuserid').val();
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
                //项目名
                $('#projectuserPbname').html(data[0].pbName);
                $('#projectuserPpid').val(data[0].ppId);
        		
        		for(var i=0;i<data.length;i++){
        			if(data[i].uType==3){
        				teacher ='<table class="table table-bordered"><thead><tr>'
        					+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th><th>操作</th></tr></thead><tbody><tr>'
        					+'<td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].jobTitle+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td><td>'
        					+'<a onclick="deleteteacher('+data[i].puId+')">删除</a></td></tr></tbody></table>';
        			}
        		}
        		if(teacher==''){
        			teacher = '<table class="table table-bordered"><thead><tr>'
        			+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th></tr></thead></table>';
        		}else{
        			$("#addteacherbutton").attr('disabled',true); 
        		}
        		$('#projectuserTeacher').empty();
        		$('#projectuserTeacher').append(teacher);
			}
        }
    }); 
}

$(function(){
	$('#j_menu2').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu2').addClass("nav-link active");
	$('#j_projectmenu').addClass("active");
	$('#j_submenu2').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	
	//初始化列表
	projectList(1);
	
	//项目成员管理列表
	$('#editprojectuser').on('show.bs.modal', function () {
		projectuser();
	})
});
</script>
</html>