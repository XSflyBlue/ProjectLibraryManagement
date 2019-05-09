<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <li>
                <c:if test="${user==null}">
                    <a href="${pageContext.request.contextPath}/user/register" class="tpl-header-list-link">
                        <span class="fa fa-plus-square" aria-hidden="true"></span>
                        <span class="tpl-header-list-user-nick">注册</span>
                    </a>
                </c:if>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/loginCheck" class="tpl-header-list-link">
                        <span class="fa fa-sign-in" aria-hidden="true"></span>
                        <span class="tpl-header-list-user-nick">管理中心</span>
                    </a>
                </li>
                <li>
                <c:if test="${user!=null}">
                    <a href="${pageContext.request.contextPath}/user/logout" class="tpl-header-list-link">
                        <span class="fa fa-sign-out" aria-hidden="true">注销</span>
                    </a>
                </c:if>
                </li>
            </ul>
        </div>
    </header>
    <!-- header -->