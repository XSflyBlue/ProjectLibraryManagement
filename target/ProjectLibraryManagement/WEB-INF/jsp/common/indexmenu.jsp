<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="tpl-left-nav tpl-left-nav-hover">
	<div class="tpl-left-nav-title">功能列表</div>
	<div class="tpl-left-nav-list">
		<ul class="tpl-left-nav-menu">
			<li class="tpl-left-nav-item"><a id="j_indexbutton"
				href="${pageContext.request.contextPath}/"
				class="nav-link tpl-left-nav-link-list"> <i class="am-icon-home"></i>
					<span>首页</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				id="j_postbutton"
				href="${pageContext.request.contextPath}/postlist"
					class="nav-link tpl-left-nav-link-list">
					<i class="fa fa-bullhorn" aria-hidden="true"></i> <span>公告</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				id="j_nicebutton"
				    href="${pageContext.request.contextPath}/excellentProjectlist"
					class="nav-link tpl-left-nav-link-list"> 
					<i class="fa fa-file-text" aria-hidden="true"></i> <span>优秀项目</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				id="j_filebutton"
				    href="${pageContext.request.contextPath}/filelist"
					class="nav-link tpl-left-nav-link-list"> 
					<i class="fa fa-download" aria-hidden="true"></i> <span>资料下载</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				id="j_helpbutton"
				    href="${pageContext.request.contextPath}/helplist"
					class="nav-link tpl-left-nav-link-list"> 
					<i class="fa fa-question-circle" aria-hidden="true"></i> <span>网站帮助</span>
			</a></li>
			<li class="tpl-left-nav-item"><a
				id="j_linkbutton"
				    href="${pageContext.request.contextPath}/linklist"
					class="nav-link tpl-left-nav-link-list"> 
					<i class="fa fa-chain" aria-hidden="true"></i> <span>友情链接</span>
			</a></li>
		</ul>
	</div>
</div>