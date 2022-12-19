<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 화면에 출력해야 하는 서버데이터 이므로 아래 정보를 지우면 안됨. -->
<%
	request.setCharacterEncoding("UTF-8");  //한글 깨짐 방지
	String eng = request.getParameter("eng"); //클라이언트 정보의 파라미터 값을 받아온다. 모든데이터는 문자열이므로 데이터타입은 String 형태임.
	String han = request.getParameter("han");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestWebInfo</title>
</head>
<body>
	<h2>1.클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li><%=eng %></li>
		<li><%=han %></li>
		<li><%=request.getRequestURL() %></li>
		<li><%=request.getRequestURI() %></li>
		<li><%=request.getRealPath("/") %></li>
		<li><%=request.getQueryString() %></li>
	</ul>
</body>
</html>