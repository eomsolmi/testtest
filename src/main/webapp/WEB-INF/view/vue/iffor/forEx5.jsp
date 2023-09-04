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
		<li v-for="item in arrTest">{{ item }}</li>
	</ul>
	<input type="button" value="맨 뒤에 추가" v-on:click="push"/>
	<!-- 배열의 끝에 [맨 뒤에 추가]를 추가 -->
	<input type="button" value="4번째에  두 개 추가" v-on:click="splice1(3)" />
	<!-- 배열의 4번째 위치에 [추가1]과 [추가2]를 추가 -->
	<input type="button" value="1번째를 변경" v-on:click="change(0)" />
	<!-- 배열의 1번째 위치 값을 [변경]으로 변경  -->
	<input type="button" value="2번째를 삭제" v-on:click="splice2(1)" />
	<!-- 배열의 2번째 요소를 삭제 -->
	<p> 배열 크기 : {{ arrTest.length }}</p>
	추가할 위치 :
	<select v-model="idx">
		<option>0</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
	</select>
	<input type="text" v-model="obj" placeholder="추가할 데이터" />
	<input type="button" value="추가" v-on:click="insert"/>
	
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		arrTest: ["1st", "2nd", "3rd", "4th", "5th"], 
		obj: "", 
		idx: 0
	}, 
	methods: {
		push() {
			this.arrTest.push("[맨 뒤에 추가]");
		}, 
		splice1(index) {
			this.arrTest.splice(index, 0, "[추가1]", "[추가2]");
			// 두번째 인수가 0이므로 추가기능으로 동작함
		}, 
		change(index) { 
			this.arrTest.splice(index, 1, "[변경]");		// 원본을 바꿈	// 자바에서는 원본을 바꿀 수 없음
			// 두번째 인수가 1이므로 지정한 위치의 데이터를 삭제한 후 "[변경]"추가
		}, 
		splice2(index) {
			this.arrTest.splice(index, 1);
			// 세번째 인수가 없으므로 지정한 위치의 데이터를 삭제
		}, 
		insert() {
			this.arrTest.splice(this.idx, 0, this.obj);
			// 사용자가 지정한 위치(idx)에 사용자가 입력한 데이터(obj)를 삽입
		}
	}
});
</script>

</body>
</html>