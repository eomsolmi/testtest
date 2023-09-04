<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div id="app1">
	<p style="color:#e80;">문자색을 직접 지정</p>
	<p v-bind:style="{color:exColor}">문자색을 v-bind로 지정</p>
	<hr />
	<p style="font-size:2em;">문자 크기를 직접 지정</p>
	<p v-bind:style="{fontSize:exFontSize}">문자 크기를 v-bind로 지정</p>
	<hr />
	<p style="background-color:aqua;">배경색을 직접 지정</p>
	<p v-bind:style="{backgroundColor:exBackColor}">배경색을 v-bind로 지정</p>
	<hr />
</div>
<script>
new Vue({
	el: "#app1", 
	data: {
		exColor: "#e80", 
		exFontSize: "2em", 
		exBackColor: "aqua"
	}
});
</script>

</body>
</html>