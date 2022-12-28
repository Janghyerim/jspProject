<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	/* 조건 id로 한명을 상세보기 조회하는 기능 */
	/* 특정 사용자 조회를 해야하므로 primary key인 id값을 불러오는 것임 */
	String id = request.getParameter("id");

	/* DB를 연결해주는 자바가 제공해주는 클래스 인터페이스 선언 */
	Connection conn = null; 
	/* 동적쿼리문을 사용하게끔 해주는 기능 : ? 있을때  / 정적은 고정 Statement*/
	PreparedStatement pstmt=null;
	/* 결과 반환값 */
	ResultSet rs = null;
	   
	   try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myoracle");
	        conn = ds.getConnection();
   
	        String sql = "select * from member where id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        /* 쿼리문 실행 */
	        rs = pstmt.executeQuery();
	        /* rs.next() : 오라클에 테이블 데이터를 순차적으로 가져오는 역할(컬럼명) */
	        rs.next();
	          
	    }catch(Exception e){     
	      e.printStackTrace();
	    }
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>
	<table border=1 width=300>
		<tr>
			<td>아이디 : </td><td><%=rs.getString("id") %> </td>
		</tr>
		<tr>
			<td>비밀번호 : </td><td><%=rs.getString("pass") %> </td>
		</tr>
		<tr>
			<td>이름 : </td><td><%=rs.getString("name") %> </td>
		</tr>
		<tr>
			<td>나이 : </td><td><%=rs.getInt("age") %> </td>
		</tr>
		<tr>
			<td>성별 : </td><td><%=rs.getString("gender") %> </td>
		</tr>
		<tr>
			<td>이메일 주소 : </td><td><%=rs.getString("email") %> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="member_list.jsp">회원목록</a></td>
		</tr>
	</table>
	</center>
</body>
</html>
