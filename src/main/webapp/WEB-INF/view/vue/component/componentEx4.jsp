<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.test-comp { width: 400px; background:#ffffe0; border:darkorange solid; border-radius:8px; padding:10px; }
</style>
</head>
<body>
<div id="app">
	<!-- nameArray 배열을 이용하여 루프를 돌려 출력 -->
	<test-component v-for="(item, index) in nameArray" v-bind:my-name="item"></test-component>
	<!-- my-name 속성을 vue에서 제어하도록 v-bind명령을 사용하여 배열의 item을 지정 -->
	
</div>
<script>
var TestComponent = {
	template: "<p class='test-comp'>나는 {{myName}} 입니다.</p>", 
	props: {
		myName: String
	}, 
	created() {
		if (this.myName == null) {
			this.myName = "이름없음"
		}
	}
}
	
new Vue({
	el: "#app", 
	data: {
		nameArray: ["홍길동", "전우치", "임꺽정", "둘리", "도우너"]
	}, 
	components: {
		"test-component": TestComponent
	}
});
</script>
</body>
</html>