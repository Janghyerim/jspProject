<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
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
        
        String sql = "select * from member";
        
        pstmt = conn.prepareStatement(sql);
        /* 쿼리문 실행 */
        rs = pstmt.executeQuery();
          
          
    }catch(Exception e){     
      e.printStackTrace();
    }
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
	<center>
		<table border=1 width=500>
		   <tr align=center><td colspan="5">회원 목록</td></tr>
		   <tr align=center><td>아이디</td><td>이름</td><td>나이</td><td>성별</td><td>이메일</td></tr>
		      
		    <!-- rs.next() : 오라클에 테이블 데이터를 순차적으로 가져오는 역할(컬럼명) -->
		   <%while(rs.next()){ %>
		   
		   <tr align="center">
		      <td> <!-- a태그로 클릭했을때 아이디가 파라메터로 넘어가진다=> 경로끝에 아이디로 바뀜 -->
		      <a href="member_info.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a>
		      </td>
		      <td><%=rs.getString("name") %></td>
		      <td><%=rs.getInt("age") %></td>
		      <td><%=rs.getString("gender") %></td>
		      <td><%=rs.getString("email") %></td>
		   </tr>
		   
		   <%} %>    
		</table>
	</center>
</body>
</html>