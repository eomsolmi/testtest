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
	<p>앞으로 {{restSec}}초
	<input type="button" value="START" v-on:click="startTimer" /></p>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		restSec: 5, 
		intervalID: null		// 들어갈 값이숫자인지 문자인지 객체인지 모를때 null 넣어둠
	}, 
	methods: {
		startTimer() {
			this.restSec = 5;
			this.intervalID = setInterval(() => { this.restSec--; }, 1000)
		}
	}, 
	watch: {
		restSec() {
			if(this.restSec <=  0) {
				alert("TIME OUT!");
				clearInterval(this.intervalID);
			}
		}
	}
});
</script>
</body>
</html>