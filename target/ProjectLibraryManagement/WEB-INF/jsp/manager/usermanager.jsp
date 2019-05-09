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

    <%@include file='../manager/indexmenu.jsp' %>

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
                                        <button type="button" class="am-btn am-btn-default am-btn-success" data-toggle="modal" data-target="#editstudent" onclick="putstudentuid(0)">新增学生</button>
                                        <button type="button" class="am-btn am-btn-default am-btn-secondary" data-toggle="modal" data-target="#edittutor" onclick="puttutorexpert(0,4)">新增导师</button>
                                        <c:if test="${user.role eq '1'}">
                                        <button type="button" class="am-btn am-btn-default am-btn-warning" data-toggle="modal" data-target="#edittutor" onclick="puttutorexpert(0,3)">新增专家</button>
                                        <button type="button" class="am-btn am-btn-default am-btn-danger" data-toggle="modal" data-target="#editcollege" onclick="putcollegeuid(0)">新增学院或系管理员</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="am-g">
                            <div class="am-u-sm-12">
                                <div class="am-tabs tpl-index-tabs" data-am-tabs>
                                    <ul class="am-tabs-nav am-nav am-nav-tabs">
                                        <li class="am-active"><a href="#tab1">学生</a></li>
                                        <li><a href="#tab2">导师</a></li>
                                        <c:if test="${user.role eq '1'}">
                                        <li><a href="#tab3">专家</a></li>
                                        <li><a href="#tab4">学院或系管理员</a></li>
                                        </c:if>
                                    </ul>
                                    <div class="am-tabs-bd">
                                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                            <div class="am-u-sm-12">
                                                <form class="am-form">
                                                    <table id='j_studentlist' class="am-table am-table-striped am-table-hover table-main">
                                                        
                                                    </table>
                                                    <div class="am-cf">

                                                        <div class="am-fr">
                                                            <ul id="j_studentpage" class="am-pagination tpl-pagination"></ul>
                                                        </div>
                                                    </div>
                                                    <hr>

                                                </form>
                                            </div>
                                        </div>
                                        <div class="am-tab-panel am-fade" id="tab2">
                                            <div class="am-u-sm-12">
                                                <form class="am-form">
                                                    <table id='j_tutorlist' class="am-table am-table-striped am-table-hover table-main">
                                                        
                                                    </table>
                                                    <div class="am-cf">

                                                        <div class="am-fr">
                                                            <ul id="j_tutorpage" class="am-pagination tpl-pagination"></ul>
                                                        </div>
                                                    </div>
                                                    <hr>

                                                </form>
                                            </div>
                                        </div>
                                        <div class="am-tab-panel am-fade" id="tab3">
                                            <div class="am-u-sm-12">
                                                <form class="am-form">
                                                    <table id='j_expertlist' class="am-table am-table-striped am-table-hover table-main">
                                                        
                                                    </table>
                                                    <div class="am-cf">

                                                        <div class="am-fr">
                                                            <ul id="j_expertpage" class="am-pagination tpl-pagination"></ul>
                                                        </div>
                                                    </div>
                                                    <hr>

                                                </form>
                                            </div>
                                        </div>
                                        <div class="am-tab-panel am-fade" id="tab4">
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
    
    <!-- 学生个人资料（Modal） -->
	<div class="modal fade" id="editstudent" tabindex="-1" role="dialog"
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
								type="text" class="form-control" id="stuuName" name="stuuName"
								placeholder="" value="">
								<input
								type="hidden" id="stuolduName" name="stuolduName"
								value="">
								<input
								type="hidden" id="studentuId" name="studentuId"
								value="">
						</div>
						<div class="col-md-6">
							<label for="uRealname" class="control-label">真实姓名</label> <input
								type="text" class="form-control" id="stuuRealname" name="stuuRealname"
								value=""> 
								<input type="hidden" id="stuolduRealname" name="stuolduRealname" value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="email" class="control-label">Email</label> <input
								type="email" class="form-control" id="stuemail" name="stuemail"
								value="">
								<input
								type="hidden" id="stuoldemail" name="stuoldemail"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="uCode" class="control-label">学号</label> <input
								type="text" class="form-control" id="stuuCode" name="stuuCode"
								value="">
							<input type="hidden" id="stuolduCode" name="stuolduCode"
								value="">
						</div>
					</div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="note" class="control-label">入校时间</label>
			            <input type="text" class="form-control" id="stunote" name="stunote" 
			                value="" placeholder="格式：2018-09-01">
			            <input type="hidden" id="stuoldnote" name="stuoldnote"
							value="">
			          </div>
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="stutel" name="stutel" value="" placeholder="">
			            <input type="hidden" id="stuoldtel" name="stuoldtel" value="">
			          </div>
			        </div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="stucollege"  name="stucollege"
			              value="" placeholder="">
			            <input type="hidden" id="stuoldcollege" name="stuoldcollege" value="">
			          </div>
			          <div class="col-md-6">
			            <label for="major" class="control-label">专业</label>
			            <input type="text" class="form-control" id="stumajor" name="stumajor"
			            value="" placeholder="">
			            <input type="hidden" id="stuoldmajor" name="stuoldmajor" value="">
			          </div>
						<div class="form-group">
							<div class="col-md-6">
								<label for="sex" class="control-label">性别</label> <input
									type="hidden" id="stuoldsex" name="stuoldsex" value=""> <select
									id="stusex" class="stusexselector form-control">
									<option value="-1">请选择性别</option>
									<option value="0">男</option>
									<option value="1">女</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="editstudent()">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 导师/专家个人资料（Modal） -->
	<div class="modal fade" id="edittutor" tabindex="-1" role="dialog"
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
								type="text" class="form-control" id="tuuName" name="tuuName"
								placeholder="" value="">
								<input
								type="hidden" id="tuolduName" name="tuolduName"
								value="">
								<input
								type="hidden" id="tutoruId" name="tutoruId"
								value="">
								<input
								type="hidden" id="tutype" name="tutype"
								value="">
						</div>
						<div class="col-md-6">
							<label for="uRealname" class="control-label">真实姓名</label> <input
								type="text" class="form-control" id="tuuRealname" name="tuuRealname"
								value="">
						    	<input
								type="hidden" id="tuolduRealname" name="tuolduRealname"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="email" class="control-label">Email</label> <input
								type="email" class="form-control" id="tuemail" name="tuemail"
								value="">
								<input
								type="hidden" id="tuoldemail" name="tuoldemail"
								value="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="uCode" class="control-label">工号</label> <input
								type="text" class="form-control" id="tuuCode" name="tuuCode"
								value="">
							<input type="hidden" id="tuolduCode" name="tuolduCode"
								value="">
						</div>
					</div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="note" class="control-label">职称</label>
			            <input type="text" class="form-control" id="tunote" name="tunote" 
			                value="" placeholder="">
			                <input type="hidden" id="tuoldnote" name="tuoldnote" value="">
			          </div>
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="tutel" name="tutel" value="" placeholder="">
			            <input type="hidden" id="tuoldtel" name="tuoldtel" value="">
			          </div>
			        </div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="tucollege"  name="tucollege"
			              value="" placeholder="">
			            <input type="hidden" id="tuoldcollege" name="tuoldcollege" value="">
			          </div>
			          <div class="col-md-6">
			            <label for="major" class="control-label">专业</label>
			            <input type="text" class="form-control" id="tumajor" name="tumajor"
			            value="" placeholder="">
			            <input type="hidden" id="tuoldmajor" name="tuoldmajor" value="">
			          </div>
			        </div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="sex" class="control-label">性别</label> <input
								type="hidden" id="tuoldsex" name="tuoldsex" value=""> <select
								id="tusex" class="tusexselector form-control">
								<option value="-1">请选择性别</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <button type="submit" class="btn btn-info" onclick="edittutor()">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="colcollege"  name="colcollege"
			              value="" placeholder="">
			            <input type="hidden" id="cololdcollege" name="cololdcollege" value="">
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
	var college = $('#colcollege').val();
	var sex = $("#colsex option:selected").val();

	var datainfo = 'type=2';
	if(uName==''||uRealname==''||college==''){
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
		datainfo += '&uName='+uName+'&uRealname='+uRealname+'&college='+college
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
		var oldcollege = $('#cololdcollege').val();
		var oldsex = $('#cololdsex').val();
		if(olduRealname==uRealname && olduName==uName && oldemail==email && oldsex == sex
				&& olduCode==uCode && oldtel==tel && oldcollege==college){
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
		datainfo += '&uId='+uId+'&uRealname='+uRealname+'&sex='+sex+'&tel='+tel+'&college='+college;
		manageredituser(datainfo);
	}
}
//编辑导师、专家信息
function edittutor() {
	var uId = $('#tutoruId').val();
	if(uId==0){
		uId='';
	}
	var role = $('#tutype').val();
	
	var uName = $('#tuuName').val();
	var uRealname = $('#tuuRealname').val();
	var email = $('#tuemail').val();
	var uCode = $('#tuuCode').val();
	var tel = $('#tutel').val();
	var college = $('#tucollege').val();
	var sex = $("#tusex option:selected").val();
	var jobTitle = $('#tunote').val();
	
	var datainfo = 'type='+role;
	if(uName==''||uRealname==''){
  		alert('用户名、真实姓名不能为空');
        return false;
	}
	if(uCode==''&&college==''){
  		alert('学院或工号不能同时为空');
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
		datainfo += '&uName='+uName+'&uRealname='+uRealname+'&college='+college+'&tel='+tel
		+'&sex='+sex+'&jobTitle='+jobTitle;
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
		var olduRealname = $('#tuolduRealname').val();
		var olduName = $('#tuolduName').val();
		var oldemail = $('#tuoldemail').val();
		var olduCode = $('#tuolduCode').val();
		var oldtel = $('#tuoldtel').val();
		var oldcollege = $('#tuoldcollege').val();
		var oldsex = $('#tuoldsex').val();
		var oldjobTitle =$('#tuoldnote').val();
		
		if(olduRealname==uRealname && olduName==uName && oldemail==email && oldsex == sex
				&& olduCode==uCode && oldtel==tel && oldcollege==college){
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
		datainfo += '&uId='+uId+'&uRealname='+uRealname+'&sex='+sex+'&tel='+tel
		+'&college='+college+'&jobTitle='+jobTitle;
		manageredituser(datainfo);
	}
}
//编辑学生信息
function editstudent() {
	var uId = $('#studentuId').val();
	if(uId==0){
		uId='';
	}
	var uName = $('#stuuName').val();
	var uRealname = $('#stuuRealname').val();
	var email = $('#stuemail').val();
	var uCode = $('#stuuCode').val();
	var admissionDate = $('#stunote').val();
	var tel = $('#stutel').val();
	var college = $('#stucollege').val();
	var major = $('#stumajor').val();
	var sex = $("#stusex option:selected").val();
	
	var datainfo = 'type=5';
	if(uName==''||uRealname==''||uCode==''||college==''){
  		alert('用户名、真实姓名、学院、学号不能为空');
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
	if(admissionDate!=''){
		var a = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/
			if (!a.test(admissionDate)) {
				alert('日期格式不正确!如：2018-08-08');
				return false;
			}
	}
	if(tel!=''){
		var mobile = /^1[3|4|5|6|7|8|9]\d{9}$/;
		var phone  = /^0\d{2,3}-?\d{7,8}$/;
		if (mobile.test(tel) || phone.test(tel)) {
			flag = true;
		} else {
			alert('手机或电话格式不正确!如：13000000000/023|0880-2333333');
			return false;
		}
	}
	
	if(uId==''){//新增
		datainfo += '&uName='+uName+'&uRealname='+uRealname+'&college='+college+'&tel='+tel
		+'&sex='+sex+'&admissionDate='+admissionDate+'&major='+major;
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
		var olduRealname = $('#stuolduRealname').val();
		var olduName = $('#stuolduName').val();
		var oldemail = $('#stuoldemail').val();
		var olduCode = $('#stuolduCode').val();
		var oldadmissionDate = $('#stuoldnote').val();
		var oldtel = $('#stuoldtel').val();
		var oldcollege = $('#stuoldcollege').val();
		var oldmajor = $('#stuoldmajor').val();
		var oldsex = $('#stuoldsex').val();
		
		if(olduRealname==uRealname && olduName==uName && oldemail==email && oldsex == sex
				&& olduCode==uCode && oldtel==tel && oldcollege==college){
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
		datainfo += '&uId='+uId+'&uRealname='+uRealname+'&sex='+sex+'&tel='+tel
		+'&college='+college+'&admissionDate='+admissionDate+'&major='+major;
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

//学生列表
function studentlist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/listuser',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10'+'&type=5',
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="getstudentGoalPage('+data.firstPage+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="getstudentGoalPage('+data.firstPage+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="getstudentGoalPage('+item+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="getstudentGoalPage('+item+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="getstudentGoalPage('+data.lastPage+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="getstudentGoalPage('+data.lastPage+')">»</a></li>';
				}
				
				$('#j_studentpage').empty();
				$('#j_studentpage').append(pages);
				$('#j_studentlist').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">用户名</th>'
				+'<th class="table-title">姓名</th>'
				+'<th class="table-title">学院</th>'
				+'<th class="table-title">学号</th>'
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
                    +'<td>'+item.college+'</td>'
                    +'<td>'+item.uCode+'</td>'
                    +'<td>'+item.tel+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+status+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" '
                    +'data-target="#editstudent" onclick="putstudentuid('+item.uId+')">编辑</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    +'onclick="deleteuser('+item.uId+')"> 删除</button>';
                    
                    if(item.status==0){//未激活
                        project += '<button type="button" class="am-btn am-btn-default am-btn-xs" '
                            +'onclick="activate('+item.uId+')">激活</button>';
                    }
                    
                    project +='</div></div></td>'
                    +'</tr></tbody>';
				});
				$('#j_studentlist').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">用户名</th>'
					+'<th class="table-title">姓名</th>'
					+'<th class="table-title">学院</th>'
					+'<th class="table-title">学号</th>'
					+'<th class="table-title">联系方式</th>'
					+'<th class="table-title">E-mail</th>'
					+'<th class="table-author">激活状态</th>'
	                +'<th class="table-set">操作</th>';
				$('#j_studentlist').append(project);
			}
        }
    }); 
}
//学生列表翻页
function getstudentGoalPage(page) {
	studentlist(page);
}

//教师列表
function tutorlist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/listuser',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10'+'&type=4',
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="gettutorGoalPage('+data.firstPage+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="gettutorGoalPage('+data.firstPage+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="gettutorGoalPage('+item+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="gettutorGoalPage('+item+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="gettutorGoalPage('+data.lastPage+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="gettutorGoalPage('+data.lastPage+')">»</a></li>';
				}
				
				$('#j_tutorpage').empty();
				$('#j_tutorpage').append(pages);
				$('#j_tutorlist').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">用户名</th>'
				+'<th class="table-title">姓名</th>'
				+'<th class="table-title">学院</th>'
				+'<th class="table-title">教师号</th>'
				+'<th class="table-title">职称</th>'
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
                    +'<td>'+item.college+'</td>'
                    +'<td>'+item.uCode+'</td>'
                    +'<td>'+item.jobTitle+'</td>'
                    +'<td>'+item.tel+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+status+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" '
                    +'data-target="#edittutor" onclick="puttutorexpert('+item.uId+',4)">编辑</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    +'onclick="deleteuser('+item.uId+')"> 删除</button>';
                    
                    if(item.status==0){//未激活
                        project += '<button type="button" class="am-btn am-btn-default am-btn-xs" '
                            +'onclick="activate('+item.uId+')">激活</button>';
                    }
                    
                    project +='</div></div></td>'
                    +'</tr></tbody>';
				});
				$('#j_tutorlist').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">用户名</th>'
					+'<th class="table-title">姓名</th>'
					+'<th class="table-title">学院</th>'
					+'<th class="table-title">教师号</th>'
					+'<th class="table-title">职称</th>'
					+'<th class="table-title">联系方式</th>'
					+'<th class="table-title">E-mail</th>'
					+'<th class="table-author">激活状态</th>'
	                +'<th class="table-set">操作</th>';
				$('#j_tutorlist').append(project);
			}
        }
    }); 
}
//教师列表翻页
function gettutorGoalPage(page) {
	tutorlist(page);
}

//专家列表
function expertlist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/listuser',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10'+'&type=3',
        success:function(data){//返回json结果
        	if(data!=null){
        		//页码
        		var pages ='';
        		if(data.firstPage!=data.pageNum){
        			pages ='<li><a href="#" onclick="gettutorGoalPage('+data.firstPage+')">«</a></li>';
        		}else{
        			pages ='<li class="am-disabled"><a href="#" onclick="gettutorGoalPage('+data.firstPage+')">«</a></li>';
        		}
        		
				$(data.navigatepageNums).each(function(index,item){
					if(item==data.pageNum){
						pages+='<li class="am-active"><a href="#" onclick="gettutorGoalPage('+item+')">'+item+'</a></li>';
					}else{
						pages+='<li><a href="#" onclick="gettutorGoalPage('+item+')">'+item+'</a></li>';
					}
				});
				if(data.lastPage!=data.pageNum){
					pages += '<li><a href="#" onclick="gettutorGoalPage('+data.lastPage+')">»</a></li>';
				}else{
					pages += '<li class="am-disabled"><a href="#" onclick="gettutorGoalPage('+data.lastPage+')">»</a></li>';
				}
				
				$('#j_expertpage').empty();
				$('#j_expertpage').append(pages);
				$('#j_expertlist').empty();
				var project = '<thead><tr>'
				+'<th class="table-id">用户名</th>'
				+'<th class="table-title">姓名</th>'
				+'<th class="table-title">学院</th>'
				+'<th class="table-title">教师号</th>'
				+'<th class="table-title">职称</th>'
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
                    +'<td>'+item.college+'</td>'
                    +'<td>'+item.uCode+'</td>'
                    +'<td>'+item.jobTitle+'</td>'
                    +'<td>'+item.tel+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+status+'</td>'
                    +'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs">'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs" data-toggle="modal" '
                    +'data-target="#edittutor" onclick="puttutorexpert('+item.uId+',3)">编辑</button>'
                    +'<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" '
                    +'onclick="deleteuser('+item.uId+')"> 删除</button>';
                    
                    if(item.status==0){//未激活
                        project += '<button type="button" class="am-btn am-btn-default am-btn-xs" '
                            +'onclick="activate('+item.uId+')">激活</button>';
                    }
                    
                    project +='</div></div></td>'
                    +'</tr></tbody>';
				});
				$('#j_expertlist').append(project);
			}else{
				var project = '<thead><tr>'
					+'<th class="table-id">用户名</th>'
					+'<th class="table-title">姓名</th>'
					+'<th class="table-title">学院</th>'
					+'<th class="table-title">教师号</th>'
					+'<th class="table-title">职称</th>'
					+'<th class="table-title">联系方式</th>'
					+'<th class="table-title">E-mail</th>'
					+'<th class="table-author">激活状态</th>'
	                +'<th class="table-set">操作</th>';
				$('#j_expertlist').append(project);
			}
        }
    }); 
}
//专家列表翻页
function getexpertGoalPage(page) {
	expertlist(page);
}
//学院管理员列表
function collegelist(index) {
	var page = index;
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/listuser',
        //数据格式是key/value
        data:'page='+page+'&pageSize=10'+'&type=2',
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
				+'<th class="table-title">学院</th>'
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
                    +'<td>'+item.college+'</td>'
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
					+'<th class="table-title">学院</th>'
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

//学生
function putstudentuid(id) {
	$('#studentuId').val(id);
}
//教师、专家
function puttutoruid(id) {
	$('#tutoruId').val(id);
}
//区分专家与教师
function puttutorexpert(id,type) {
	puttutoruid(id);
	$('#tutype').val(type);
	//"3"评审、"4"教师
}
//学院
function putcollegeuid(id) {
	$('#collegeuId').val(id);
}
$(function(){
	//功能列表
	$('#j_menu2').removeClass("nav-link tpl-left-nav-link-list");
	$('#j_menu2').addClass("nav-link active");
	$('#j_usermenu').addClass("active");
	$('#j_submenu2').css('display','block');
	$('#j_center').removeClass("nav-link active");
	$('#j_center').addClass("nav-link tpl-left-nav-link-list");
	//初始化学生页面
	studentlist(1);
	//初始化教师页面
	tutorlist(1);
	//限定页面
	var role = "${user.role}";
	if(role==1){//学校教务管理员
		//初始化评审专家页面
		expertlist(1);
		//初始化院系管理员页面
		collegelist(1);
	}
	
	//学生编辑框
	$('#editstudent').on('show.bs.modal', function () {
		var uId = $('#studentuId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/user/userinfo',
	        //数据格式是key/value
	        data:'uId='+uId,
	        success:function(data){
				if(data!=null&&data!=''){//编辑时
					$('#stuuName').val(data.uName);
					$('#stuolduName').val(data.uName);
					
					$('#stuuRealname').val(data.uRealname);
					$('#stuolduRealname').val(data.uRealname);
					
					$('#stuemail').val(data.email);
					$('#stuoldemail').val(data.email);
					
					$('#stuuCode').val(data.uCode);
					$('#stuolduCode').val(data.uCode);
					
					$('#stunote').val(moment(data.admissionDate).format('YYYY-MM-DD'));
					$('#stuoldnote').val(moment(data.admissionDate).format('YYYY-MM-DD'));
					
					$('#stutel').val(data.tel);
					$('#stuoldtel').val(data.tel);
					
					$('#stucollege').val(data.college);
					$('#stuoldcollege').val(data.college);
					
					$('#stumajor').val(data.major);
					$('#stuoldmajor').val(data.major);
					
					$('#stuoldsex').val(data.gender);
					
	        		if(data.gender==0){
	        			$('.stusexselector').val("0");
	        		}else if(data.gender==1){
	        			$('.stusexselector').val("1");
	        		}else{
	        			$('.stusexselector').val("-1");
	        		}
				}else{//新增时
					$('#stuuName').val('');
					$('#stuolduName').val('');
					
					$('#stuuRealname').val('');
					$('#stuolduRealname').val('');
					
					$('#stuemail').val('');
					$('#stuoldemail').val('');
					
					$('#stuuCode').val('');
					$('#stuolduCode').val('');
					
					$('#stunote').val('');
					$('#stuoldnote').val('');
					
					$('#stutel').val('');
					$('#stuoldtel').val('');
					
					$('#stucollege').val('');
					$('#stuoldcollege').val('');
					
					$('#stumajor').val('');
					$('#stuoldmajor').val('');
					
					$('#stuoldsex').val('-1');
	        		$('.stusexselector').val("-1");
				}
			}
		});
	})
	
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
	
	//导师、评审编辑框
	$('#edittutor').on('show.bs.modal', function () {
		var uId = $('#tutoruId').val();
		$.ajax({
	        type:'post',
	        url:'${pageContext.request.contextPath}/user/userinfo',
	        //数据格式是key/value
	        data:'uId='+uId,
	        success:function(data){
				if(data!=null&&data!=''){//编辑时
					$('#tuuName').val(data.uName);
					$('#tuolduName').val(data.uName);
					
					$('#tuuRealname').val(data.uRealname);
					$('#tuolduRealname').val(data.uRealname);
					
					$('#tuemail').val(data.email);
					$('#tuoldemail').val(data.email);
					
					$('#tuuCode').val(data.uCode);
					$('#tuolduCode').val(data.uCode);
					
					$('#tutel').val(data.tel);
					$('#tuoldtel').val(data.tel);
					
					$('#tunote').val(data.jobTitle);
					$('#tuoldnote').val(data.jobTitle);
					
					$('#tucollege').val(data.college);
					$('#tuoldcollege').val(data.college);
					
					$('#tumajor').val(data.major);
					$('#tuoldmajor').val(data.major);
					
					$('#tuoldsex').val(data.gender);
	        		if(data.gender==0){
	        			$('.tusexselector').val("0");
	        		}else if(data.gender==1){
	        			$('.tusexselector').val("1");
	        		}else{
	        			$('.tusexselector').val("-1");
	        		}
				}else{//新增时
					$('#tuuName').val('');
					$('#tuolduName').val('');
					
					$('#tuuRealname').val('');
					$('#tuolduRealname').val('');
					
					$('#tuemail').val('');
					$('#tuoldemail').val('');
					
					$('#tuuCode').val('');
					$('#tuolduCode').val('');
					
					$('#tunote').val('');
					$('#tuoldnote').val('');
					
					$('#tutel').val('');
					$('#tuoldtel').val('');
					
					$('#tucollege').val('');
					$('#tuoldcollege').val('');
					
					$('#tumajor').val('');
					$('#tuoldmajor').val('');
					
					$('#tuoldsex').val('-1');
	        		$('.tusexselector').val("-1");
				}
			}
		});
	})
});
</script>
</html>