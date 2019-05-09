<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理-大学生创新创业训练项目库管理系统</title>
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

    <%@include file='../admin/indexmenu.jsp' %>

        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                用户管理
            </div>
            <ol class="am-breadcrumb">
                <li>用户管理列表</li>
                <li class="am-active">内容</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 用户管理列表
                    </div>
                </div>
                    <div class="tpl-block">
                        <div class="am-g">
                            <div class="am-u-sm-12 am-u-md-6">
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button" class="am-btn am-btn-default am-btn-danger" data-toggle="modal" data-target="#editcollege" onclick="putcollegeuid(0)">新增学校教务部门管理员</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="am-g">
                            <div class="am-u-sm-12">
                                <div class="am-tabs tpl-index-tabs" data-am-tabs>
                                    <ul class="am-tabs-nav am-nav am-nav-tabs">
                                        <li><a href="#tab1">学校教务部门管理员</a></li>
                                    </ul>
                                    <div class="am-tabs-bd">
                                      
                                        <div class="am-tab-panel am-fade" id="tab1">
                                            <div class="am-u-sm-12">
                                                <form class="am-form">
                                                    <table id='j_collegelist' class="am-table am-table-striped am-table-hover table-main">
                                                        
                                                    </table>
                                                    <div class="am-cf">

                                                        <div class="am-fr">
                                                            <ul id="j_collegepage" class="am-pagination tpl-pagination"></ul>
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
                    </div>
                
                <!--大边距-->
                <div class="tpl-alert"></div>
            </div>
        </div>
    </div>
	
	<!-- 学院或系管理员个人资料（Modal） -->
	<div class="modal fade" id="editcollege" tabindex="-1" role="dialog"
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
								type="text" class="form-control" id="coluName" name="coluName"
								placeholder="" value="">
								<input
								type="hidden" id="cololduName" name="cololduName"
								value="">
								<input
								type="hidden" id="collegeuId" name="collegeuId" value="">
						</div>
						<div class="col-md-6">
							<label for="uRealname" class="control-label">真实姓名</label> <input
								type="text" class="form-control" id="coluRealname" name="coluRealname"
								value="">
						    <input
								type="hidden" id="cololduRealname" name="cololduRealname" value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="email" class="control-label">Email</label> <input
								type="email" class="form-control" id="colemail" name="colemail"
								value="">
								<input
								type="hidden" id="cololdemail" name="cololdemail"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="uCode" class="control-label">工号</label> <input
								type="text" class="form-control" id="coluCode" name="coluCode"
								value="">
							<input
								type="hidden" id="cololduCode" name="cololduCode"
								value="">
						</div>
					</div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="coltel" name="coltel" value="" placeholder="">
			            <input type="hidden" id="cololdtel" name="cololdtel" value="">
			          </div>
			        </div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="sex" class="control-label">性别</label> <input
								type="hidden" id="cololdsex" name="cololdsex" value=""> <select
								id="colsex" class="colsexselector form-control">
								<option value="-1">请选择性别</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editcollege()">修改</button>
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
//编辑学院管理员信息
function editcollege() {
	var uId = $('#collegeuId').val();
	if(uId==0){
		uId='';
	}
	
	var uName = $('#coluName').val();
	var uRealname = $('#coluRealname').val();
	var email = $('#colemail').val();
	var uCode = $('#coluCode').val();
	var tel = $('#coltel').val();
	var sex = $("#colsex option:selected").val();

	var datainfo = 'type=1';
	if(uName==''||uRealname==''){
  		alert('用户名、真实姓名、学院不能为空');
        return false;
	}
	var userpattern = /^\w{3,}$/;  //用户名格式正则表达式：用户名要至少三位
	if(!userpattern.test(uName)){
  		alert('用户名至少三位');
        return false;
	}
	if(sex==-1){
		alert('请选择性别');
        return false;
	}
	if(tel!=''){
		var mobile = /^1[3|4|5|6|7|8|9]\d{9}$/;
		var phone  = /^0\d{2,3}-?\d{7,8}$/;
		if (mobile.test(tel) || phone.test(tel)) {
		} else {
			alert('手机或电话格式不正确!如：13000000000/023|0880-2333333');
			return false;
		}
	}
	if(uId==''){//新增
		datainfo += '&uName='+uName+'&uRealname='+uRealname
		+'&sex='+sex+'&tel='+tel;
		if(email!=''){
			var re = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
		  	if (!re.test(email)){
		  		alert('邮箱格式错误');
		        return false;
		    }
		}
	    datainfo += '&email='+email;
	    if(uCode!=''){
	    	datainfo += '&uCode='+uCode;
	    }
		manageredituser(datainfo);
	}else{//编辑
		var olduRealname = $('#cololduRealname').val();
		var olduName = $('#cololduName').val();
		var oldemail = $('#cololdemail').val();
		var olduCode = $('#cololduCode').val();
		var oldtel = $('#cololdtel').val();
		var oldsex = $('#cololdsex').val();
		
		if(olduRealname==uRealname && olduName==uName && oldemail==email && oldsex == sex
				&& olduCode==uCode && oldtel==tel){
	  		alert('信息未修改');
	        return false;
		}
		if(olduName!=uName){
			datainfo += '&uName='+uName;
		}
		if(olduCode!=uCode){
			datainfo += '&uCode='+uCode;
		}
		if(oldemail!=email){
			datainfo += '&email='+email;
		}
		datainfo += '&uId='+uId+'&uRealname='+uRealname+'&sex='+sex+'&tel='+tel;
		manageredituser(datainfo);
	}
}
function manageredituser(datainfo) {
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/manageredituser',
        //数据格式是key/value
        data:datainfo,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		document.location.reload();
            		return true;
        		}else if(data==-1){
        			alert('参数错误');
        		}else if(data==-2){
        			alert('邮箱已存在');
        		}else if(data==-3){
        			alert('用户名已存在');
        		}else if(data==-4){
        			alert('学号或工号已存在');
        		}else{
        			alert('操作失败');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        }
    });
}

//学院管理员列表
function collegelist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/listuser',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10'+'&type=1',
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="getcollegeGoalPage('+data.firstPage+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="getcollegeGoalPage('+data.firstPage+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="getcollegeGoalPage('+item+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="getcollegeGoalPage('+item+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="getcollegeGoalPage('+data.lastPage+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="getcollegeGoalPage('+data.lastPage+')">»</a></li>';
				}
				
				$('#j_collegepage').empty();
				$('#j_collegepage').append(pages);
				$('#j_collegelist').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">用户名</th>'
				+'<th class="table-title">姓名</th>'
				+'<th class="table-title">工号</th>'
				+'<th class="table-title">联系方式</th>'
				+'<th class="table-title">E-mail</th>'
				+'<th class="table-author">激活状态</th>'
                +'<th class="table-set">操作</th>';
                
				//内容
				$(data.list).each(function(index,item){
					//激活状态
	                var status = '';
	                if(item.status==0){
	                	status = '未激活';
	                }else{
	                	status = '已激活';
	                }
					
					project +='<tbody><tr><td>'+item.uName+'</td>'
                    +'<td>'+item.uRealname+'</td>'
                    +'<td>'+item.uCode+'</td>'
                    +'<td>'+item.tel+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+status+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" '
                    +'data-target="#editcollege" onclick="putcollegeuid('+item.uId+')">编辑</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    +'onclick="deleteuser('+item.uId+')"> 删除</button>';
                    
                    if(item.status==0){//未激活
                        project += '<button type="button" class="am-btn am-btn-default am-btn-xs" '
                            +'onclick="activate('+item.uId+')">激活</button>';
                    }
                    
                    project +='</div></div></td>'
                    +'</tr></tbody>';
				});
				$('#j_collegelist').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">用户名</th>'
					+'<th class="table-title">姓名</th>'
					+'<th class="table-title">工号</th>'
					+'<th class="table-title">联系方式</th>'
					+'<th class="table-title">E-mail</th>'
					+'<th class="table-author">激活状态</th>'
	                +'<th class="table-set">操作</th>';
				$('#j_collegelist').append(project);
			}
        }
    }); 
}
//学院管理员列表翻页
function getcollegeGoalPage(page) {
	collegelist(page);
}
//激活
function activate(uId){
	if(uId==''){
		alert('错误');
		return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/activateuser',
        //数据格式是key/value
        data:'uId='+uId,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		document.location.reload();
            		return true;
        		}else if(data==-1){
            		alert('参数错误');
            		return true;
        		}else{
        			alert('操作失败');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        }
    }); 
}
//删除账号
function deleteuser(uId){
	if(uId==''){
		alert('错误');
		return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/deleteuser',
        //数据格式是key/value
        data:'uId='+uId,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		document.location.reload();
            		return true;
        		}else if(data==-1){
            		alert('参数错误');
        		}else if(data==-2){
            		alert('存在项目关联暂无法删除');
        		}else{
        			alert('操作失败');
        		}
			}
        },
        error:function()
        {
            alert('请求出错');
        }
    }); 
}
//学院
function putcollegeuid(id) {
	$('#collegeuId').val(id);
}
$(function(){
	//功能列表
	$('#j_usermenu').addClass("active");
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");

	collegelist(1);
	
	//学院编辑框
	$('#editcollege').on('show.bs.modal', function () {
		var uId = $('#collegeuId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/user/userinfo',
	        //数据格式是key/value
	        data:'uId='+uId,
	        success:function(data){
				if(data!=null&&data!=''){//编辑时
					$('#coluName').val(data.uName);
					$('#cololduName').val(data.uName);
					
					$('#coluRealname').val(data.uRealname);
					$('#cololduRealname').val(data.uRealname);
					
					$('#colemail').val(data.email);
					$('#cololdemail').val(data.email);
					
					$('#coluCode').val(data.uCode);
					$('#cololduCode').val(data.uCode);
					
					$('#coltel').val(data.tel);
					$('#cololdtel').val(data.tel);
					
					$('#colcollege').val(data.college);
					$('#cololdcollege').val(data.college);
					
					$('#cololdsex').val(data.gender);
					
	        		if(data.gender==0){
	        			$('.colsexselector').val("0");
	        		}else if(data.gender==1){
	        			$('.colsexselector').val("1");
	        		}else{
	        			$('.colsexselector').val("-1");
	        		}
				}else{//新增时
					$('#coluName').val('');
					$('#cololduName').val('');
					
					$('#coluRealname').val('');
					$('#cololduRealname').val('');
					
					$('#colemail').val('');
					$('#cololdemail').val('');
					
					$('#coluCode').val('');
					$('#cololduCode').val('');
					
					$('#colnote').val('');
					$('#cololdnote').val('');
					
					$('#coltel').val('');
					$('#cololdtel').val('');
					
					$('#colcollege').val('');
					$('#cololdcollege').val('');
					
					$('#cololdsex').val('-1');
	        		$('.colsexselector').val("-1");
				}
			}
		});
	})
	
});
</script>
</html>