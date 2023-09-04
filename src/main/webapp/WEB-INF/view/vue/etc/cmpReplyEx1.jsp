<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
.list { margin:20px 0; }
.list td { border-bottom:1px solid #1cad0a; }
.btn { margin-left:20px; width:60px; height:35px; background-color: white; border: 1px solid black; border-radius: 1px; cursor: pointer; }
#writer { width:100px; height:20px; border:1px solid black; padding:2px; }
#content { width:500px; height:75px; border-radius:6px; }
#btn { width:80px; height:75px; }
</style>
</head>
<body>
<h2>Vue.js를 이용한 댓글처리</h2>
<div id="app">
	작성자 : <input type="text" v-model.trim="writer" id="writer" /><br /><br />
	<textarea v-model.trim="content" placeholder="200자 이내로 입력하세요." id="content" ></textarea>&nbsp;&nbsp;&nbsp;
	<input type="button" value="댓글달기" id="btn" style="position:absolute;" v-on:click="replyAdd" /><br />
	남은 글자는 {{leftCnt}} 입니다.<hr />
	<div v-for="item in arrReply" :key="item.fridx">
	<reply-list :object="item" v-on:reply-del="replyDel"></reply-list>
	</div>
</div>
<script>
var ReplyList = {
		props: ["object"],
		template: `
			<table width="600" cellpadding="5" cellspacing="0" class="list">
			<tr>
				<td width="35%">{{object.miid}}&nbsp;({{object.frip}})</td>
				<td width="*" align="right">{{object.frdate}}
				<input type="button" class="btn" value="삭제" v-on:click="replyDel(object.fridx)" />
				</td>
			</tr>
			<tr><td colspan="2">{{object.frcontent}}</td></tr>
			</table>`,	
		methods: {
			replyDel(fridx) {  // component는 일종의 Vue의 자식 (자식쪽에서 부모를 호출하는 법)
				if (confirm("정말 삭제하시겠습니까?")) {
				this.$emit("reply-del", fridx);
				// this.$emit("메소드명-케밥스타일"[, 인수1, 인수2, ...])
				// 자식(컴포넌트)에서 부모(Vue)에 값을 넘겨 주는 방법
				}
			}
		}
}

new Vue ({
	el : "#app",
	data : {
		arrReply : [
			{ fridx:"1", miid:"test1", frip:"127.0.0.1", frdate:"23/08/24 13:22", frcontent:"첫번째 댓글입니다." },
			{ fridx:"2", miid:"test2", frip:"127.0.0.1", frdate:"23/08/24 13:28", frcontent:"두번째 댓글입니다." },
			{ fridx:"3", miid:"test3", frip:"127.0.0.1", frdate:"23/08/24 14:25", frcontent:"세번째 댓글입니다." }
		],
		writer: "",
		content: ""
	},
	components : {
		"reply-list" : ReplyList
	},
	methods : {
		replyDel(fridx) {
		//	alert(fridx); fridx를 component에서 잘 받아오는지 확인
		
		/*	const index = this.arrReply.findIndex((item) => item.fridx === fridx);
			this.arrReply.splice(index, 1); */
			
			for (var i = 0 ; i < this.arrReply.length ; i++) {
				if (this.arrReply[i].fridx == fridx) {
					this.arrReply.splice(i, 1);
					break;
				}
			}
		},
		replyAdd() {
			var idx = 1;
			if (this.arrReply.length > 0) {	// 댓글이 하나라도 있으면
				idx = parseInt(this.arrReply[this.arrReply.length - 1].fridx) + 1;
				// this.arrReply 배열의 마지막 요소의 fridx값에 1을 더한 값을 idx에 저장
			}
			
			var reply = {fridx:idx, miid:this.writer, frip:"127.0.0.1", frdate:getReplyDate(), frcontent:this.content};
			// 새롭게 추가되는 댓글 객체 생성
			
			if(this.writer != "" && this.content != "") {
				this.arrReply.push(reply);
				this.writer = "";
				this.content = "";
			} else {
				alert("작성자와 댓글 내용을 입력하세요.");
			}
			
		}
	},
	computed: {
		leftCnt() {
			var cnt = 200 - this.content.length;
			if (cnt < 1) {
				this.content = this.content.substring(0, 200);
			}
			return 200 - this.content.length;
		}
	}
});

// 23/08/24 14:25
function getReplyDate() {
	var date = new Date();   	// 오늘 날짜 및 시간
	var y = (date.getFullYear() + "").substring(2);
	var m = date.getMonth() + 1;	m = (m < 10 ? "0" + m : m);
	var d = date.getDate();			d = (d < 10 ? "0" + d : d);
	var h = date.getHours();		h = (h < 10 ? "0" + h : h);
	var n = date.getMinutes();		n = (n < 10 ? "0" + n : n);
	return y + "/" + m + "/" + d + " " + h + ":" + n;
}
</script>
</body>
</html>