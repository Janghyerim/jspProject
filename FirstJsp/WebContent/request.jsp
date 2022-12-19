<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
	<!-- 서버 요청 방식 -->
	<!-- GET 방식 : 주소창에 값이 노출  / <그 외>-->
	<!-- POST 방식 : 주소창에 값이 비노출 / <form method="post" name="서버에다 보낼때는 폼 형식에 네임속성(데이터)이 반드시 들어가야 한다. 네임속성이 파라미터 역할을 각각 한다."> -->
	
	<!-- request : 클라이언트가 서버에게 요청 -->
	<!-- response : 서버가 클라이언트에게 요청 -->
	
	
	<h2>1.클라이언트와 서버의 환경정보 읽기</h2>  
	<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕"> <!-- GET 방식으로 요청 / ?eng=Hello&han=안녕 : queryString(파라미터)-->
		GET 방식 전송
	</a>
	<br />
	<form action="RequestWebInfo.jsp" method="post"> <!-- POST 방식으로 요청  / name = 파라미터 값-->
		영어:<input type="text" name="eng" value="Bye" /><br />
		한글:<input type="text" name="han" value="잘 가" /><br />
		<input type="submit" value="POST 방식 전송" />
	</form>
</body>
</html>