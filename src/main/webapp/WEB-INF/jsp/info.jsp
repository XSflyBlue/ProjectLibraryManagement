<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.plm.model.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>information</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<h2>${info}</h2>
	
	<td>${user.uId}</td>
	<td>${user.uName}</td>
	<td>${user.uRealname}</td>
	<td>${user.uPassword}</td>
	<td>${user.email}</td>
	<td>${user.role}</td>
	<td>${user.starus}</td>
	<td>${user.uCode}</td>
	<td>${user.validataCode}</td>
	<td>${user.outDate}</td>
	<center>
		<table width="200" border="1">
			<tr>
				<th scope="col">序号</th>
				<th scope="col">ID</th>
				<th scope="col">用户名</th>
				<th scope="col">真实姓名</th>
				<th scope="col">密码</th>
				<th scope="col">邮箱</th>
			</tr>
			<c:forEach begin="0" step="1" items="${userList}" var="list"
				varStatus="userlist">
				<tr>
					<td>${userlist.count}</td>
					<td>${list.uId}</td>
					<td>${list.uName}</td>
					<td>${list.uRealname}</td>
					<td>${list.uPassword}</td>
					<td>${list.email}</td>
				</tr>
			</c:forEach>
		</table>
		<p>一共${page.pages}页</p>
		<a href="userList?page=${page.firstPage}">第一页</a> <a
			href="userList?page=${page.nextPage}">下一页</a> <a
			href="userList?page=${page.prePage}">上一页</a> <a
			href="userList?page=${page.lastPage}">最后页</a>
	</center>
</body>
</html>
