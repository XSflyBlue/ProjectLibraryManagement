<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目验收-大学生创新创业训练项目库管理系统</title>
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
                项目验收
            </div>
            <ol class="am-breadcrumb">
                <li>项目验收信息列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目验收信息列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" data-toggle="modal" data-target="#addend"><span class="am-icon-plus"></span> 新增</button>
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
	
	<!-- 新增项目验收材料（Modal） -->
	<div class="modal fade" id="addend" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增项目验收材料</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>项目名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select id="addendprojectname" class="selectoraddend">
									</select></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								项目执行情况：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpmiContent" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								成员分工任务：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpeiMission" class="form-control" rows="5"></textarea>
						</div>
						<div>
							<h4>
								体会、问题或建议：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpeiOpoinion" class="form-control" rows="5"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addend()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 编辑项目验收材料（Modal） -->
	<div class="modal fade" id="editend" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑项目验收材料</h4>
				</div>
				<div class="modal-body" style="height: 400px; overflow: auto;">
					<div id="" class="form-group">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>项目名称</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="endprojectname" class="form-control" size="30" disabled="disabled"></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								项目执行情况：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="pmiContent" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpmiContent" name="originalpmiContent" value="">
						</div>
						<div>
							<h4>
								成员分工任务：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="peiMission" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpeiMission" name="originalpeiMission" value="">
						</div>
						<div>
							<h4>
								体会、问题或建议：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="peiOpoinion" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalpeiOpoinion" name="originalpeiOpoinion" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editend()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 验收详情（Modal） -->
	<div class="modal fade" id="enddetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目中期检查详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="endppiId" name="endppiId" value="">
					<div id="j_endinfo" class="form-group">
					</div>
					<div id="j_endcheckinfo" class="form-group">
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
function addend() {
	var projectid = $('#addendprojectname option:selected').val();
	var pmiContent = $('#addpmiContent').val();
	var peiMission = $('#addpeiMission').val();
	var peiOpoinion = $('#addpeiOpoinion').val();
	if(pmiContent==''||peiMission==''||peiOpoinion=='')
    {
        alert('信息不完整');
        return false;
    }
	if(projectid==-1){
        alert('请选择项目');
        return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addend',
        //数据格式是key/value
        data:'projectid='+projectid+'&pmiContent='+pmiContent+'&peiMission='+peiMission+'&peiOpoinion='+peiOpoinion,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==0){
        			alert('操作失败');
        		}else if(data==-1){
        			alert('该项目无法创建新的验收信息');
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

function editend() {
	var ppiId = $('#endppiId').val();
	var pmiContent = $('#pmiContent').val();
	var originalpmiContent = $('#originalpmiContent').val();
	var peiMission = $('#peiMission').val();
	var originalpeiMission = $('#originalpeiMission').val();
	var peiOpoinion = $('#peiOpoinion').val();
	var originalpeiOpoinion = $('#originalpeiOpoinion').val();
	if(ppiId==''){
        alert('错误');
        return false;
	}
	if(pmiContent==''||peiMission==''||peiOpoinion==''){
        alert('信息不完整');
        return false;
	}
	if(pmiContent==originalpmiContent&&peiMission==originalpeiMission&&peiOpoinion==originalpeiOpoinion){
        alert('信息未更改');
        return false;
	}
	if(confirm("是否确认修改项目验收信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/editend',
	        //数据格式是key/value
	        data:'ppiId='+ppiId+'&pmiContent='+pmiContent+'&peiMission='+peiMission+'&peiOpoinion='+peiOpoinion,
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

function deleteend(ppiId) {
	if(ppiId=='')
    {
        alert('错误');
        return false;
    }
	if(confirm("是否确认删除项目中期信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/deleteend',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
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

function projectList(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/listend',
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
                +'<th class="table-set">项目验收状态</th></tr></thead>';
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
                  //项目验收状态
                    var pestatus='';
                    if(item.peiOStatus==null||item.peiOStatus==''){
                    	pestatus='暂无';
                    }else{
                    	if(item.peiOStatus==31){
                        	pestatus='待导师审核';
                        }else if(item.peiOStatus==32){
                        	pestatus='导师审核不通过';
                        }else if(item.peiOStatus==33){
                        	pestatus='待院系审核';
                        }else if(item.peiOStatus==34){
                        	pestatus='院系审核不通过';
                        }else if(item.peiOStatus==35){
                        	pestatus='待教务审核';
                        }else if(item.peiOStatus==36){
                        	pestatus='教务审核不通过';
                        }else if(item.peiOStatus==37){
                        	pestatus='待专家审核';
                        }else if(item.peiOStatus==38){
                        	pestatus='专家审核不通过';
                        }else if(item.peiOStatus==39){
                        	pestatus='验收成功';
                        }else{
                        	pestatus='暂无';
                        }
                    }
                    
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td>'+level+'</td><td>'+type+'</td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiCreateTime).format('YYYY-MM-DD')+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiEditTime).format('YYYY-MM-DD')+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" data-toggle="modal" data-target="#enddetail" '
                    +'onclick="putppiId('+item.ppiId+')">详情</button>';
                    if(item.uType==0){//负责人
                    	//审核为导师待审核时可编辑、可删除
                    	if(item.peiOStatus==31){
                            project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"'
                            +' data-toggle="modal" data-target="#editend" onclick="putppiId('+item.ppiId+')"> 编辑</button>';
                            project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                        		+' onclick="deleteend('+item.ppiId+')"> 删除</button>';
                    	}
                    }
                    project +='</div></div></td>'
                    +'<td class="am-hide-sm-only">'+pestatus+'</td>'
                    +'</tr></tbody>'
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
	                +'<th class="table-set">项目验收状态</th></tr></thead>';
				$('#j_project').append(project);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function putppiId(id) {
	$('#endppiId').val(id);
}
$(function(){
	$('#j_menu').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu').addClass("nav-link active");
	$('#j_end').addClass("active");
	$('#j_submenu').css('display','block');
	//初始化列表
	projectList(1);
	//修改项目验收窗口
	$('#editend').on('show.bs.modal', function () {
		var ppiId = $('#endppiId').val();
		//验收信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/endinfo',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		$('#endprojectname').val(data.pbName);
	        		$('#pmiContent').val(data.pmiContent);
	        		$('#originalpmiContent').val(data.pmiContent);
	        		$('#peiMission').val(data.peiMission);
	        		$('#originalpeiMission').val(data.peiMission);
	        		$('#peiOpoinion').val(data.peiOpoinion);
	        		$('#originalpeiOpoinion').val(data.peiOpoinion);
	        	}
	        }
	    }); 
	})
	//新增项目验收信息窗口
	$('#addend').on('show.bs.modal', function () {
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/listprojectnopage',
	        //数据格式是key/value
	        data:'type=1',
	        success:function(data){//返回json结果
	        	$('#addendprojectname').empty();
	        	if(data!=null){
	        		$('#addendprojectname').append('<option value="-1">请选择项目</option>');
	        		//内容
					$(data).each(function(index,item){
						if(item.uType==0){//负责人
							if(item.pmiOStatus==29){//立项成功
								$('#addendprojectname').append('<option value="'+item.pbId+'">'+item.pbName+'</option>');
							}
						}
					});
	        	}else{
	        		$('#addendprojectname').append('<option value="-1">请选择项目</option>');
	        	}
	        }
	    }); 
	})
	
	$('#enddetail').on('show.bs.modal', function () {
		var ppiId = $('#endppiId').val();
		//中期信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/endinfo',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
	        success:function(data){//返回json结果
	        	$('#j_endinfo').empty();
	        	if(data!=null){
	        		var level = '';
	        		if(data.peiLevel==0){
	        			level = '优秀';
	        		}else if(data.peiLevel==1){
	        			level = '合格';
	        		}else if(data.peiLevel==2){
	        			level = '不合格';
	        		}else{
	        			level = '暂无';
	        		}
                    var endinfo ='<h4>项目名：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.pbName+'</p></div>'
    	        		+'<h4>创建时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiCreateTime).format('YYYY-MM-DD')+'</p></div>'
    	        		+'<h4>修改时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiEditTime).format('YYYY-MM-DD')+'</p></div>'
    	        		+'<h4>项目执行情况：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.pmiContent+'</p></div>'
    	        		+'<h4>成员分工任务：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.peiMission+'</p></div>'
    	        		+'<h4>体会、问题或建议：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.peiOpoinion+'</p></div>'
    	        		+'<h4>验收等级：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+level+'</p></div>';
                    $('#j_endinfo').append(endinfo);
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
	        		$('#j_endcheckinfo').empty();
	        		var endcheckinfo = '<h4>审核信息<span class="close" data-close="note"></span></h4>'
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
						
						endcheckinfo += '<hr><h4>验收人员：<span class="close" data-close="note"></span></h4>'
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
	        		$('#j_endcheckinfo').append(endcheckinfo);
	        	}else{
	        		$('#j_endcheckinfo').empty();
	        		var endcheckinfo = '<hr><h4>审核信息<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all"><p>暂无审核信息</p></div>';
	        		$('#j_endcheckinfo').append(endcheckinfo);
	        	}
	        }
	    }); 
	})
});
</script>
</html>