<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String popupMode = "on"; //off
	
	Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 얻기
	if(cookies != null){  //쿠키가 하나 이상이라면...
		for(Cookie c : cookies){ //쿠키 각각의...
			String cookieName = c.getName(); //쿠키이름 읽어오기
			String cookieValue = c.getValue(); //쿠키 값 읽어오기  
			if(cookieName.equals("PopupClose")){
				popupMode = cookieValue;
			}
		}
	}else{
		out.print("쿠키 정보가 없습니다");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popupMain</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#closeBtn").on("click",function(){
			$("#popup").hide();
			let chkVal = $("input:checkbox[id=inactiveToday]:checked").val(); //1
			$.ajax({
				url:'./PopupCookie.jsp',
				type:'get',
				data:{inactiveToday:chkVal}, //파라미터 값 -> ?속성=값
				dataType:'text',
				success:function(resData){
						
				}
			});
		});
	});
</script>
<style type="text/css">
	div#popup{
        position: absolute; 
        top:100px; 
        left:100px; 
        color:beige;  
        width:300px; 
        height:100px; 
        background-color:gray;
    }
    div#popup>div{
        position: relative; 
        background-color:#ffffff; 
        top:0px;
        border:1px solid gray; 
        padding:10px; 
        color:black;
    }
</style>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<%
		out.print("팝업창은 " + popupMode + " 상태 입니다.<br>");
	%>
	
	<%if(popupMode.equals("on")) {%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="left">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1">
				하루동안 열지 않음
				<input type="button" id="closeBtn" value="닫기">
			</form>
		</div>
	</div>
	<%} %>
</body>
</html>