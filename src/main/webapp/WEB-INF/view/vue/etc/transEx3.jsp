<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.v-move { transition: 0.5s; }
</style>
</head>
<body>
<div id="app">
	<transition-group tag="ul">
		<li v-for="item in dataArray" v-bind:key="item">{{item}}</li>
	</transition-group>
	<input type="button" value="정렬" v-on:click="sortData" />
	<input type="button" value="섞기" v-on:click="shuffleData" />
</div>
<script>
new Vue({
	el: "#app",
	data: {
		dataArray: ["one", "two", "three", "four", "five"]
	}, 
	methods: {
		sortData() {
			this.dataArray.sort(function(a, b) {
				return (a < b ? -1 : 1);
			});
		}, 
		shuffleData() {
			var tmpArr = [];	// 섞인 배열을 임시 저장할 배열
			var len = this.dataArray.length;	// 원본 배열의 크기
			
			for (var i = len ; len > 0 ; len--) {
				var idx = Math.floor(Math.random() * len);
				// Math.random() 가져오는 값은 0이상 1 미만 
				// Math.random() * len -> 0이상 5미만 값 가져옴
				// Math.floor(Math.random() * len) -> 0~4의 값
				// 동일한 값이 나와도 하나씩 삭제했기 때문에 원래의 값은 없고 아래의 값이 올라온 상태
				tmpArr.push(this.dataArray[idx]);
				// 랜덤 인덱스에 해당하는 값을 임시 배열에 저장
				this.dataArray.splice(idx, 1);
				// 임시 배열에 저장한 값에 해당하는 요소를 원본 배열에서 삭제
			}
			
			this.dataArray = tmpArr;
			// 섞인 요소들을 원본 배열에 저장
		}
	}
});
</script>
</body>
</html>