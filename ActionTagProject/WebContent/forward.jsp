<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pAttr", "이순신");
	request.setAttribute("rAttr", "홍길동");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward</title>
</head>
<body>
	<jsp:forward page="./forwardSub.jsp"></jsp:forward>
	<% request.getRequestDispatcher("loginForm.jsp").forward(request, response); %>
</body>
</html>