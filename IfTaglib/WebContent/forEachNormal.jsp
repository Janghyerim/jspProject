<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach</title>
</head>
<body>  <%-- <c:forEach>태그 사용하기 --%>
	
	<h4>일반 for문 형태의 forEach 태그</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복${i }입니다.</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<tr>
				<td>count : ${loop.count }</td> <!-- 몇번 도는지 -->
				<td>index : ${loop.index }</td> <!-- 인덱스[0]부터 (-1차이로) 숫자를 쓰면 숫자 값이 인덱스, 문자 사용하면 [0]부터 ~ -->
				<td>current: ${loop.current }</td> <!-- 값 (i값) 3,4,5.. -->
				<td>first : ${loop.first }</td> <!-- 처음시작할때 true -->
				<td>last : ${loop.last }</td> <!-- 마지막일때 true -->
			</tr>
		</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${j mod 2 ne 0 }">
			<c:set var="sum" value="${sum + j }" />
		</c:if>
	</c:forEach>
	1 ~ 100 사이의 정수 중 홀수의 합은 ? ${sum }
</body>
</html>