<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- header -->
    <header class="am-topbar am-topbar-inverse">
        <div class="am-topbar-brand">
        	<span class="title">大学生创新创业训练项目库管理系统</span>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}">
            <span class="am-sr-only">导航切换</span>
            <span class="am-icon-bars"></span>
        </button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a href="###" class="tpl-header-list-link">
                        <span class="fa fa-bell-o" aria-hidden="true">消息</span>
                    </a>
                </li>
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="fa fa-user"></span>
                        <span class="admin-fullText">${user.uRealname}</span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="#edituserinfo" data-toggle="modal"><span class="fa fa-user"></span> 个人资料</a></li>
                        <li><a href="#" onclick="reset()"><span class="fa fa-cog"></span> 重置密码</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/logout"><span class="fa fa-sign-out"></span> 退出</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/logout" class="tpl-header-list-link">
                        <span class="fa fa-sign-out" aria-hidden="true"></span>
                    </a>
                </li>
            </ul>
        </div>
    </header>
    <!-- header -->