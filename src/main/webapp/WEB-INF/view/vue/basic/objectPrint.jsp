<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div id="app">
	<p>obj : {{ obj }}</p>
	<!-- obj : { "uname": "홍길동", "age": 33, "addr": "서울" } -->
	<!-- 객체는 '.'을 통해서 접근 -->
	<p>obj.uname : {{ obj.uname }}</p><!-- obj.uname : 홍길동 -->
	<p>obj.age : {{ obj.age }}</p><!-- obj.age : 33 -->
	<p>obj.addr : {{ obj.addr }}</p><!-- obj.addr : 서울 -->
	<p>obj.arr : {{ obj.arr }}</p><!-- obj.arr : [ 1, 2, 3 ] -->
	<p>obj.arr[0] : {{ obj.arr[0] }}</p><!-- obj.arr[0] : 1 -->
	<p>obj.arr[1] : {{ obj.arr[1] }}</p><!-- obj.arr[1] : 2 -->
	<p>obj.arr[2] : {{ obj.arr[2] }}</p><!-- obj.arr[2] : 3 -->
	<p>obj.inner : {{ obj.inner }}</p><!-- obj.inner : { "uname": "전우치", "age": 30 } -->
	<p>obj.inner.uname : {{ obj.inner.uname }}</p><!-- obj.inner.uname : 전우치 -->
	<p>obj.inner.age : {{ obj.inner.age }}</p><!-- obj.inner.age : 30 -->
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		obj: {uname:"홍길동", age:33, addr:"서울", arr:[1, 2, 3], inner: {uname:"전우치", age:30}}		// javaScript 객체 key에는 따옴표를 붙여도되고 안붙여도됨
		// 이름이 '전우치'이고, 나이는 30인 객체 'inner'를 obj에 추가한 후 출력
	}
});
</script>
</body>
</html>