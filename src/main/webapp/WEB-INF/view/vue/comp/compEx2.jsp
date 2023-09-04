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
	<p>감상은 100자 이내로 입력해 주세요.</p>
	<textarea v-model="txt" maxlength="100"></textarea>
	<p v-bind:style="{color:txtColor}">남은 글자수는 {{ remain }}자 입니다.</p>
	<!-- 남은 글자수가 20자 이하이면 orange색, 1자 미만이면 red색으로 표현 -->
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		txt: ""
	}, 
	computed: {
		remain() {	// txt의 길이가 변하면 남은 글자수를 계산
			return 100 - this.txt.length;
		}, 
		txtColor() {	// remain이 변하면 txtColor를 계산
			var color = "green"
			if (this.remain <= 20)	color = "orange";
			if (this.remain < 1) {	// 100자 이상일 경우 100자 까지만 잘라내어 사용
			// this.txt = this.txt.substring(0, 100);
				color = "red";
			}	
			return color;
		}
	}
});
</script>
</body>
</html>