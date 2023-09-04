<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function noJson() {
	$.ajax({
		type : "GET", url : "./noJson", 
		success : function(rs) {
			var arr = rs.split(",");
			var str = "";	// result1에서 보여줄 태그들을 누적 저장할 변수
			for (var i = 0 ; i < arr.length ; i++) {
				str += "<li>" + arr[i] + "</li>";
			}
			str = "<ul>" + str + "</ul>";
			$("#result1").html(str);
		}
	});
}

function useJson() {
	$.ajax({
		type : "GET", url : "./useJson", 
		success : function(rs) {
			console.log(rs);
			var arr = JSON.parse(rs);
			// json형식의 문자열을 자바스크립트 객체로 변환시키는 parse() 함수 사용
			var str = "";
			for (var i = 0 ; i < arr.length ; i++) {
				str += "<li>" + arr[i] + "</li>";
			}
			str = "<ul>" + str + "</ul>";
			$("#result2").html(str);
		}
	});
}
</script>
</head>
<body>
<p id="result1"></p>
<input type="button" value="json 없이 실행" onclick="noJson();" />
<hr />
<p id="result2"></p>
<input type="button" value="json 으로 실행" onclick="useJson();" />
</body>
</html>
