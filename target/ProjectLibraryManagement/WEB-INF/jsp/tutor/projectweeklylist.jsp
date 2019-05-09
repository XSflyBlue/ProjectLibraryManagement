<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>周报审核-大学生创新创业训练项目库管理系统</title>
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
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body data-type="index">

    <%@include file='../common/header-login.jsp' %>
    
    <div class="tpl-page-container">
    
    <%@include file='../tutor/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                周报审核
            </div>
            <ol class="am-breadcrumb">
                <li>项目立项列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目周报列表
                    </div>
                </div>
                <div class="am-g" id="addweeklybutton">

                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="j_project" class="am-table am-table-striped am-table-hover table-main">
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
    
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">周报详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
				    <input type="hidden" id="id" name="id" value="">
					<ul id="j_detail" class="am-pagination tpl-pagination">
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
				    <input type="hidden" id="utype" name="utype" value="">
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
	
	<!-- 审核信息（添加）（Modal） -->
	<div class="modal fade" id="newweek" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">周报审核信息</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<form role="form">
						<div class="form-group">
							<h4>
								项目名：<span class="close" data-close="note"></span>
							</h4>
							<div class="note note-info" style="word-break: break-all">
								<p id="weekprojectname"></p>
							</div>
							<input type="hidden" id="weekeditwId" name="weekeditwId" value="">
							<input type="hidden" id="weekpId" name="weekpId" value="">
							<h4>审核意见：<span class="close" data-close="note"></span></h4>
							<textarea id ="wopinion" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalopinion" name="originalstatus" value="">
							<h4>审核结论：<span class="close" data-close="note"></span></h4>
							<input type="hidden" id="originalstatus" name="originalstatus" value="">
							<select id ="wstatus" class="selector">
							    <option value="-1">请选择审核结论</option>
								<option value="2">审核通过</option>
								<option value="3">审核未通过</option>
							</select>
							
						</div>
					</form>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editweekly()">提交</button>
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
    <script src="../js/jquery-ui.min.js"></script>
</body>
<script type="text/javascript">
//项目列表
function projectList(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/listuserproject',
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
				$('#j_project').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">编号</th>'
				+'<th class="table-title">项目名称</th>'
				+'<th class="table-type">项目级别</th>'
				+'<th class="table-type">项目类型</th>'
				+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
                +'<th class="table-set">操作</th>'
                +'<th class="table-set">周报总体状态</th></tr></thead>';
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
                    //项目周报状态
                    var status = '';
                    if(item.wsStatus==0){
                    	status = '全部通过';
                    }else if(item.wsStatus==1){
                    	status = '存在不通过';
                    }else if(item.wsStatus==2){
                    	status = '待添加';
                    }else{
                    	status = '全部待审核';
                    }     
                    
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td>'+level+'</td><td>'+type+'</td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<a href="#" onclick="weeklistpage('+item.pbId+','+item.uType+')">详情</a>'
                    +'</div></div></td>'
                    +'<td class="am-hide-sm-only">'+status+'</td>'
                    +'</tr></tbody>';
				});
				$('#j_project').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">编号</th>'
					+'<th class="table-title">项目名称</th>'
					+'<th class="table-type">项目级别</th>'
					+'<th class="table-type">项目类型</th>'
					+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
	                +'<th class="table-set">操作</th>'
	                +'<th class="table-set">项目状态</th></tr></thead>';
				$('#j_project').append(project);
			}
        }
    }); 
}
//项目列表翻页
function getGoalPage(page) {
	postlist(page);
}
//周报列表（分页）
function weeklist(index,id,utype){
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/listweekly',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10&projectId='+id,
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="weeklist('+data.firstPage+','+id+','+utype+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="weeklist('+data.firstPage+','+id+','+utype+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="weeklist('+item+','+id+','+utype+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="weeklist('+item+','+id+','+utype+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="weeklist('+data.lastPage+','+id+','+utype+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="weeklist('+data.lastPage+','+id+','+utype+')">»</a></li>';
				}
				
				$('#j_page').empty();
				$('#j_page').append(pages);
				
				$('#j_project').empty();
				var menu ='';
				
				var project = '<thead><tr>'
				+'<th class="table-id">编号</th>'
				+'<th class="table-set">项目名字</th>'
				+'<th class="table-title">开始时间</th>'
				+'<th class="table-type">结束时间</th>'
                +'<th class="table-set">操作</th>'
                +'<th class="table-set">周报状态</th></tr></thead>';
				//内容
				$(data.list).each(function(index,item){
					$('#weekpId').val(item.pbId);//传入周报列表
					$('#weekprojectname').empty();
					$('#weekprojectname').append(item.pbName);//传入审核信息表
					//状态获取
					var status = '';
					if(item.wStatus==1){
	        			status = '待审核';
	        		}else if(item.wStatus==2){
	        			status = '审核通过';
	        		}else if(item.wStatus==3){
	        			status = '审核未通过';
	        		}
					//序号
					var num = index+1;
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td class="am-hide-sm-only">'+moment(item.wStartTime).format('YYYY-MM-DD')+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.wEndTime).format('YYYY-MM-DD')+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" data-target="#myModal" onclick="wid('+item.wId+')">详情</button>';
                    //分权限功能
                    if(utype==2){
                        project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#newweek" '
                            +'onclick="editwid('+item.wId+')"> 审核</button>'
                            +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                            +'onclick="deleteWeekly('+item.wId+')">重置审核</button>';
                    }
                    project +='</div></div></td>'
                    +'<td class="am-hide-sm-only">'+status+'</td>'
                    +'</tr></tbody>'
				});
				
				$('#j_project').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">编号</th>'
					+'<th class="table-id">项目名字</th>'
					+'<th class="table-title">开始时间</th>'
					+'<th class="table-type">结束时间</th>'
	                +'<th class="table-set">操作</th>'
	                +'<th class="table-set">周报状态</th></tr></thead>';
				
				$('#j_project').append(project);
			}
        }
    }); 
}
//周报列表翻页
function weeklistpage(id,utype) {
	$('#utype').val(utype);
	weeklist(1,id,utype);
}
//周报详情传值
function wid(id) {
	$('#id').val(id);
}
//编辑周报传值
function editwid(id) {
	$('#weekeditwId').val(id);
}
function editweekly() {
	var wid = $('#weekeditwId').val();
	var wopinion = $('#wopinion').val();
	var wstatus = $("#wstatus option:selected").val();
	var originalopinion = $("#originalopinion").val();
	var originalstatus = $("#originalstatus").val();

	if(wopinion==''||wstatus==''){
        alert('信息不完整');
        return false;
	}
	if(wstatus==-1){
        alert('请选择审核结论');
        return false;
	}
	if(wopinion==originalopinion&&wstatus==originalstatus){
        alert('信息未更改');
        return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/editweekly',
        //数据格式是key/value
        data:'weekid='+wid+'&wopinion='+wopinion+'&wstatus='+wstatus,
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
            $('#newweek').modal('hide');
            var pid = $('#weekpId').val();
            var utype = $('#utype').val();
            weeklistpage(pid,utype);
        }
    }); 
}
function deleteWeekly(wId) {
    if(wId=='')
    {
        alert('错误');
        return false;
    }

    //异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/editweekly',
        //数据格式是key/value
        data:'weekid='+wId,
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
            var utype = $('#utype').val();
            var pid = $('#weekpId').val();
            weeklistpage(pid,utype);
        }
    }); 
}
$(function(){
	$('#j_menu').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu').addClass("nav-link active");
	$('#j_week').addClass("active");
	$('#j_submenu').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");

	//初始化项目列表
	projectList(1);

	//周报详情
	$('#myModal').on('show.bs.modal', function () {
		var wId = $('#id').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/weeklydetail',
	        //数据格式是key/value
	        data:'weekId='+wId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		var status = '';
	        		var opinion = '';
	        		if(data.wStatus==0){
	        			status = '草稿';
	        		}else if(data.wStatus==1){
	        			status = '待审核';
	        		}else if(data.wStatus==2){
	        			status = '审核通过';
	        		}else if(data.wStatus==3){
	        			status = '审核未通过';
	        		}
	        		if(data.wOpinion==null||data.wOpinion=='undefined'){
	        			opinion = '暂无评论';
	        		}else{
	        			opinion = data.wOpinion;
	        		}
	        		var detail = '<h4>开始时间：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+moment(data.wStartTime).format('YYYY-MM-DD')+'</p></div>'
	        		+'<h4>结束时间：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+moment(data.wEndTime).format('YYYY-MM-DD')+'</p></div>'
	        		+'<h4>本周工作情况：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+data.wThisWeek+'</p></div>'
	        		+'<h4>下周工作计划：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+data.wNextWeek+'</p></div>'
	        		+'<h4>审核情况：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+status+'</p></div>'
	        		+'<h4>教师评语：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+opinion+'</p></div>';
	        		$('#j_detail').empty();
	        		$('#j_detail').append(detail);
				}
	        }
	    }); 
	})
	//周报编辑
	$('#newweek').on('show.bs.modal', function () {
		var wId = $('#weekeditwId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/weeklydetail',
	        //数据格式是key/value
	        data:'weekId='+wId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		$('#wopinion').val(data.wOpinion);
	        		if(data.wStatus==2){
	        			$('.selector').val("2");
	        		}else if(data.wStatus==3){
	        			$('.selector').val("3");
	        		}else{
	        			$('.selector').val("-1");
	        		}
	        		$('#originalopinion').val(data.wOpinion);
	        		$('#originalstatus').val(data.wStatus);
				}
	        }
	    }); 
	})
});
</script>
</html>