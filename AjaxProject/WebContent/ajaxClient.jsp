<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxClient</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#buttonSubmit").on("click",function(){ //제출 버튼 이벤트 지정
			/*ajax 기본구조 : $.ajax({});*/
			$.ajax({
				/*서버로 보낼 데이터 요청*/ 
				url: './ajaxServer.jsp',
				type:'post',
				data:{nickName:'뿡빵이'},
				/*클라이언트가 받기 위한 필요정보 입력 해야함*/
				dataType:'json',
				success:function(data){  //(data) : 매개변수이므로 어떤 이름이 오든 상관이 없음 data = {"nickName":"뿡빵이"}
					console.log("요청성공");
					console.log(data.nickName);
					$("#nickname").text(data.nickName);
				}
			});
		});
	});

</script>
</head>
<body>
	<input type="button" id="buttonSubmit" value="제출">
	<p id="nickname"></p>
	<p>ajax 통신성공</p>
	
</body>
</html>