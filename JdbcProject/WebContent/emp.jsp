<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp</title>
</head>
<body>
<%
	JDBConnect jdbc = new JDBConnect();

	String updatesql = "update emp01 set deptno = ? where deptno = ?";
	PreparedStatement psmt2 = jdbc.conn.prepareStatement(updatesql);
	psmt2.setInt(1, 10);  //물음표 번호 1,2
	psmt2.setInt(2, 30);
	
	psmt2.executeUpdate();

	
	String deletesql = "delete from emp01 where deptno = ?";
	PreparedStatement psmt3 = jdbc.conn.prepareStatement(deletesql);
	psmt3.setInt(1, 10);
	
	psmt3.executeUpdate();
	
	
	String sql = "select * from emp01";
	PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	while(rs.next()){
		int empno = rs.getInt(1);
		String ename = rs.getString(2);
		String job = rs.getString(3);
		int mgr = rs.getInt(4);
		String hiredate = rs.getString(5); //날짜는 String 타입 가능
		int sal = rs.getInt(6);
		int comm = rs.getInt(7);
		int deptno = rs.getInt(8);
		
		out.print(String.format("%d %s %s %d %s %d %d %d", empno, ename, job, mgr, hiredate, sal, comm, deptno) + "<br/>");
	}
	jdbc.close();
%>
</body>
</html>