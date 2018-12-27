<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String proPath = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ proPath;
	request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <a href="${basePath}/login">登录</a> --%>

	<form action="${basePath}/login" method="post">
		<p>用户名 / 账号</p>
		<input type="text" class="name" name="username" required="required" />
		<p>密 码</p>
		<input type="password" class="password" name="password"
			required="required" /> <input type="submit" value="登录">

	</form>
	<a href="${basePath}/jsp/register.jsp">注册</a>

	<a href="${basePath}/house">房屋</a>
</body>
</html>