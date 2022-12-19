<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	session.setMaxInactiveInterval(5); //유지시간 설정이므로 세션아이디값이 설정시간 마다 변경됨. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
	<ul>
		<li>세션 유지시간 : <%=session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%=session.getId() %></li>
	</ul>
</body>
</html>