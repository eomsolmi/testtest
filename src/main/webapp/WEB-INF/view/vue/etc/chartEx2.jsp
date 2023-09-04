<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- https://developers.google.com/chart/interactive/docs/gallery/barchart?hl=ko -->
<style>
#chartDiv { height:400px; border:1px solid black; margin:0 0 10px 0; }
</style>
</head>
<body>
<h3>지금 사용하고 있는 언어 투표</h3>
<div id="chartDiv"></div>
<div id="app">
	<!-- 버튼 6개를 for문을 이용하여 출력(dataArray배열 사용) -->
	투표 : <br />
	<span v-for="(item, index) in dataArray" v-if="index > 0">{{item[0]}} : {{item[1]}}
	<input type="button" value="투표" v-on:click="addOne(index)" /><input type="button" value="취소" v-on:click="subOne(index)" />&nbsp;&nbsp;&nbsp;</span>
</div>
<script>
var orgdata = [
	["종류", "투표수", {role:"style"}, {role:"annotation"}], ["C&C++", 7, "red", "C&C++"], ["Java", 13, "#0000ff", "Java"], ["kotlin", 8, "green", "kotlin"], ["Python", 7, "gray", "Python"], ["PHP", 3, "yellow", "PHP"], ["ASP.Net", 2, "pink", "ASP.Net"]
];
// {role:"style"} : 막대 색상 지정을 위한 기능으로 영문색상명이나 16진수 RGB값 사용
// {role:"annotation"} : 막대 라벨 표시를 위한 기능
// 색상 color, opacity, fill-color, fill-opacity, stroke-color, stroke-opacity, stroke-width 등을 추가로 지정할 수 있음

google.charts.load("current", {packages: ["corechart"]});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	var data = google.visualization.arrayToDataTable(orgdata);
	var options = {title: "많이 사용하는 언어", "is3D" : true};
	var chart = new google.visualization.ColumnChart(document.getElementById("chartDiv"));
	// ColumnChart : 세로 막대 차트 / BarChart : 가로 막대 차트
	chart.draw(data, options);
}
</script>
<script>
new Vue({
	el: "#app", 
	data: {
		dataArray: orgdata
	}, 
	methods: {
		addOne(index) {
			var obj = this.dataArray[index];
			obj[1]++;
			this.dataArray.splice(index, 1, obj);
			drawBasic();
		}, 
		subOne(index) {
			var obj = this.dataArray[index];
			obj[1]--;
			this.dataArray.splice(index, 1, obj);
			drawBasic();
		}
	}
});

</script>
</body>
</html>