<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.donestyle { text-decoration:line-through; color:lightgray; }
</style>
</head>
<body>
<div id="app">
	<div v-for="(todo, index) in todos">
		<label>
			<input type="checkbox" v-model="todo.done" />
			<span v-bind:class="{donestyle:todo.done}">{{todo.text}}</span>
			<span v-bind:class="{donestyle:todo.done}"> (완료일 : {{todo.expDate}})</span>
			<input type="button" v-on:click="extendDate(index)" value="완료일 연장" />
		</label>
	</div>
	<input type="text" placeholder="할일" v-model.trim="todo" v-on:keyup.enter="addToDo" />
	<input type="text" placeholder="완료일" v-model.trim="dueDate" v-on:keyup.enter="addToDo" />(YYYYMMDD 형식으로 입력)
	<p>
		<input type="button" value="처리완료 삭제" v-on:click="cleanToDo" />
		<input type="button" value="할일 순으로 정렬" v-on:click="sortData('todo')" />
		<input type="button" value="완료일로 정렬" v-on:click="sortData('date')" />
	</p>
	<p>{{todos.length}}건 중 {{remaining}}건 처리, {{overdate}} 완료일 지남</p>
</div>
<script>
new Vue({
	el: "#app",
	data: {
		todos: [
			{done:false, text:"회의참석", expDate : "20230821"}, 
			{done:false, text:"사이트작업", expDate : "20230925"}, 
			{done:false, text:"사이트디버깅", expDate : "20231004"}, 
			{done:false, text:"사이트오픈", expDate : "20231005"}, 
			{done:false, text:"회식", expDate : "20230825"}
		], 
		todo: "",
		dueDate: ""

	}, 
	computed: {
		remaining() {
			return this.todos.filter(function(val) {
				return val.done;
			}).length;
		}, 
		overdate() {
			return this.todos.filter(function(val) {
				var date = new Date();
				var y = date.getFullYear();
				var m = new String(date.getMonth() + 1);
				var d = new String(date.getDate()); 
				if (m.length == 1)	m = "0" + m;
				if (d.length == 1)	d = "0" + d;
				var today = y + m + d;
				// 오늘 날짜를 expDate와 비교하기 위해 문자열로 변형시킴
				
				return val.expDate < today;
				// 완료일이 오늘 날짜 보다 작으면 완료일이 지난 상태
			}).length;
		}
	},  
	methods: {
		addToDo() {
			if (this.todo) {	
				var due_date = this.dueDate;
				if (this.dueDate == "") {	// 완료일을 입력하지 않았으면
					var date = new Date();
					date = new Date(Date.parse(date) + 1 * 1000 * 60 * 60 * 24);
					// 오늘 날짜에서 하루를 더한 날짜 데이터를 date에 저장
					var year = date.getFullYear();
					var month = new String(date.getMonth() + 1);
					var day = new String(date.getDate());
					if (month.length == 1)	month = "0" + month;
					if (day.length == 1)	day = "0" + day;
					due_date = year + month + day;
				}
				this.todos.push({done:false, text:this.todo, expDate:due_date});
				this.todo = "";
				this.dueDate = "";
			}
		},
		cleanToDo() {
			this.todos = this.todos.filter(function(val) {
				return val.done == false;
			});
		}, 
		extendDate(index) {		// 완료일 연장
			var str_date = this.todos[index].expDate;	// 현재 완료일
			var y = str_date.substring(0, 4);
			var m = str_date.substring(4, 6);
			var d = str_date.substring(6);
//			alert(y + ", " + m + ", " + d);
			
			var date = new Date(Date.parse(new Date(y, m - 1, d)) + 1 * 1000 * 60 * 60 * 24);
			// Date.parse() : 날짜를 1970.01.01 부터 밀리초 단위로 리턴
			
			var year = date.getFullYear();
			var month = new String(date.getMonth() + 1);
			var day = new String(date.getDate());
			if (month.length == 1)	month = "0" + month;
			if (day.length == 1)	day = "0" + day;
			
			this.todos[index].expDate = year + month + day;
			
			
		},
		sortData(type) {	// 할 일 목록 정렬
			if (type == "todo"){
				this.todos.sort(function(a, b) {
					return (a.text < b.text ? -1 : 1);
				});
			} else {
				this.todos.sort(function(a, b) {
					return (a.expDate < b.expDate ? -1 : 1);
				});
			}
		}
	}
});
</script>
</body>
</html>