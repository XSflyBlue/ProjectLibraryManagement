<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>预算审核-大学生创新创业训练项目库管理系统</title>
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
                预算审核
            </div>
            <ol class="am-breadcrumb">
                <li>项目预算列表</li>
                <li class="am-active">内容</li>
            </ol>
            
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 项目预算列表
                    </div>
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
    
    <!-- 预算详情（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目预算详情</h4>
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
	
	<!-- 项目预算审核（Modal） -->
	<div class="modal fade" id="newfund" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目预算审核</h4>
				</div>
				<div class="modal-body" style="height:400px;overflow:auto;">
					<form role="form">
						<div class="form-group">
						    <input type="hidden" id="pfundId" name="pfundId" value="">
						</div>
						<div class="form-group">
							<h4>
								项目名：<span class="close" data-close="note"></span>
							</h4>
							<div class="note note-info" style="word-break: break-all">
								<p id="fundprojectname"></p>
							</div>
							<h4>审核意见：<span class="close" data-close="note"></span></h4>
							<textarea id ="fopinion" class="form-control" rows="5"></textarea>
							<input type="hidden" id="originalopinion" name="originalstatus" value="">
							<h4>审核结论：<span class="close" data-close="note"></span></h4>
							<input type="hidden" id="originalstatus" name="originalstatus" value="">
							<select id ="fstatus" class="selector">
							    <option value="-1">请选择审核结论</option>
								<option value="2">审核通过</option>
								<option value="3">审核未通过</option>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="addfunds()">提交</button>
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
        url:'${pageContext.request.contextPath}/projectinfo/listfunds',
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
                +'<th class="table-set">项目预算状态</th></tr></thead>';
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
                    //状态
                    var status;
                    if(item.fStatus==0){
                    	status = '待添加';
                    }else if(item.fStatus==1){
                    	status = '待审核';
                    }else if(item.fStatus==2){
                    	status = '审核通过';
                    }else if(item.fStatus==3){
                    	status = '审核不通过';
                    }
                    
					project +='<tbody><tr><td>'+num+'</td>'
                    +'<td><a href="#projectdetail" data-toggle="modal" onclick="pId('+item.pbId+')">'+item.pbName+'</a></td>'
                    +'<td>'+level+'</td><td>'+type+'</td>'
                    +'<td class="am-hide-sm-only"><a href="#projectuser" data-toggle="modal" onclick="puid('+item.pbId+')">点击查看</a></td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">';
                    if(item.fStatus!=0){
                    	project +='<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" data-target="#myModal"'
                        +' onclick="pbId('+item.pbId+')">详情</button>';
                    	//管理员权限
                        project +='<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" '
                            +' data-toggle="modal" data-target="#newfund" '
                            +'onclick="editfunds('+item.pbId+')"> 审核</button>'
                            +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                            +'onclick="deletefunds('+item.pbId+')">重置审核</button>';
                    }
                    
                    project += '</div></div></td>'
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
	                +'<th class="table-set">项目预算状态</th></tr></thead>';
				$('#j_project').append(project);
			}
        }
    }); 
}
function getGoalPage(page) {
	postlist(page);
}

//编辑预算审核信息
function editfunds(id){
	pfundId(id);
	var pbId = $('#pfundId').val();
	//获取预算内容
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/fundsdetail',
        //数据格式是key/value
        data:'projectId='+pbId,
        success:function(data){//返回json结果
        	if(data!=null){
        		$('#fopinion').val(data.fOpinion);
        		if(data.fStatus==2){
        			$('.selector').val("2");
        		}else if(data.fStatus==3){
        			$('.selector').val("3");
        		}else{
        			$('.selector').val("-1");
        		}
        		$('#originalopinion').val(data.fOpinion);
        		$('#originalstatus').val(data.fStatus);

				$('#fundprojectname').empty();
				$('#fundprojectname').append(data.pbName);//传入审核信息表
			}
        }
    }); 
}
//新增预算审核信息
function addfunds(){
	var pfundId = $.trim($('#pfundId').val());
	var fopinion = $('#fopinion').val();
	var fstatus = $("#fstatus option:selected").val();
	var originalopinion = $("#originalopinion").val();
	var originalstatus = $("#originalstatus").val();
	
    if(pfundId==''||fopinion==''||fstatus=='')
    {
        alert('信息不完整');
        return false;
    }
	if(fstatus==-1){
        alert('请选择审核结论');
        return false;
	}
	if(fopinion==originalopinion&&fstatus==originalstatus){
        alert('信息未更改');
        return false;
	}
    //异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addfunds',
        //数据格式是key/value
        data:'projectId='+pfundId+'&fopinion='+fopinion+'&fstatus='+fstatus,
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
            $('#newfund').modal('hide');
            document.location.reload();
        }
    }); 
}
function deletefunds(pId) {
    if(pId=='')
    {
        alert('错误');
        return false;
    }

    //异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/projectinfo/addfunds',
        //数据格式是key/value
        data:'projectId='+pId,
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
            $('#newfund').modal('hide');
            document.location.reload();
        }
    }); 
}
function pbId(id) {
	$('#id').val(id);
}
function pfundId(id){
	$('#pfundId').val(id);
}
$(function(){
	$('#j_menu1').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu1').addClass("nav-link active");
	$('#j_fund').addClass("active");
	$('#j_submenu1').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	//初始化列表
	projectList(1);
	
	//预算详情
	$('#myModal').on('show.bs.modal', function () {
		var pbId = $('#id').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/projectinfo/fundsdetail',
	        //数据格式是key/value
	        data:'projectId='+pbId,
	        success:function(data){//返回json结果
	        	if(data!=null){
	        		var status = '';
	        		var opinion = '';
                    //状态
                    var status;
                    if(data.fStatus==0){
                    	status = '待添加';
                    }else if(data.fStatus==1){
                    	status = '待审核';
                    }else if(data.fStatus==2){
                    	status = '审核通过';
                    }else if(data.fStatus==3){
                    	status = '审核不通过';
                    }
                    
	        		if(data.fOpinion==null||data.fOpinion=='undefined'||data.fOpinion==''){
	        			opinion = '暂无评论';
	        		}else{
	        			opinion = data.fOpinion;
	        		}
	        		
	        		var time;
	        		if(data.fOpinionTime!=null&&data.fOpinionTime!=''){
	        			time=moment(data.fOpinionTime).format('YYYY-MM-DD');
	        			if(time=='0002-11-28'){
	        				time='暂无';
	        			}
	        		}else{	        			
	        			time='暂无';
	        		}
	        		var detail = '<h4>预算内容：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+data.fContent+'</p></div>'
	        		+'<h4>审核时间：<span class="close" data-close="note"></span></h4>'
	        		+'<div class="note note-info" style="word-break:break-all">'
	        		+'<p>'+time+'</p></div>'
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
});
</script>
</html>