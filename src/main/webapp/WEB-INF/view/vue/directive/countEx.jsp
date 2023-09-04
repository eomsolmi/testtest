<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<h2>클릭시 카운트 올리기</h2>
<script>
function countUp() {
	var num = document.getElementById("jsCount").innerHTML;
	jsCount.innerHTML = Number(num) + 1;
}

function countDown() {
	var num = document.getElementById("jsCount").innerHTML;
	jsCount.innerHTML = Number(num) - 1;
}
</script>
<h3>자바스크립트로 작업</h3>
<span id="jsCount">0</span>회
<input type="button" value="카운트 올리기" onclick="countUp();" />
<input type="button" value="카운트 내리기" onclick="countDown();" />
<hr />
<h3>Vue로 작업</h3>
<div id="app">
	{{ count }}회
	<input type="button" value="카운트 올리기" v-on:click="countUp" />
	<input type="button" value="카운트 내리기" v-on:click="countDown" />
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		count: 0
	}, 
	methods: {
		countUp: function() {
			this.count++;		// Vue의 data 프로퍼티를 사용하려면 this를 붙여야함
			// 현재 동작하고있는 Vue인스턴스를 의미함, 멤버변수처럼 이용
		}, 
		countDown() {		// 메소드 선언시 function은 생략가능
			this.count--;
		}
	}
});
</script>

</body>
</html>