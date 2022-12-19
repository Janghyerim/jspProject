<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach2</title>
</head>
<body>   <%-- <c:forEach>향상된 태그 사용하기 --%>
	
	<h4>향상된 for문 형태의 forEach 태그</h4>
	<%
		String[]rgba = {"Red", "Green", "Blue", "Black"};
	%>
	<c:forEach items="<%=rgba %>" var="c">
		<span style="color:${c};"> ${c} </span>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach items="<%=rgba %>" var="c" varStatus="loop">
		<tr>
			<td>count : ${loop.count }</td> <!-- 몇번 도는지 -->
			<td>index : ${loop.index }</td> <!-- 인덱스[0]부터 (-1차이로) 숫자를 쓰면 숫자 값이 인덱스, 문자 사용하면 [0]부터 ~ -->
			<td>current : ${loop.current }</td> <!-- 값 (i값) -->
			<td>first : ${loop.first }</td> <!-- 처음시작할때 true -->
			<td>last : ${loop.last }</td> <!-- 마지막일때 true -->
		</tr>
	</c:forEach>
	</table>
</body>
</html>