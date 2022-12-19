<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param</title>
</head>
<body>
	<%--<jsp:forward page="ParamForward.jsp">
		<jsp:param value="홍길동" name="param1"/>
		<jsp:param value="10" name="param2"/>
	</jsp:forward>--%>
	
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="강원도" name="loc1"/>
		<jsp:param value="속초" name="loc2"/>
	</jsp:include>
</body>
</html>