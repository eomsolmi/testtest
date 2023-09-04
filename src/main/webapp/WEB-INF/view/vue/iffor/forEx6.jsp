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
	<input type="button" value="오름차순정렬" v-on:click="sortAsc(arrTest)" />
	<input type="button" value="내림차순정렬" v-on:click="sortDesc(arrTest)" />
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		arrTest: ["one", "two", "three", "four", "five"]
	}, 
	methods: {
		sortAsc(arr) {
			arr.sort(function(a, b) {
				return (a < b ? -1 : 1);
			});
		}, 
		sortDesc(arr) {
			arr.sort(function(a, b) {
				return (a > b ? -1 : 1);
			});
		}
	}
});
</script>

</body>
</html>