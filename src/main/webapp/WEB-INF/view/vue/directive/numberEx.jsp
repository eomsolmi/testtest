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
	<!-- numberText1이라는 프로퍼티에 저장하는 텍스트필드 생성 / 텍스트필드에 저장된 값에 100을 더하여 출력 -->
	<input type="number" v-model="numberText1" /><br /><!-- input type="number" : 숫자만 입력받음 -->
	<p>100에 더해서 표시 : {{ 100 + numberText1 }}</p>
	<hr />
	<input type="number" v-model.number="numberText2" /><br />
	<!-- 입력된 값을 숫자형 데이터로 변경하여 프로퍼티에 저장 -->
	<p>100을 더해서 표시 : {{ 100 + numberText2 }}</p>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		numberText1: 0, 
		numberText2: 0
	}
});
</script>
</body>
</html>