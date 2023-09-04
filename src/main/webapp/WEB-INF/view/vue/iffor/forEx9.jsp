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
	<input type="button" value="짝수만 표시" v-on:click="evenData()" />
	<hr />
	<!-- 원본 배열은 건드리지 않고 새 배열에 filter된 배열 저장 후 출력 -->
	<ul>
		<li v-for="item in arrTest2">{{ item }}</li>
	</ul>
	<input type="button" value="홀수만 표시" v-on:click="oddData()" />
	<hr />
	<p>원본 : {{ arrTest3 }} </p>
	검색어 : <input type="text" v-model="keyword" placeholder="영문 한글자" />
	검색 방법 : 
	<select v-model="schtype">
		<option value="" disabled>검색방법 선택</option>
		<option value="a">'검색어'로 시작하는</option>
		<option value="b">'검색어'가 들어있는</option>
		<option value="c">'검색어'가 들어있지 않은</option>
		<option value="d">'검색어'로 끝나는</option>
	</select>
	<input type="button" value="검색" v-on:click="search(schtype)" />	
	<p>검색결과 : {{ arrTest4 }} </p>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		arrTest: [1, 2, 3, 4, 5, 6],
		arrTest2: [], 
		arrTest3: ["abc", "aab", "bcd", "dfe", "abe", "zaa"], 
		arrTest4: [], 	// arrTest3에서 검색한 결과를 저장할 변수
		keyword: "", 	// 사용자가 입력한 검색어를 저장할 변수 
		schtype: ""		// 검색방법을 저장할 변수
	}, 
	methods: {
		evenData() {
			this.arrTest = this.arrTest.filter(function(val) { 
				return val % 2 == 0; 
			});	// 조건에 맞는 요소들만으로 새로운 배열을 리턴
		}, 
		oddData() {
			this.arrTest2 = this.arrTest.filter(function(val) { 
				return val % 2 == 1; 
			});
		}, search(type) {
			keyword = this.keyword.toLowerCase();
			this.arrTest4 = this.arrTest3.filter(function(val) {
				if (type == "a")		return val.charAt(0) == keyword;	// return val.indexOf(keyword) == 0;
				else if (type == "b")	return val.indexOf(keyword) >= 0;
				else if (type == "c")	return val.indexOf(keyword) == -1;
				else if (type == "d")	return val.charAt(val.length - 1) == keyword;
				
			});
		}
	}
});
</script>

</body>
</html>