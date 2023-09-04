<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
#box { width:100px; height:100px; }
</style>
</head>
<body>
<div id="app">
	<!-- 0에서 255까지의 값을 표현하는 range 컨트롤 -->
	<table>
	<tr><td>R : </td><td><input type="range" min="0" max="255" v-model="R" /></td><td>{{R}}</td></tr>
	<tr><td>G : </td><td><input type="range" min="0" max="255" v-model="G" /></td><td>{{G}}</td></tr>
	<tr><td>B : </td><td><input type="range" min="0" max="255" v-model="B" /></td><td>{{B}}</td></tr>
	<tr><td colspan="3"><p v-bind:style="{backgroundColor:mixColor}">{{mixColor}}</p></td></tr>
	<tr><td colspan="3"><div id="box" v-bind:style="{backgroundColor:mixColor}"></div></td></tr>
	</table>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		R: 255, 
		G: 150, 
		B: 100
	}, 
	computed: {
		mixColor() {
			return "rgb(" + this.R + ", " + this.G + ", " + this.B + ")";
		}
	}
});
</script>
</body>
</html>