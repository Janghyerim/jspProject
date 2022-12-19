<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	//오라클에서도 xe가 아닌 orcl로 작성 함. 
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,"musthave","1234"); //DB주소 , 아이디 , 비번
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbcTest</title>
</head>
<body>
	DB연결 성공
</body>
</html>