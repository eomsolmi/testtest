<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div id="app">
	<ul>
		<!-- 20까지 루프를 돌면서 짝수만<li>에 출력 -->
		<li v-for="n in 20" v-if="n % 2 == 0">{{ n }}</li>
	</ul>
</div>
<script>
new Vue({
	el: "#app"
});
</script>

</body>
</html>