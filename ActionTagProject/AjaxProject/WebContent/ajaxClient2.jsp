<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxClient2</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#buttonSubmit").on("click",function(){
			$.ajax({
				url:'./ajaxServer2.jsp',
				type:'post',
				dataType:'json',
				success:function(data){
					$("#nickName").text(data.nickName);
					$("#ph_number").text(data.ph_number);
					$("#address").text(data.address);
				}
			});
		});
	});

</script>
</head>
<body>
	<input type="button" id="buttonSubmit" value="제출">
	<p id="nickName"></p>
	<p id="ph_number"></p>
	<p id="address"></p>
</body>
</html>