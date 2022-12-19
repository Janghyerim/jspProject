<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxClient3</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#buttonSubmit").on("click",function(){
			$.ajax({
				url:'./ajaxServer3.jsp',
				type:'post',
				dataType:'json',
				success:function(data){
					$.each(data,function(i,d){
						$("#info").before("<p>" + data[i].nickName + "</p>");
						$("#info").before("<p>" + data[i].ph_number + "</p>");
						$("#info").before("<p>" + data[i].address + "</p>");
						
						//$("#info").before("<p>" + d.nickName + "</p>");
						//$("#info").before("<p>" + d.ph_number + "</p>");
						//$("#info").before("<p>" + d.address + "</p>");
					});
				}
			});
		});
	});

</script>
</head>
<body>
	<input type="button" id="buttonSubmit" value="제출">
	<div id="info"></div>
</body>
</html>