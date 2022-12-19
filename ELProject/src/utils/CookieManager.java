package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	
	public static void makeCookie(HttpServletResponse response, String cName, 
								  String cValue, int cTime) {
		//**쿠키 기본 조작법**
		//1.쿠키객체를 생성한다.
		Cookie cookie = new Cookie(cName,cValue);
		//2.쿠키의 생성 경로 설정
		cookie.setPath("/");
		//3.유지시간
		cookie.setMaxAge(cTime); //1시간
		//4.클라이언트에게 전송하는 역할 (응답헤더에 쿠키정보 저장)
		response.addCookie(cookie);
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue="";
		
		Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 얻기
		if(cookies != null){  //쿠키가 하나 이상이라면...
			for(Cookie c : cookies){ //쿠키 각각의...
				String cookieName = c.getName(); //쿠키이름 읽어오기
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue(); //쿠키 값 읽어오기  
				} 
			}
		}
		return cookieValue;
	}
	
	//쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response,cName,"",0);
	}
}
