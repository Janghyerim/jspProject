<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%
	//변수나 실행문 정의
	String loginId = CookieManager.readCookie(request, "loginId");

	String cookieCheck = "";  //쿠키체크 변수 선언
	if(!loginId.equals("")){  //! 쿠키값이 있으면 체크드 
		cookieCheck = "checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdSave</title>
</head>
<script>
	alert("안내 메세지");
</script>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
		아이디:
			<input type="text" name="user_id" value="<%= loginId %>" />
			<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> />
			아이디 저장하기
			<br />
		패스워드:
			<input type="text" name="user_pw" />
			<br />
			<input type="submit" value="로그인하기" />
	</form>
</body>
</html>