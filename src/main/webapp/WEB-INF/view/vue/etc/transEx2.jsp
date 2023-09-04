<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.v-enter-active, .v-leave-active { transition: 0.5s; }
.v-enter, .v-leave-to { opacity: 0; transform:translateX(50px); }
</style>
</head>
<body>
<div id="app">
	<transition-group tag="ul">
		<li v-for="item in dataArray" v-bind:key="item">{{item}}</li>
		<!-- v-bind:key="item" : Vue가 반복되는 태그들을 기억할 수 있게 해주는 방법으로 유니크한 key값을 사용해야 함(transition-group 태그를 사용할 경우) -->
	</transition-group>
	<!-- 텍스트 필드로 문자열을 받아온 후 버튼을 클릭하면 배열의 가장 뒤에 추가 -->
	<!-- 또다른 버튼을 클릭하면 배열의 마지막 요소를 삭제 -->
	<input type="text" v-model="txt" placeholder="추가할 문자 입력" />
	<input type="button" value="추가" v-on:click="addtxt" />
	<input type="button" value="마지막 요소 삭제" v-on:click="deltxt" />
	
</div>
<script>
new Vue({
	el: "#app",
	data: {
		dataArray: ["홍길동", "전우치", "임꺽정", "둘리"], 
		txt: ""
	}, 
	methods: {
		addtxt() {
			this.dataArray.push(this.txt);
			this.txt = "";
		}, 
		deltxt() {
			this.dataArray.splice(this.dataArray.length - 1, 1);
		}
	}
});
</script>
</body>
</html>