<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "common.Person" %>

<%
	request.setAttribute("requestString", "request 영역의 문자열");
	request.setAttribute("requestPerson", new Person("안중근",31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
	<%
		Person person = (Person)request.getAttribute("requestPerson");
	%>
	<%=request.getAttribute("requestString") %>
	<br>
	<%=person.getName() %>
	<%=person.getAge() %>
	
	<h2>포워드한 방식으로 이동해야한다.</h2>
	<%
		RequestDispatcher forward = request.getRequestDispatcher("RequestForward.jsp"); //페이지 이동 메소드
		forward.forward(request, response);
	%>
</body>
</html>