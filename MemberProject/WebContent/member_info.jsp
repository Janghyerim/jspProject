<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	
	코드 완겅
	
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>
	<table border=1 width=300>
		<tr>
			<td>아이디 : <%=id %></td>
		</tr>
		<tr>
			<td>비밀번호 : <%=pass %></td>
		</tr>
		<tr>
			<td>이름 : <%=name %></td>
		</tr>
		<tr>
			<td>나이 : <%=age %></td>
		</tr>
		<tr>
			<td>성별 : <%=gender %></td>
		</tr>
		<tr>
			<td>이메일 주소 : <%=email %></td>
		</tr>
		<tr>
			<td><a href="#" onclick="/member_list.jsp">리스트로 돌아가기</a></td>
		</tr>
	</table>
	</center>
</body>
</html>
