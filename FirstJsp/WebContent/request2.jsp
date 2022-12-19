<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request2</title>
</head>
<body>
	<!-- POST 방식 : 주소창에 값이 비노출 / <form method="post" name="서버에다 보낼때는 폼 형식에 네임속성(데이터)이 반드시 들어가야 한다. 네임속성이 파라미터 역할을 각각 한다."> -->
	<form method="post" action="RequestParameter.jsp">  <!-- 다양한<input>태그 사용 -->
		아이디:<input type="text" name="id" value="" /><br/>
		성별:
		<input type="radio" name="sex" value="man" />남자
		<input type="radio" name="sex" value="woman" checked="checked"/>여자
		<br/>
		관심사항:
		<input type="checkbox" name="favo" value="eco" />경제
		<input type="checkbox" name="favo" value="pol" checked="checked"/>정치
		<input type="checkbox" name="favo" value="ent" />연예<br/>
		자기소개:
		<textarea name="intro" cols="30" rows="4"></textarea>
		<br/>
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>