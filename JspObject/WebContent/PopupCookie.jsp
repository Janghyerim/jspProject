<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chkVal = request.getParameter("inactiveToday");

	if(chkVal !=null && chkVal.equals("1")){
		//**쿠키 기본 조작법**
		//1.쿠키객체를 생성한다.
		Cookie cookie = new Cookie("PopupClose","off");
		//2.쿠키의 생성 경로 설정
		cookie.setPath(request.getContextPath());
		//3.유지시간
		cookie.setMaxAge(3600); //1시간
		//4.클라이언트에게 전송하는 역할 (응답헤더에 쿠키정보 저장)
		response.addCookie(cookie);
		
		out.print("<h1>하루동안 창 열기 금지</h1>");
	}
%>