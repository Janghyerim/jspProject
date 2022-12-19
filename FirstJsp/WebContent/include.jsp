<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeFile.jsp"%>

<%
// include file="경로정보(상대,절대)" 
// 절대경로 : http://localhost:8081/FirstJsp/
// page, include, taglib
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<%
	out.println("오늘 날짜 : " + today);
	out.println("<br/>");
	out.println("내일 날짜 : " + tomorrow);
	%>
</body>
</html>