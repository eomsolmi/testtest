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
	이름 : <input type="text" v-model.lazy="myName" placeholder="이름" /><br />
	좋아하는 색은 : <br />
	<label><input type="radio" v-model="exColor" value="red" />빨강</label><br />
	<label><input type="radio" v-model="exColor" value="green" />초록</label><br />
	<label><input type="radio" v-model="exColor" value="blue" />파랑</label><br />
	<label><input type="radio" v-model="exColor" value="yellow" />노랑</label><br />
	<label><input type="radio" v-model="exColor" value="gray" />회색</label><br />
	<p v-bind:style="{color:onColor}">내 이름은 {{ myName }}이고 좋아하는 색은 {{ exColor }} 입니다. </p>
	<!-- v-model : 컨트롤의 값을 프로퍼티와 연결 / v-bind : 속성의 값을 프로퍼티와 연결 -->
	<input type="button" v-on:click="on" value="색상적용" />
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		myName: "",
		exColor: "",
		onColor: ""
	}, 
	methods: {
		on() {
			this.onColor = this.exColor;
		}
	}
});
</script>
</body>
</html>