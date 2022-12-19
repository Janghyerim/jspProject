<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//**쿠키 기본 조작법**
	//1.쿠키객체를 생성한다.
	Cookie cookie = new Cookie("myCookie","쿠키맛나요");
	//2.쿠키의 생성 경로 설정
	cookie.setPath(request.getContextPath());
	//3.유지시간
	cookie.setMaxAge(3600); //1시간
	//4.클라이언트에게 전송하는 역할 (응답헤더에 쿠키정보 저장)
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie</title>
</head>
<body>
	<h2>2.쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
		Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 얻기
		if(cookies != null){  //쿠키가 하나 이상이라면...
			for(Cookie c : cookies){ //쿠키 각각의...
				String cookieName = c.getName(); //쿠키이름 읽어오기
				String cookieValue = c.getValue(); //쿠키 값 읽어오기  
				//JSESSIONID : 0F6385DDF992AB375C6ACF52A6CCEE1F : 주민번호 같은 것 (서버 자동 생성)
				out.print("<br>");
				//화면에 출력
				//out.print(String.format("%s : %s<br/>",cookieName,cookieValue));
				out.print(String.format(cookieName + " : " + cookieValue));
			}
		}else{
			out.print("쿠키 정보가 없습니다");
		}
	%>
	
	<h2>3.페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">CookieResult.jsp 다음 페이지에서 쿠키 값 확인하기</a>
</body>
</html>