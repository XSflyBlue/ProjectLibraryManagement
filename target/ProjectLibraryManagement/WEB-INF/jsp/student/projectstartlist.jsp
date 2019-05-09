<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目立项-大学生创新创业训练项目库管理系统</title>
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
                项目立项
            </div>
            <ol class="am-breadcrumb">
                <li>项目立项列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目立项列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" data-toggle="modal" data-target="#addproject"><span class="am-icon-plus"></span> 新增</button>
                                </div>
                            </div>
                        </div>
                    </div>
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
						成员信息<span class="close" data-close="note"></span>
					</h4>
					<input type="hidden" id="projectuserPpid" value="">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<input type="button" class="am-btn am-btn-default am-btn-success"
								value="添加" onclick="addstudent()">
							<div class="col-md-6">
								<div class="control-wrapper">
									<input type="text" class="form-control" id="ucode"
										placeholder="请输入学号">
								</div>
							</div>
						</div>
					</form>
					<div id="projectuserStudent"></div>

					<h4>
						导师信息<span class="close" data-close="note"></span>
					</h4>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<input type="button" id="addteacherbutton" class="am-btn am-btn-default am-btn-success"
								value="添加" onclick="addteacher()">
							<div class="col-md-6">
								<div class="control-wrapper">
									<input type="text" class="form-control" id="ucode2"
										placeholder="请输入教师号">
								</div>
							</div>
						</div>
					</form>

					<div id="projectuserTeacher"></div>

				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="projectusercomplete()">确认</button>
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
	
	<!-- 新增项目（Modal） -->
	<div class="modal fade" id="addproject" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增项目</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<input type="hidden" id="postid" name="postid" value="">
					<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>项目名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="addprojectname" class="form-control" size="30"></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>项目安排</th>
									<th>项目级别</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select id="addprojectplan" class="selectoraddprojectplan">
									</select></td>
									<td><select id="addlevel" class="selectoraddlevel">
											<option value="-1">请选择项目级别</option>
											<option value="0">国家级</option>
											<option value="1">省部级</option>
											<option value="2">校&nbsp;&nbsp;&nbsp;&nbsp;级</option>
									</select></td>
								</tr>
							</tbody>
							<thead>
								<tr>
									<th>项目类型</th>
									<th>项目学科类别</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select id="addtype" class="selectoraddtype">
											<option value="-1">请选择项目类型</option>
											<option value="0">大学生创新创业训练</option>
											<option value="1">大学生科研训练计划</option>
									</select></td>
									<td><select id="addsubject" class="selectoraddsubject">
											<option value="-1">请选择项目学科类别</option>
											<option value="0">工学硬件</option>
											<option value="1">软件及其他</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								项目简介：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiBrief" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								申请理由：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiReason" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								项目方案：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiContent" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								项目特色与创新点：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiFeature" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								项目进度安排：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiPlan" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								项目完成预期成果：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpsiResult" class="form-control" rows="5"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addproject()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 编辑项目（Modal） -->
	<div class="modal fade" id="editproject" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑项目</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<input type="hidden" id="editprojectid" name="editprojectid" value="">
					<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>项目名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="projectname" disabled="disabled" class="form-control" size="30"></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<thead>
								<tr>
								    <th>项目级别</th>
									<th>项目类型</th>
									<th>项目学科类别</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								    <td><input type="text" id="level" disabled="disabled" class="form-control" size="30"></td>
									<td><input type="text" id="type" disabled="disabled" class="form-control" size="30"></td>
									<td><input type="text" id="subject" disabled="disabled" class="form-control" size="30"></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								项目简介：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiBrief" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiBrief" name="originalpsiBrief" value="">
						</div>
						<div>
							<h4>
								申请理由：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiReason" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiReason" name="originalpsiReason" value="">
						</div>
						<div>
							<h4>
								项目方案：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiContent" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiContent" name="originalpsiContent" value="">
						</div>
						<div>
							<h4>
								项目特色与创新点：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiFeature" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiFeature" name="originalpsiFeature" value="">
						</div>
						<div>
							<h4>
								项目进度安排：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiPlan" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiPlan" name="originalpsiPlan" value="">
						</div>
						<div>
							<h4>
								项目完成预期成果：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="psiResult" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpsiResult" name="originalpsiResult" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editproject()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
    <!-- 立项详情（Modal） -->
	<div class="modal fade" id="startdetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目立项详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="startppiId" name="startppiId" value="">
					<input type="hidden" id="startpId" name="startpId" value="">
					<div id="j_startinfo" class="form-group">
					</div>
					<div id="j_startcheckinfo" class="form-group">
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
function addproject() {
	var projectname= $('#addprojectname').val();
	var projectplan= $('#addprojectplan option:selected').val();
	var level= $('#addlevel option:selected').val();
	var type= $('#addtype option:selected').val();
	var subject= $('#addsubject option:selected').val();
	var psiBrief= $('#addpsiBrief').val();
	var psiReason= $('#addpsiReason').val();
	var psiContent= $('#addpsiContent').val();
	var psiFeature= $('#addpsiFeature').val();
	var psiPlan= $('#addpsiPlan').val();
	var psiResult= $('#addpsiResult').val();
	if(projectname==''||psiBrief==''||psiReason==''||psiContent==''
			||psiFeature==''||psiPlan==''||psiResult==''){
        alert('信息不完整');
        return false;
	}
	if(projectplan==-1){
        alert('请选择项目安排');
        return false;
	}
	
	if(level==-1){
        alert('请选择项目级别');
        return false;
	}
	
	if(type==-1){
        alert('请选择项目类型');
        return false;
	}
	
	if(subject==-1){
        alert('请选择项目学科类别');
        return false;
	}
	
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addstart',
        //数据格式是key/value
        data:'projectname='+projectname+'&projectplan='+projectplan+'&level='+level+
    	'&type='+type+'&subject='+subject+'&psiBrief='+psiBrief+
    	'&psiReason='+psiReason+'&psiContent='+psiContent+'&psiFeature='+psiFeature+
    	'&psiPlan='+psiPlan+'&psiResult='+psiResult,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==0){
        			alert('操作失败');
        		}else if(data==-1){
            		alert('项目名已存在');
        		}else if(data==-2){
            		alert('一个负责人只能申请一次该项目安排');
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

function putprojectid(id) {
	$('#editprojectid').val(id);
}

function editproject() {
	var projectid = $('#editprojectid').val();
	if(projectid==''){
		alert('错误');
		return false;
	}
	var psiBrief = $('#psiBrief').val();
	var originalpsiBrief = $('#originalpsiBrief').val();
	var psiReason = $('#psiReason').val();
	var originalpsiReason = $('#originalpsiReason').val();
	var psiContent = $('#psiContent').val();
	var originalpsiContent = $('#originalpsiContent').val();
	var psiFeature = $('#psiFeature').val();
	var originalpsiFeature = $('#originalpsiFeature').val();
	var psiPlan = $('#psiPlan').val();
	var originalpsiPlan = $('#originalpsiPlan').val();
	var psiResult = $('#psiResult').val();
	var originalpsiResult = $('#originalpsiResult').val();
	
	if(psiBrief==''||psiReason==''||psiContent==''
		||psiFeature==''||psiPlan==''||psiResult==''){
		alert('信息不完整');
		return false;
    }
	if(psiBrief==originalpsiBrief&&psiReason==originalpsiReason&&psiContent&&originalpsiContent
			&&psiFeature==originalpsiFeature&&psiPlan==originalpsiPlan&&psiResult&&originalpsiResult){
		alert('信息未更改');
		return false;
    }
	if(confirm("是否确认修改项目信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/editstart',
	        //数据格式是key/value
	        data:'projectid='+projectid+'&psiBrief='+psiBrief+
	    	'&psiReason='+psiReason+'&psiContent='+psiContent+'&psiFeature='+psiFeature+
	    	'&psiPlan='+psiPlan+'&psiResult='+psiResult,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		if(data==0){
	        			alert('操作失败');
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

function deleteproject(projectid) {
	if(projectid=='')
    {
        alert('错误');
        return false;
    }
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/deletestart',
        //数据格式是key/value
        data:'projectid='+projectid,
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

function projectList(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/liststart',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10',
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
				$('#j_project').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">编号</th>'
				+'<th class="table-title">项目名称</th>'
				+'<th class="table-type">项目级别</th>'
				+'<th class="table-type">项目类型</th>'
				+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
				+'<th class="table-date am-hide-sm-only">创建时间</th>'
                +'<th class="table-date am-hide-sm-only">修改时间</th>'
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
                    //项目立项状态
                    var psstatus='';
                    if(item.psiOStatus==null||item.psiOStatus==''){
                    	psstatus='暂无';
                    }else{
                    	if(item.psiOStatus==11){
                        	psstatus='待导师审核';
                        }else if(item.psiOStatus==10){
                        	psstatus='成员信息待完善';
                        }else if(item.psiOStatus==12){
                        	psstatus='导师审核不通过';
                        }else if(item.psiOStatus==13){
                        	psstatus='待院系审核';
                        }else if(item.psiOStatus==14){
                        	psstatus='院系审核不通过';
                        }else if(item.psiOStatus==15){
                        	psstatus='待教务审核';
                        }else if(item.psiOStatus==16){
                        	psstatus='教务审核不通过';
                        }else if(item.psiOStatus==17){
                        	psstatus='待专家审核';
                        }else if(item.psiOStatus==18){
                        	psstatus='专家审核不通过';
                        }else if(item.psiOStatus==19){
                        	psstatus='立项成功';
                        }else{
                        	psstatus='暂无';
                        }
                    }
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td>'+level+'</td><td>'+type+'</td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiCreateTime).format('YYYY-MM-DD')+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiEditTime).format('YYYY-MM-DD')+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" '
                    +' data-toggle="modal" data-target="#startdetail" onclick="putppiId('+item.ppiId+','+item.pbId+')"> 详情</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" onclick="exportStart('+item.pbId+')"> 导出</button>';
                    
                    if(item.uType==0){//负责人
                    	//审核不合格时可编辑
                    	if(item.psiOStatus==10||item.psiOStatus==11
                    			||item.psiOStatus==12||item.psiOStatus==14
                    			||item.psiOStatus==16||item.psiOStatus==18){
                            project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"'
                            +' data-toggle="modal" data-target="#editproject" onclick="putprojectid('+item.pbId+')"> 编辑</button>';
                    	}
                        //审核状态为待教师审核是可删除
                    	if(item.psiOStatus<11){
                    		project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    		+' onclick="deleteproject('+item.pbId+')"> 删除</button>';
                    	}
                    	//审核状态为待添加成员可进行软件管理
                    	if(item.psiOStatus==10){
                    		project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    		+' data-toggle="modal" data-target="#editprojectuser" onclick="puid('+item.pbId+')"> 成员管理</button>';
                    	}
                    }

                    project +='</div></div></td>'
                    +'<td class="am-hide-sm-only">'+psstatus+'</td>'
                    +'</tr></tbody>';
				});
				$('#j_project').append(project);
			}else{
				$('#j_project').empty();
				var project = '<thead><tr>'
					+'<th class="table-id">编号</th>'
					+'<th class="table-title">项目名称</th>'
					+'<th class="table-type">项目级别</th>'
					+'<th class="table-type">项目类型</th>'
					+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
					+'<th class="table-date am-hide-sm-only">创建时间</th>'
	                +'<th class="table-date am-hide-sm-only">修改时间</th>'
	                +'<th class="table-set">操作</th>'
	                +'<th class="table-set">项目状态</th></tr></thead>';
				$('#j_project').append(project);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function putppiId(ppid,pid) {
	$('#startppiId').val(ppid);
	$('#startpId').val(pid);
}
//确认成员信息
function projectusercomplete() {
	var pId = $('#projectuserid').val();
	if(pId=='')
    {
        alert('错误');
        return false;
    }
	if(confirm("是否确认不再修改成员信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/changestartstatus',
	        //数据格式是key/value
	        data:'projectId='+pId+'&psiOStatus='+11,
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
}
//添加学生
function addstudent(){
	var pId = $('#projectuserid').val();
	var ucode = $('#ucode').val();
	var ppid = $('#projectuserPpid').val();
	if(ucode==''){
        alert('请输入学号');
        return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addstudent',
        //数据格式是key/value
        data:'ucode='+ucode+'&ppid='+ppid+'&pId='+pId,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		return true;
        		}else if(data==0){
        			alert('操作失败');
        		}else if(data==-1){
        			alert('用户不存在');
        		}else if(data==-6){
        			alert('非学生');
        		}else if(data==-2){
        			alert('项目安排不存在');
        		}else if(data==-5){
        			alert('学生组队人数受限');
        		}else if(data==-3){
        			alert('学生年级受限');
        		}else if(data==-7){
        			alert('无法添加本人');
        		}else if(data==0){
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
//添加导师
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
        data:'ucode='+ucode+'&ppid='+ppid+'&pId='+pId,
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
        			alert('非教师');
        		}else if(data==-2){
        			alert('项目安排不存在');
        		}else if(data==-4){
        			alert('导师指导人数达上限');
        		}else if(data==0){
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
        			if(data[i].uType==0){
        				leader ='<table class="table table-bordered"><thead><tr>'
        					+'<th>学生姓名</th><th>学院</th><th>学号</th><th>联系电话</th><th>E-mail</th><th>操作</th></tr></thead><tbody>'
        					+'<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td><td></td></tr>';
        			}else if(data[i].uType==1){
        				student += '<tr><td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].uCode+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td><td>'
        				+'<a onclick="deleteprojectuser('+data[i].puId+')">删除</a></td></tr>';
        			}else if(data[i].uType==2){
        				teacher ='<table class="table table-bordered"><thead><tr>'
        					+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th><th>操作</th></tr></thead><tbody><tr>'
        					+'<td>'+data[i].uRealname+'</td><td>'+data[i].college+'</td><td>'+data[i].jobTitle+'</td><td>'+data[i].tel+'</td><td>'+data[i].email+'</td><td>'
        					+'<a onclick="deleteteacher('+data[i].puId+')">删除</a></td></tr></tbody></table>';
        			}
        		}
        		student +='</tbody></table>';
        		projectuser += leader+student;
        		if(teacher==''){
        			teacher = '<table class="table table-bordered"><thead><tr>'
        			+'<th>导师姓名</th><th>学院</th><th>职称/职务</th><th>联系电话</th><th>E-mail</th></tr></thead></table>';
        		}else{
        			$("#addteacherbutton").attr('disabled',true); 
        		}
        		$('#projectuserStudent').empty();
        		$('#projectuserStudent').append(projectuser);
        		$('#projectuserTeacher').empty();
        		$('#projectuserTeacher').append(teacher);
			}
        }
    }); 
}
$(function(){
	$('#j_menu').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu').addClass("nav-link active");
	$('#j_start').addClass("active");
	$('#j_submenu').css('display','block');
	//初始化列表
	projectList(1);
	
	//新增项目
	$('#addproject').on('show.bs.modal', function () {
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/listPlanNopage',
	        //数据格式是key/value
	        data:'type=1',
	        success:function(data){//返回json结果
	        	$('#addprojectplan').empty();
	        	if(data!=null){
	        		$('#addprojectplan').append('<option value="-1">请选择项目安排</option>');
	        		//内容
					$(data).each(function(index,item){
						$('#addprojectplan').append('<option value="'+item.ppId+'">'+item.ppName+'</option>');
					});

	        	}else{
	        		$('#addprojectplan').append('<option value="-1">请选择项目安排</option>');
	        	}
	        }
	    }); 
	})
	
	$("#addprojectplan").change(function(){
		var ppid=$("#addprojectplan").val();
		ppId(ppid);
		var ppid = $('#projectplanid').val();
		var projectplanurl = $('#projectplanurl').val();
		$.ajax({
	        type:'post',
	        url:projectplanurl+'/projectinfo/projectplandetail',
	        //数据格式是key/value
	        data:'planid='+ppid,
	        success:function(data){//返回json结果
	        	if(data!=null&&data!=''){
	        		var plan = ''
	        			+'项目计划名称：'+data.ppName
	        			+'||年度：'+data.ppYear
	        			+'||立项截止时间：'+moment(data.ppStartTime).format('YYYY-MM-DD')
	        			+'||预计中期时间：'+moment(data.ppMidTime).format('YYYY-MM-DD')
	        			+'||预计验收时间：'+moment(data.ppEndTime).format('YYYY-MM-DD')
	        			+'||学生人数限制：'+data.stuNum
	        			+'||年级限制（入学时间）：'+moment(data.acceptTime).format('YYYY-MM-DD')
	        			+'||导师指导人数限制：'+data.tuStuNum;
	        		alert(plan);
	        	}else{
	        		alert('无数据');
	        	}
	        }
	    });
	});
	//项目成员管理列表
	$('#editprojectuser').on('show.bs.modal', function () {
		projectuser();
	})
	
	//项目编辑
	$('#editproject').on('show.bs.modal', function () {
		var pId = $('#editprojectid').val();
		//立项信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/projectinfo',
	        //数据格式是key/value
	        data:'pId='+pId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		//项目级别
                    var level='';
                    if(data.pbLevel=='0'){
                    	level='国家级';
                    }else if(data.pbLevel=='1'){
                    	level='省部级';
                    }else if(data.pbLevel=='2'){
                    	level='校级';
                    }
                    //项目类型
                    var type='';
                    if(data.pbType=='0'){
                    	type='大学生创新创业训练';
                    }else if(data.pbType=='1'){
                    	type='大学生科研训练计划';
                    }
                    //项目学科
                    var major='';
                    if(data.subjectType==0){
                    	major = '工学硬件';
                    }else if(data.subjectType==1){
                    	major = '软件及其他';
                    }
                    
                    $('#projectname').val(data.pbName);
                    $('#level').val(level);
                    $('#type').val(type);
                    $('#subject').val(major);
                    
                    $('#psiBrief').val(data.psiBrief);
                    $('#originalpsiBrief').val(data.psiBrief);
                    $('#psiReason').val(data.psiReason);
                    $('#originalpsiReason').val(data.psiReason);
                    $('#psiContent').val(data.psiContent);
                    $('#originalpsiContent').val(data.psiContent);
                    $('#psiFeature').val(data.psiFeature);
                    $('#originalpsiFeature').val(data.psiFeature);
                    $('#psiPlan').val(data.psiPlan);
                    $('#originalpsiPlan').val(data.psiPlan);
                    $('#psiResult').val(data.psiResult);
                    $('#originalpsiResult').val(data.psiResult);
                    
	        	}
	        }
	    }); 
	})
	
	$('#startdetail').on('show.bs.modal', function () {
		var ppiId = $('#startppiId').val();
		var pId = $('#startpId').val();
		//立项信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/projectinfo',
	        //数据格式是key/value
	        data:'pId='+pId,
	        success:function(data){//返回json结果
	        	$('#j_startinfo').empty();
	        	if(data!=null){
	        		//项目级别
                    var level='';
                    if(data.pbLevel=='0'){
                    	level='国家级';
                    }else if(data.pbLevel=='1'){
                    	level='省部级';
                    }else if(data.pbLevel=='2'){
                    	level='校级';
                    }
                    //项目类型
                    var type='';
                    if(data.pbType=='0'){
                    	type='大学生创新创业训练';
                    }else if(data.pbType=='1'){
                    	type='大学生科研训练计划';
                    }
                    //项目学科
                    var major='';
                    if(data.subjectType==0){
                    	major = '工学硬件';
                    }else if(data.subjectType==1){
                    	major = '软件及其他';
                    }
                    var midinfo ='<table class="table table-bordered"><thead><tr>'
	        			+'<th>项目名称</th></tr></thead><tbody><tr>'
	        			+'<td>'+data.pbName+'</td>'
	        			+'</tr></tbody></table><table class="table table-bordered"><thead><tr>'
	        			+'<th>项目级别</th><th>项目类型</th><th>项目学科类别</th></tr></thead><tbody><tr>'
	        			+'<td>'+level+'</td><td>'+type+'</td><td>'+major+'</td></tr></tbody></table>'
	        			+'<div><h4>项目简介：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiBrief+'</p></div></div>'
    	        		+'<h4>创建时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiCreateTime).format('YYYY-MM-DD')+'</p></div>'
    	        		+'<h4>修改时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiEditTime).format('YYYY-MM-DD')+'</p></div>'
	        			+'<div><h4>申请理由：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiReason+'</p></div></div>'
	        			+'<div><h4>项目方案：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiContent+'</p></div></div>'
	        			+'<div><h4>项目特色与创新点：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiFeature+'</p></div></div>'
	        			+'<div><h4>项目进度安排：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiPlan+'</p></div></div><div>'
	        			+'<h4>项目完成预期成果：<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all">'
	        			+'<p>'+data.psiResult+'</p></div></div>';
                    $('#j_startinfo').append(midinfo);
	        	}
	        }
	    }); 
		//审核信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/checkinfo',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
	        success:function(data){//返回json结果
	        	if(data!=null&&data!=''){
	        		$('#j_startcheckinfo').empty();
	        		var startcheckinfo = '<h4>审核信息<span class="close" data-close="note"></span></h4>'
	        		//内容
					$(data).each(function(index,item){
						var utype ='';
						if(item.oUType==0){
							utype='导师';
						}else if(item.oUType==1){
							utype='评审专家';
						}else if(item.oUType==2){
							utype='学院或系管理员';
						}else if(item.oUType==3){
							utype='学校教务部门管理员';
						}
						var ostatus='';
						if(item.oStatus==0){
							ostatus='审核通过';
						}else if(item.oStatus==1){
							ostatus='审核未通过';
						}
						
						startcheckinfo += '<hr><h4>验收人员：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+utype+'</p></div>'
		        		+'<h4>审核状态：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+ostatus+'</p></div>'
		        		+'<h4>审核时间：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+moment(item.oTime).format('YYYY-MM-DD')+'</p></div>'
		        		+'<h4>审核意见：<span class="close" data-close="note"></span></h4>'
		        		+'<div class="note note-info" style="word-break:break-all">'
		        		+'<p>'+item.oContent+'</p></div>';
					});
	        		$('#j_startcheckinfo').append(startcheckinfo);
	        	}else{
	        		$('#j_startcheckinfo').empty();
	        		var startcheckinfo = '<hr><h4>审核信息<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all"><p>暂无审核信息</p></div>';
	        		$('#j_startcheckinfo').append(startcheckinfo);
	        	}
	        }
	    }); 
	})
});
</script>
</html>