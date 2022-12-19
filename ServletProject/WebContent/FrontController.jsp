<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController</title>
</head>
<body>
	<h3>한번의 매핑으로 여러가지 요청하기</h3>
	${resultValue }
	<ol>
		<li>URI : ${uri }</li>
		<li>요청명 : ${commandStr }</li>
	</ol>
	<ul>
		<!-- 같은 위치에선 ./ 을 사용 하던가 전부 지운다. -->
		<li><a href="./regist.one">회원가입</a></li>
		<li><a href="./login.one">로그인</a></li>
		<li><a href="./freeboard.one">자유게시판</a></li>
	</ul>
</body>
</html>