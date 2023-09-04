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
		<li v-for="item in arrTest1" v-if="item % 2 == 0">{{ item }}</li>
	</ul>
	<hr />
	<!-- 첫글자가 'a'인 요소들만 출력 -->
	<ul>
		<li v-for="item in arrTest2" v-if="item.charAt(0) == 'a'">{{ item }}</li>
	</ul>
	<hr />
	<!-- 요소에 'a'가 있는 요소들만 출력 -->
	<ul>
		<li v-for="item in arrTest2" v-if="item.indexOf('a') >= 0">{{ item }}</li>
	</ul>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		arrTest1: [1, 2, 3, 4, 5, 6, 7, 8, 9], 
		arrTest2: ["abc", "aab", "bcd", "dfe", "abe", "zaa"]
	}
});
</script>

</body>
</html>