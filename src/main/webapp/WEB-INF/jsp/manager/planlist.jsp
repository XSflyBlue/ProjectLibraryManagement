<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目安排-大学生创新创业训练项目库管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body data-type="index">

    <%@include file='../common/header-login.jsp' %>
    
    <div class="tpl-page-container">
    
    <%@include file='../manager/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                项目安排
            </div>
            <ol class="am-breadcrumb">
                <li>项目安排列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目安排列表
                    </div>
                </div>
                <div class="am-g" id="addbutton">
                
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
	
	<!-- 项目安排（添加）（Modal） -->
	<div class="modal fade" id="newplan" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新建项目安排</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<form role="form">
						<div class="form-group">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>项目计划名称</th>
										<th>年度</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="newppName" class="form-control"></td>
										<td><input type="text" id="newppYear" class="form-control" placeholder="格式：2018"></td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>时间计划</caption>
								<thead>
									<tr>
										<th>立项截止时间</th>
										<th>预计中期时间</th>
										<th>预计验收时间</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="datepicker1" class="form-control" size="30"></td>
										<td><input type="text" id="datepicker2" class="form-control" size="30"></td>
										<td><input type="text" id="datepicker3" class="form-control" size="30"></td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>人数计划</caption>
								<thead>
									<tr>
										<th>学生人数限制</th>
										<th>年级限制（入学时间）</th>
										<th>导师指导人数限制</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="newstuNum" class="form-control"></td>
										<td><input type="text" id="datepicker4" class="form-control" size="30" placeholder="格式：2018-09-01"></td>
										<td><input type="text" id="newtuStuNum" class="form-control"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addplan()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 项目安排（修改）（Modal） -->
	<div class="modal fade" id="editplan" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改项目安排</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<form role="form">
					        <input type="hidden" id="editplanid" name="editplanid" value="">
						<div class="form-group">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>项目计划名称</th>
										<th>年度</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="ppName" class="form-control"><input type="hidden" id="originalppName" name="originalppName" value=""></td>										
										<td><input type="text" id="ppYear" class="form-control"><input type="hidden" id="originalppYear" name="originalppYear" value=""></td>								
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>时间计划</caption>
								<thead>
									<tr>
										<th>立项截止时间</th>
										<th>预计中期时间</th>
										<th>预计验收时间</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="start" class="form-control" size="30"><input type="hidden" id="originalstart" name="originalstart" value=""></td>
										<td><input type="text" id="mid" class="form-control" size="30"><input type="hidden" id="originalmid" name="originalmid" value=""></td>
										<td><input type="text" id="end" class="form-control" size="30"><input type="hidden" id="originalend" name="originalend" value=""></td>			
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>人数计划</caption>
								<thead>
									<tr>
										<th>学生人数限制</th>
										<th>年级限制（入学时间）</th>
										<th>导师指导人数限制</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="stuNum" class="form-control"><input type="hidden" id="originalstuNum" name="originalstuNum" value=""></td>
										<td><input type="text" id="accept" class="form-control" size="30" placeholder="格式：2018-09-01"><input type="hidden" id="originalaccept" name="originalaccept" value=""></td>
										<td><input type="text" id="tuStuNum" class="form-control"><input type="hidden" id="originaltuStuNum" name="originaltuStuNum" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editplan()">提交</button>
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
    <script src="js/jquery-ui.min.js"></script>
</body>
<script type="text/javascript">
//项目安排列表
function projectList(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/listPlan',
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
				+'<th class="table-title">项目安排名</th>'
				+'<th class="table-type">年度</th>'
                +'<th class="table-set">操作</th>';
				//内容
				$(data.list).each(function(index,item){
					//序号
					var num = index+1;
                    
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectplan" data-toggle="modal" onclick="ppId('+item.ppId+')">'+item.ppName+'</a></td>'
                    +'<td>'+item.ppYear+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" data-target="#projectplan" onclick="ppId('+item.ppId+')">详情</button>';
                    
                    var role = "${user.role}";
                    if(role==1){
                        project += '<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" '
                            +'data-target="#editplan" onclick="putplanid('+item.ppId+')">编辑</button>'
                            +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                            +'onclick="deleteplan('+item.ppId+')"> 删除</button>';
                    }
                    
                    project +='</div></div></td>'
                    +'</tr></tbody>';
				});
				$('#j_project').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">编号</th>'
					+'<th class="table-title">项目安排名</th>'
					+'<th class="table-type">年度</th>'
	                +'<th class="table-set">操作</th>';
				$('#j_project').append(project);
			}
        }
    }); 
}
//项目安排列表翻页
function getGoalPage(page) {
	postlist(page);
}

function addplan() {
	var ppName = $('#newppName').val();
	var ppYear = $('#newppYear').val();
	var startTime = $('#datepicker1').val();
	var midTime = $('#datepicker2').val();
	var endTime = $('#datepicker3').val();
	var stuNum = $('#newstuNum').val();
	var acceptTime = $('#datepicker4').val();
	var tuStuNum = $('#newtuStuNum').val();
	if(ppName==''||ppYear==''||startTime==''||midTime==''||endTime==''||stuNum==''||acceptTime==''||tuStuNum==''){
        alert('信息不完整');
        return false;
	}
	var reg=/^(20\d{2})$/;
	if(!reg.test(ppYear)){
        alert('年份无效');
        return false;
	}
	//项目计划时间验证
	var start = convertDateFromString(startTime);
	var mid = convertDateFromString(midTime);
	var end = convertDateFromString(endTime);
	
	if(start>mid||mid>end){
        alert('立项、中期、验收计划时间不符现实');
        return false;
	}
	
	//学生限制
	var now = new Date();
	var accept = convertDateFromString(acceptTime);
	if(now<accept||accept.getFullYear()<(now.getFullYear()-4)){
        alert('入学时间选择有误');
        return false;
	}
	//数字限制
	if(isNaN(parseInt(stuNum))){
        alert('学生人数限制需要输入数字');
        return false;
	}
	if(isNaN(parseInt(tuStuNum))){
        alert('导师指导人数限制需要输入数字');
        return false;
	}
	if(stuNum>tuStuNum){
        alert('导师指导人数应不小于一个项目的人数');
        return false;
	}
	
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/addplan',
        //数据格式是key/value
        data:'ppName='+ppName+'&ppYear='+ppYear+'&startTime='+startTime
        +'&midTime='+midTime+'&endTime='+endTime
        +'&stuNum='+stuNum+'&acceptTime='+acceptTime+'&tuStuNum='+tuStuNum,
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

function putplanid(id) {
	$('#editplanid').val(id);
}

function editplan() {
	var ppId = $('#editplanid').val();
	var ppName = $('#ppName').val();
	var ppYear = $('#ppYear').val();
	var startTime = $('#start').val();
	var midTime = $('#mid').val();
	var endTime = $('#end').val();
	var stuNum = $('#stuNum').val();
	var acceptTime = $('#accept').val();
	var tuStuNum = $('#tuStuNum').val();
	var originalppName= $('#originalppName').val();
	var originalppYear= $('#originalppYear').val();
	var originalstart= $('#originalstart').val();
	var originalmid= $('#originalmid').val();
	var originalend= $('#originalend').val();
	var originalstuNum= $('#originalstuNum').val();
	var originalaccept= $('#originalaccept').val();
	var originaltuStuNum= $('#originaltuStuNum').val()
	
	if(ppName==''||ppYear==''||startTime==''||midTime==''||endTime==''||stuNum==''||acceptTime==''||tuStuNum==''){
        alert('信息不完整');
        return false;
	}
	if(ppName== originalppName && ppYear==originalppYear &&startTime==originalstart
			&&midTime==originalmid &&endTime==originalend&&stuNum==originalstuNum
			&&acceptTime==originalaccept&&tuStuNum==originaltuStuNum){
        alert('信息未修改');
        return false;
	}
	
	var reg=/^(20\d{2})$/;
	if(!reg.test(ppYear)){
        alert('年份无效');
        return false;
	}
	//项目计划时间验证
	var start = convertDateFromString(startTime);
	var mid = convertDateFromString(midTime);
	var end = convertDateFromString(endTime);
	
	if(start>mid||mid>end){
        alert('立项、中期、验收计划时间不符现实');
        return false;
	}
	
	//学生限制
	var now = new Date();
	var accept = convertDateFromString(acceptTime);
	if(now<accept||accept.getFullYear()<(now.getFullYear()-4)){
        alert('入学时间选择有误');
        return false;
	}
	//数字限制
	if(isNaN(parseInt(stuNum))){
        alert('学生人数限制需要输入数字');
        return false;
	}
	if(isNaN(parseInt(tuStuNum))){
        alert('导师指导人数限制需要输入数字');
        return false;
	}
	if(stuNum>tuStuNum){
        alert('导师指导人数应不小于一个项目的人数');
        return false;
	}
	
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/editplan',
        //数据格式是key/value
        data:'ppName='+ppName+'&ppId='+ppId+'&ppYear='+ppYear+'&startTime='+startTime
        +'&midTime='+midTime+'&endTime='+endTime
        +'&stuNum='+stuNum+'&acceptTime='+acceptTime+'&tuStuNum='+tuStuNum,
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

function deleteplan(ppId) {
	if(ppId=='')
    {
        alert('错误');
        return false;
    }

    //异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/deleteplan',
        //数据格式是key/value
        data:'ppId='+ppId,
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

$(function(){
	//功能列表
	$('#j_menu2').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu2').addClass("nav-link active");
	$('#j_planmenu').addClass("active");
	$('#j_submenu2').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	
	var role = "${user.role}";
	if(role==1){
		//新增按钮
		var menu = '<div class="am-u-sm-12 am-u-md-6"><div class="am-btn-toolbar">'
			+'<div class="am-btn-group am-btn-group-xs">'
			+'<button type="button" class="am-btn am-btn-default am-btn-success" '
			+'data-toggle="modal" data-target="#newplan">'
			+'<span class="am-icon-plus"></span>新增</button></div></div></div>';
			
		$('#addbutton').empty();
		$('#addbutton').append(menu);
	}

	//项目计划列表
	projectList(1);
	
	//时间选择器
	$( "#datepicker1" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#datepicker1" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	//时间选择器
	$( "#datepicker2" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#datepicker2" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//时间选择器
	$( "#datepicker3" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#datepicker3" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//时间选择器
	$( "#datepicker4" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#datepicker4" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//时间选择器
	$( "#start" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#start" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	//时间选择器
	$( "#mid" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#mid" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//时间选择器
	$( "#end" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#end" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//时间选择器
	$( "#accept" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	$( "#accept" ).datepicker("option", "dateFormat", 'yy-mm-dd');
	
	//项目安排编辑
	$('#editplan').on('show.bs.modal', function () {
		var ppid = $('#editplanid').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/projectplandetail',
	        //数据格式是key/value
	        data:'planid='+ppid,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		$('#ppName').val(data.ppName);
	        		$('#originalppName').val(data.ppName);
	        		
	        		$('#ppYear').val(data.ppYear);
	        		$('#originalppYear').val(data.ppYear);
	        		
	        		$('#start').val(moment(data.ppStartTime).format('YYYY-MM-DD'));
	        		$('#originalstart').val(moment(data.ppStartTime).format('YYYY-MM-DD'));

	        		$('#mid').val(moment(data.ppMidTime).format('YYYY-MM-DD'));
	        		$('#originalmid').val(moment(data.ppMidTime).format('YYYY-MM-DD'));
	        		
	        		$('#end').val(moment(data.ppEndTime).format('YYYY-MM-DD'));
	        		$('#originalend').val(moment(data.ppEndTime).format('YYYY-MM-DD'));
	        		
	        		$('#stuNum').val(data.stuNum);
	        		$('#originalstuNum').val(data.stuNum);
	        		
	        		$('#tuStuNum').val(data.tuStuNum);
	        		$('#originaltuStuNum').val(data.tuStuNum);
	        		
	        		$('#accept').val(moment(data.acceptTime).format('YYYY-MM-DD'));
	        		$('#originalaccept').val(moment(data.acceptTime).format('YYYY-MM-DD'));
	        	}	
	        }
	    }); 
	})
});
</script>
</html>