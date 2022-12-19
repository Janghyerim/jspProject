<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <!-- trimDirectiveWhitespaces="true" : 공백 없애는 기능 -->
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Date" %>  

<%
//자바데이터를 여기에 써라 (맨위이던 바디던 상관없음)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import</title>
</head>
<body>
<%
	Date today = new Date();     //자바 객체 생성
	int hour = today.getHours(); //시간 정보를 갖고옴
	//out.print(hour);  //15     //출력 구문
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd");
	out.print(sf.format(today));  //2022-15-22
	
	//jsp는 코드 보안에 굉장히 유리하다. java코딩을 해도 출력화면은 html 이므로 ..
%>
</body>
</html>