<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.trans1-enter-active, .trans1-leave-active { transition: 0.5s; }
/* 나타나고 있을 때와 사라질 때 걸리는 시간을 0.5초 */
.trans1-enter, .trans1-leave-to { opacity: 0; transform:translateY(20px); }
/* 나타나기 전의 상태와 사라진 상태는 투명도 0, 밑으로(y축) 20이동하면서 투명해짐 */
.trans2-enter-active, .trans2-leave-active { transition: 0.5s; }
.trans2-enter, .trans2-leave-to { opacity: 0; transform:translateY(50px); }
</style>
</head>
<body>
<div id="app">
	<label><input type="checkbox" v-model="isOK" />보이기/숨기기</label>
	<transition name="trans1">
		<p v-if="isOK">표시/비표시의 애니메이션</p>
	</transition>
	<hr />
	<input type="button" v-bind:value="btn" v-on:click="showHide" /><br />
	<transition name="trans2">
		<div v-if="isVisible">
			아이디 : <input type="text" placeholder="아이디"/><br />
			비밀번호 : <input type="password" placeholder="비밀번호"/>
		</div>
	</transition>
</div>
<script>
new Vue({
	el: "#app",
	data: {
		isOK: false, 
		isVisible: false, 
		btn: "보이기"
	}, 
	methods: {
		showHide() {
			// this.isVisible = !this.isVisible;
			if (this.isVisible) {
				this.isVisible = false; 
				this.btn = "보이기";
			} else {
				this.isVisible = true; 
				this.btn = "숨기기";
			}
		}
	}
});
</script>
</body>
</html>