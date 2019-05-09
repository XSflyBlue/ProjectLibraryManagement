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
    
    <%@include file='../tutor/indexmenu.jsp' %>
        
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
                            <div class="caption font-green bold">
                                <span class="am-icon-code"></span> 最近项目
                            </div>
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
		<!-- 个人资料（Modal） -->
	<div class="modal fade" id="edituserinfo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">个人资料</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<div class="form-group">
						<div class="col-md-6">
							<label for="uName" class="control-label">用户名</label> <input
								type="text" class="form-control" id="uName" name="uName"
								placeholder="" value="">
						</div>
						<div class="col-md-6">
							<label for="uRealname" class="control-label">真实姓名</label> <input
								type="text" class="form-control" id="uRealname" name="uRealname"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="email" class="control-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="">
						</div>
						<div class="col-md-6">
							<label for="sex" class="control-label">性别</label> <input
								type="text" class="form-control" id="sex" name="sex"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="uCode" class="control-label">工号</label> <input
								type="text" class="form-control" id="uCode" name="uCode"
								value="">
						</div>
					</div>
					<div class="form-group">
			          <div class="col-md-6">
			          <c:if test="${user!=null&&user.role==5}">
			            <label for="note" class="control-label">入校时间</label>
			            <input type="text" class="form-control" id="note" name="note" placeholder="格式：2018-09-01">
			           </c:if>
			           <c:if test="${user!=null&&user.role==4||user.role==3}">
			            <label for="note" class="control-label">职称</label>
			            <input type="text" class="form-control" id="note" name="note" placeholder="">
			           </c:if>
			          </div>
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="tel" name="tel" placeholder="">
			          </div>
			        </div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="college"  name="college" placeholder="">
			          </div>
			          <div class="col-md-6">
			            <label for="major" class="control-label">专业</label>
			            <input type="text" class="form-control" id="major" name="major" placeholder="">
			          </div>
			        </div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="edituserinfo()">修改</button>
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
				+'<th class="table-date am-hide-sm-only">创建时间</th>'
                +'<th class="table-date am-hide-sm-only">修改时间</th>'
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
                    +'<td class="am-hide-sm-only">'+moment(item.pbCreateTime).format('YYYY-MM-DD HH:mm:ss')+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.pbEditTime).format('YYYY-MM-DD HH:mm:ss')+'</td>'            
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
					+'<th class="table-date am-hide-sm-only">创建时间</th>'
	                +'<th class="table-date am-hide-sm-only">修改时间</th>'
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
$(function(){
	$('#j_center').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_center').addClass("nav-link active");
	//初始化列表
	projectList(1);
});
</script>
</html>