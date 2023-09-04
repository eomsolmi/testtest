<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
var arr = [
	{uname:"홍길동", age:33}, {uname:"전우치", age:30}, {uname:"임꺽정", age:27}
];	// 객체를 담은 배열
</script>
</head>
<body>
<div id="app">
	<p>obj : {{ obj }}</p><!-- obj : [ { "uname": "홍길동", "age": 33 }, { "uname": "전우치", "age": 30 }, { "uname": "임꺽정", "age": 27 } ] -->
	<p>obj[0] : {{ obj[0] }}</p><!-- obj[0] : { "uname": "홍길동", "age": 33 } -->
	<p>obj[1] : {{ obj[1] }}</p><!-- obj[1] : { "uname": "전우치", "age": 30 } -->
	<p>obj[2] : {{ obj[2] }}</p><!-- obj[2] : { "uname": "임꺽정", "age": 27 } -->
	<p>이름 : {{ obj[0].uname }}</p><!-- 이름 : 홍길동 -->
	<p>나이 : {{ obj[0].age }}</p><!-- 나이 : 33 -->
</div>
<script>

//javascript에서 선언한 변수를 출력할 수 있는 기능
new Vue({
	el: "#app", 
	data: {
		obj: arr	// 자바스크립트에서 생성한 배열을 vue용 프로퍼티에 담음
	}
});
</script>
</body>
</html>