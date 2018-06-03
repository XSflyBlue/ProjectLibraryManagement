<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>其他申请-大学生创新创业训练项目库管理系统</title>
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
               其他申请
            </div>
            <ol class="am-breadcrumb">
                <li>项目其他申请信息列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目其他申请信息列表
                    </div>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" data-toggle="modal" data-target="#addother"><span class="am-icon-plus"></span> 新增</button>
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
	<div class="modal fade" id="addother" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增其他申请材料</h4>
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
									<td><select id="addotherprojectname" class="selectoraddother">
									</select></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								申请类型：<span class="close" data-close="note"></span>
							</h4>
							<select id="addothertype" class="selectoraddothertype">
								<option value="-1">请选择申请类别</option>
								<option value="0">延期</option>
								<option value="1">调整</option>
								<option value="2">终止</option>
							</select>
						</div>
						<div>
							<h4>
								申请原因：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="addpoiContent" class="form-control" rows="10"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addother()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 编辑项目验收材料（Modal） -->
	<div class="modal fade" id="editother" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑其他申请材料</h4>
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
									<td><input type="text" id="otherprojectname" class="form-control" size="30" disabled="disabled"></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h4>
								申请类型：<span class="close" data-close="note"></span>
							</h4>
							<input type="text" id="poiType" class="form-control" size="30" disabled="disabled">
						</div>
						<div>
							<h4>
								申请原因：<span class="close" data-close="note"></span>
							</h4>
							<textarea id ="poiContent" class="form-control" rows="10"></textarea>
							<input type="hidden" id="originalpoiContent" name="originalpoiContent" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editother()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 其他申请详情（Modal） -->
	<div class="modal fade" id="otherdetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目中期检查详情</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<input type="hidden" id="otherppiId" name="otherppiId" value="">
					<div id="j_otherinfo" class="form-group">
					</div>
					<div id="j_othercheckinfo" class="form-group">
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
function addother() {
	var projectid = $('#addotherprojectname option:selected').val();
	var poiType = $('#addothertype option:selected').val();
	var poiContent = $('#addpoiContent').val();
	
	if(poiContent=='')
    {
        alert('信息不完整');
        return false;
    }
	if(projectid==-1)
    {
        alert('请选择项目');
        return false;
    }
	if(poiType==-1){
        alert('请选择申请类型');
        return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addother',
        //数据格式是key/value
        data:'projectid='+projectid+'&poiType='+poiType+'&poiContent='+poiContent,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==0){
        			alert('操作失败');
        		}else if(data==-1){
        			alert('该项目无法创建新的申请信息');
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

function editother() {
	var ppiId = $('#otherppiId').val();
	var poiContent = $('#poiContent').val();
	var originalpoiContent = $('#originalpoiContent').val();
	
	if(ppiId==''){
        alert('错误');
        return false;
	}
	if(poiContent==''){
        alert('信息不完整');
        return false;
	}
	if(poiContent==originalpoiContent){
        alert('信息未更改');
        return false;
	}
	if(confirm("是否确认修改申请信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/editother',
	        //数据格式是key/value
	        data:'ppiId='+ppiId+'&poiContent='+poiContent,
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

function deleteother(ppiId) {
	if(ppiId=='')
    {
        alert('错误');
        return false;
    }
	if(confirm("是否确认删除申请信息？")){
		//异步请求
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/deleteother',
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
        url:'${pageContext.request.contextPath}/projectinfo/listother',
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
				+'<th class="table-author am-hide-sm-only">导师及成员信息</th>'
				+'<th class="table-date am-hide-sm-only">创建时间</th>'
                +'<th class="table-date am-hide-sm-only">修改时间</th>'
                +'<th class="table-set">操作</th>'
                +'<th class="table-set">项目其他申请状态</th></tr></thead>';
				//内容
				$(data.list).each(function(index,item){
					//序号
					var num = index+1;
                    
                    //项目其他状态
                    var postatus='';
                    if(item.poiOStatus==null||item.poiOStatus==''){
                    	postatus='暂无';
                    }else{
                    	if(item.poiOStatus==41){
                        	postatus='待导师审核';
                        }else if(item.poiOStatus==42){
                        	postatus='导师审核不通过';
                        }else if(item.poiOStatus==43){
                        	postatus='待院系审核';
                        }else if(item.poiOStatus==44){
                        	postatus='院系审核不通过';
                        }else if(item.poiOStatus==45){
                        	postatus='待教务审核';
                        }else if(item.poiOStatus==46){
                        	postatus='教务审核不通过';
                        }else if(item.poiOStatus==47){
                        	postatus='待专家审核';
                        }else if(item.poiOStatus==48){
                        	postatus='专家审核不通过';
                        }else if(item.poiOStatus==49){
                        	postatus='其他情况审核成功';
                        }else{
                        	postatus='暂无';
                        }
                    }
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiCreateTime).format('YYYY-MM-DD')+'</td>'
                    +'<td class="am-hide-sm-only">'+moment(item.ppiEditTime).format('YYYY-MM-DD')+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" data-toggle="modal" data-target="#otherdetail" '
                    +'onclick="putppiId('+item.ppiId+')">详情</button>';
                    if(item.uType==0){//负责人
                    	//审核为导师待审核时可编辑、可删除
                    	if(item.poiOStatus==41){
                            project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"'
                            +' data-toggle="modal" data-target="#editother" onclick="putppiId('+item.ppiId+')"> 编辑</button>';
                            project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                        		+' onclick="deleteother('+item.ppiId+')"> 删除</button>';
                    	}
                    }
                    
                    project +='</div></div></td>'
                    +'<td class="am-hide-sm-only">'+postatus+'</td>'
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
	                +'<th class="table-set">项目状态</th></tr></thead>';
				$('#j_project').append(project);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}
function putppiId(id) {
	$('#otherppiId').val(id);
}
$(function(){
	$('#j_menu').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu').addClass("nav-link active");
	$('#j_other').addClass("active");
	$('#j_submenu').css('display','block');
	//初始化列表
	projectList(1);
	
	//修改其他申请窗口
	$('#editother').on('show.bs.modal', function () {
		var ppiId = $('#otherppiId').val();
		//验收信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/otherinfo',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		var type = '';
	        		if(data.poiType==0){
	        			type = '延期';
	        		}else if(data.poiType==1){
	        			type = '调整';
	        		}else if(data.poiType==2){
	        			type = '终止';
	        		}else {
	        			type = '暂无';
	        		}
	        		$('#otherprojectname').val(data.pbName);
	        		$('#poiContent').val(data.poiContent);
	        		$('#originalpoiContent').val(data.poiContent);
	        		$('#poiType').val(type);
	        	}
	        }
	    }); 
	})
	
	//新增其他申请信息窗口
	$('#addother').on('show.bs.modal', function () {
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/listprojectnopage',
	        //数据格式是key/value
	        data:'type=1',
	        success:function(data){//返回json结果
	        	$('#addotherprojectname').empty();
	        	if(data!=null){
	        		$('#addotherprojectname').append('<option value="-1">请选择项目</option>');
	        		//内容
					$(data).each(function(index,item){
						if(item.uType==0){//负责人
							if(item.psiOStatus==19){//立项成功
								$('#addotherprojectname').append('<option value="'+item.pbId+'">'+item.pbName+'</option>');
							}
						}
					});
	        	}else{
	        		$('#addotherprojectname').append('<option value="-1">请选择项目</option>');
	        	}
	        }
	    }); 
	})
	
	$('#otherdetail').on('show.bs.modal', function () {
		var ppiId = $('#otherppiId').val();
		//其他申请信息
		$.ajax({
			type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/otherinfo',
	        //数据格式是key/value
	        data:'ppiId='+ppiId,
	        success:function(data){//返回json结果
	        	$('#j_otherinfo').empty();
	        	if(data!=null){
	        		var type = '';
	        		if(data.poiType==0){
	        			type = '延期';
	        		}else if(data.poiType==1){
	        			type = '调整';
	        		}else if(data.poiType==2){
	        			type = '终止';
	        		}else {
	        			type = '暂无';
	        		}
	        		
                    var otherinfo ='<h4>项目名：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.pbName+'</p></div>'
    	        		+'<h4>创建时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiCreateTime).format('YYYY-MM-DD')+'</p></div>'
    	        		+'<h4>修改时间：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+moment(data.ppiEditTime).format('YYYY-MM-DD')+'</p></div>'
    	        		+'<h4>申请原因：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+data.poiContent+'</p></div>'
    	        		+'<h4>申请类型：<span class="close" data-close="note"></span></h4>'
    	        		+'<div class="note note-info" style="word-break:break-all">'
    	        		+'<p>'+type+'</p></div>';
                    $('#j_otherinfo').append(otherinfo);
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
	        		$('#j_othercheckinfo').empty();
	        		var othercheckinfo = '<h4>审核信息<span class="close" data-close="note"></span></h4>'
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
						
						othercheckinfo += '<hr><h4>验收人员：<span class="close" data-close="note"></span></h4>'
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
	        		$('#j_othercheckinfo').append(othercheckinfo);
	        	}else{
	        		$('#j_othercheckinfo').empty();
	        		var othercheckinfo = '<hr><h4>审核信息<span class="close" data-close="note"></span></h4><div class="note note-info" style="word-break:break-all"><p>暂无审核信息</p></div>';
	        		$('#j_othercheckinfo').append(othercheckinfo);
	        	}
	        }
	    }); 
	})
});
</script>
</html>