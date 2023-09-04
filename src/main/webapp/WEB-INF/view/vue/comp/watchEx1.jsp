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
	<p>금지문자는 '{{banText}}'</p>
	<textarea v-model="inputText"></textarea>
	<hr />
	<p>금지문자는 '{{banArr}}'</p>
	<textarea v-model="inputText2"></textarea>
</div>
<script>
new Vue({
	el: "#app", 
	data: {
		banText: "바보", 
		inputText: "", 
		banArr: ["어의", "^^", "fuc"], 
		inputText2: ""
	}, 
	watch: {	// 프로퍼티를 감시함
		inputText() {	// inputText프로퍼티가 변경되었을 때 동작
			// inputText 안에 banText가 있으면 alert()창으로 경고 후 삭제 
			if (this.inputText.indexOf(this.banText) >= 0) {	// 입력한 글에 금지어가 있으면
				alert("'" + this.banText + "'은(는) 입력할 수 없습니다.");
				this.inputText = this.inputText.replace(this.banText, "");
			}
		},
		inputText2() {
			for (var i = 0 ; i < this.banArr.length ; i++){
				if (this.inputText2.indexOf(this.banArr[i]) >= 0) {
					alert("'" + this.banArr[i] + "'은(는) 입력할 수 없습니다.");
					this.inputText2 = this.inputText2.replace(this.banArr[i], "");
					break;
				}
			}
		}
	}
});
</script>
</body>
</html>