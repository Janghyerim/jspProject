<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	ResultSet rs = null;
	Statement stmt = null;
	Connection conn = null; 
	
	try{
		String sql = "select * from member";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while (rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			String age = rs.getString("age");
			String gender = rs.getString("gender");
			String email = rs.getString("email");
		
	
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<center>
<table border=1 width=500>
	<tr align=center><td colspan="5">회원 목록</td></tr>
	<tr align=center>
		<td>아이디</td>
		<td>이름</td>
		<td>나이</td>
		<td>성별</td>
		<td>이메일</td> 
	</tr>
	<%
		}
	}catch(SQLException e){
		out.println("member테이블 호출 실패");
	}finally{
		if(rs != null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
	%>
</table>
</center>
</body>
</html>
