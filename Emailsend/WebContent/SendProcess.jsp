<%@page import="smtp.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
	// 폼값(이메일 내용) 저장
	Map<String, String> emailInfo = new HashMap<String, String>();
	emailInfo.put("from", request.getParameter("from")); // 보내는 사람
	emailInfo.put("to", request.getParameter("to")); // 받는 사람
	emailInfo.put("subject", request.getParameter("subject")); // 제목
	
	// 내용은 메일 포맷에 따라 다르게 처리
	String content = request.getParameter("content"); // 내용
	String format = request.getParameter("format"); // 메일 포맷(text 혹은 html)
	
	if(format.equals("text")){
		//텍스트 포맷일 때는 그대로 저장
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		
	} else if(format.equals("html")){
		// html 포맷일 때는 html 형태로 변환해 저장
		content = content.replace("\r\n", "<br />"); // 줄바꿈을 html 형태로 수정
		String htmlContent = ""; // html용으로 변환된 내용을 담을 변수
		
		try{
			// html 메일용 템플릿 파일 읽기
			String templatePath = application.getRealPath("./MailForm.html");
			BufferedReader br = new BufferedReader(new FileReader(templatePath));
			
			// 한 줄씩 읽어 htmlContent 변수에 저장
			String oneLine;
			while((oneLine = br.readLine()) != null){ // readLine() -> 행단위로 읽어오는 메서드
				htmlContent += oneLine + "\n";
			}
			br.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		// 템플릿의 "__CONTENT__" 부분을 메일 내용으로 대체
		htmlContent = htmlContent.replace("__CONTENT__", content);
		// 변환된 내용을 저장
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
	}
	
	try{
		NaverSMTP smtpServer = new NaverSMTP(); // 메일 전송 클래스 생성
		smtpServer.emailSending(emailInfo);
		out.print("이메일 전송 성공");
		
	} catch (Exception e){
		out.print("이메일 전송 실패");
		e.printStackTrace();
	}
%>
