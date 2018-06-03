<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="com.plm.model.*"%>
<script type="text/javascript">
function reset() {
	window.location.href='${pageContext.request.contextPath}/user/reset';
}
function edituserinfo() {
	var uName = $('#uName').val();
	var email = $('#email').val();
	var tel = $('#tel').val();
	var newuName = $('#newuName').val();
	var newemail = $('#newemail').val();
	var newtel = $('#newtel').val();
	if(uName==''||email==''||tel==''){
        alert('信息不完整');
        return false;
	}
	
	if(uName==newuName && email==newemail && tel==newtel){
        alert('信息未修改');
        return false;
	}
	var userpattern = /^\w{3,}$/;  //用户名格式正则表达式：用户名要至少三位
	if(!userpattern.test(uName)){
  		alert('用户名至少三位');
        return false;
	}
	var re = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
  	if (!re.test(email)){
  		alert('邮箱格式错误');
        return false;
    }
	var mobile = /^1[3|4|5|6|7|8|9]\d{9}$/;
	var phone  = /^0\d{2,3}-?\d{7,8}$/;
	if (!mobile.test(tel) && !phone.test(tel)) {
		alert('手机或电话格式不正确!如：13000000000/023|0880-2333333');
		return false;
	}
	//异步请求
	$.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/user/edituser',
        //数据格式是key/value
        data:'uName='+uName+'&email='+email+'&tel='+tel,
        success:function(data){//返回json结果
        	if(data!=null){
        		if(data==1){
            		alert('操作成功');
            		return true;
        		}else if(data==2){
        			alert('邮箱已存在');
        		}else if(data==3){
        			alert('用户名已存在');
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
</script>
<div class="tpl-left-nav tpl-left-nav-hover">
	<div class="tpl-left-nav-title">学生功能列表</div>
	<div class="tpl-left-nav-list">
		<ul class="tpl-left-nav-menu">
			<li class="tpl-left-nav-item"><a
				href="${pageContext.request.contextPath}/"
				class="nav-link tpl-left-nav-link-list"> <i class="am-icon-home"></i>
					<span>首页</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				href="${pageContext.request.contextPath}/user/loginCheck"
				class="nav-link tpl-left-nav-link-list" id="j_center"> 
				<i class="fa fa-spinner" aria-hidden="true"></i><span>个人中心</span>
			</a></li>
			<li class="tpl-left-nav-item"><a id="j_menu" href="javascript:;"
				class="nav-link tpl-left-nav-link-list"> <i
					class="am-icon-wpforms"></i> <span>项目信息管理</span> <i
					class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
			</a>
				<ul id="j_submenu" class="tpl-left-nav-sub-menu">
					<li><a id="j_start" href="${pageContext.request.contextPath}/projectinfo/startlist"> <i
							class="am-icon-angle-right"></i> <span>项目立项</span>
					</a> <a id="j_mid" href="${pageContext.request.contextPath}/projectinfo/midlist"> 
					<i class="am-icon-angle-right"></i> <span>项目中期</span>
					</a> <a id="j_week" href="${pageContext.request.contextPath}/projectinfo/userprojectlist"> <i class="am-icon-angle-right"></i> <span>项目周报</span>
					</a> <a id="j_end" href="${pageContext.request.contextPath}/projectinfo/endlist"> <i class="am-icon-angle-right"></i> <span>项目验收</span>
					</a> <a id="j_fund" href="${pageContext.request.contextPath}/projectinfo/fundslist"> <i class="am-icon-angle-right"></i> <span>项目预算</span>
					</a> <a id="j_other" href="${pageContext.request.contextPath}/projectinfo/otherlist"> <i class="am-icon-angle-right"></i>
							<span>其他申请</span>
					</a></li>
				</ul></li>
		</ul>
	</div>
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
								placeholder="" value="${user.uName}">
								<input
								type="hidden" id="newuName" name="newuName"
								value="${user.uName}">
						</div>
						<div class="col-md-6">
							<label for="uRealname" class="control-label">真实姓名</label> <input
								type="text" class="form-control" id="uRealname" name="uRealname"
								value="${user.uRealname}" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="email" class="control-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="${user.email}">
								<input
								type="hidden" id="newemail" name="newemail"
								value="${user.email}">
						</div>
						<div class="col-md-6">
						    
							<label for="sex" class="control-label">性别</label>
							<c:if test="${user!=null&&user.gender==0}">
							<input type="text" class="form-control" id="sex" name="sex"
								value="男" disabled="disabled">
						    </c:if>
						    <c:if test="${user!=null&&user.gender==1}">
							<input type="text" class="form-control" id="sex" name="sex"
								value="女" disabled="disabled">
						    </c:if>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label for="uCode" class="control-label">学号</label> <input
								type="text" class="form-control" id="uCode" name="uCode"
								value="${user.uCode}" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
			          <div class="col-md-6">
			          <c:if test="${user!=null&&user.role==5}">
			            <label for="note" class="control-label">入校时间</label>
			            <input type="text" class="form-control" id="note" name="note" 
			                value="<fmt:formatDate value='${user.admissionDate }' pattern='yyyy-MM-dd'/>" placeholder="格式：2018-09-01" disabled="disabled">
			           </c:if>
			           <c:if test="${user!=null&&user.role==4||user.role==3}">
			            <label for="note" class="control-label">职称</label>
			            <input type="text" class="form-control" id="note" name="note" 
			                value="${user.jobTitle}" placeholder="" disabled="disabled">
			           </c:if>
			          </div>
			          <div class="col-md-6">
			            <label for="tel" class="control-label">联系方式</label>
			            <input type="text" class="form-control" id="tel" name="tel" value="${user.tel}" placeholder="">
			            <input type="hidden" id="newtel" name="newtel" value="${user.tel}">
			          </div>
			        </div>
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="college" class="control-label">学院</label>
			            <input type="text" class="form-control" id="college"  name="college"
			              value="${user.college}" placeholder="" disabled="disabled">
			          </div>
			          <div class="col-md-6">
			            <label for="major" class="control-label">专业</label>
			            <input type="text" class="form-control" id="major" name="major"
			            value="${user.major}" placeholder="" disabled="disabled">
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