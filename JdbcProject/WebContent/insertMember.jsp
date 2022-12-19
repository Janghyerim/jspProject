<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMember</title>
</head>
<body>
	<!-- <h2>회원 추가 테스트(executeUpdate() 사용)</h2> -->
	<%
	/*JDBConnect jdbc = new JDBConnect();
	
	String sql = "insert into member values(?,?,?,sysdate)"; //동적 쿼리문
	PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
	psmt.setString(1,"test1");
	psmt.setString(2,"1111");
	psmt.setString(3,"회원1");
	
	int result = psmt.executeUpdate();  //쿼리문 실행
	if(result != 0){
		out.print("쿼리문 실행 완료");
	}else{
		out.print("쿼리문 실행 실패");
	}
	
	psmt.close();
	jdbc.close();*/
	%>
	
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String sql = "select * from member"; //정적 쿼리문
		Statement stmt = jdbc.conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);  //결과가 조회되고 그 결과는 rs가 받는다는 뜻
		
		while(rs.next()){
			String id = rs.getString("id");  //rs.getString(1)
			String pw = rs.getString("pass"); //rs.getString(2)
			String name = rs.getString("name"); //rs.getString(3)
			java.sql.Date regidate = rs.getDate("regidate"); //rs.getString(4)
			
			out.print(String.format("%s %s %s %s", id, pw, name, regidate)+"<br/>");
		}
		
		/*rs,psmt,stmt,conn*/
		//JDBConnect 자바 파일에서 클로즈 함수 선언 해주면 여기서 클로즈 해줄 필요없음.
		jdbc.close();
			
	
	%>
</body>
</html>