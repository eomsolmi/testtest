<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<FreeReply> replyList = (ArrayList<FreeReply>)request.getAttribute("replyList");

int flidx = Integer.parseInt(request.getParameter("flidx"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
.list { margin:20px 0; }
.list td { border-bottom:1px dotted black; }
#writer { width:100px; height:20px; border:1px solid black; padding:2px; }
#content { width:500px; height:75px; border-radius:6px; }
#btn { width:80px; height:75px; }
</style>
</head>
<body>
<h2>Vue.js를 이용한 댓글처리(DB 사용)</h2>
<div id="app">
	작성자 : <input type="text" v-model.trim="writer" id="writer" /><br /><br />
	<textarea v-model.trim="content" placeholder="200자 이내로 입력하세요." id="content" ></textarea>&nbsp;&nbsp;&nbsp;
	<input type="button" v-bind:value="btnValue" id="btn" style="position:absolute;" v-on:click="replyAddUp" /><br />
	남은 글자는 {{leftCnt}} 입니다.<hr />
	<div v-for="item in arrReply" :key="item.fridx">
	<reply-list :object="item" v-on:reply-del="replyDel" v-on:reply-up-form="replyUpForm"></reply-list>
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
			<input type="button" class="btn" value="수정" v-on:click="replyUpForm(object.fridx, object.miid, object.frcontent)" />
			<input type="button" class="btn" value="삭제" v-on:click="replyDel(object.fridx)" />
			</td>
		</tr>
		<tr><td colspan="2"><span v-html="object.frcontent"></span></td></tr>
		<!-- 그냥 출력하면 문자열로 취급하기 때문에 댓글 내용에<br />이 그대로 출력됨 -> v-html -->
		</table>`,	
	methods: {
		replyDel(fridx) { 
			if (confirm("정말 삭제하시겠습니까?")) {
				this.$emit("reply-del", fridx);
			}
		},
		replyUpForm(fridx, miid, frcontent) {
			this.$emit("reply-up-form", fridx, miid, frcontent);
		}
	}
}

new Vue ({
	el : "#app",
	data : {
		arrReply : [
<%
String obj = "";
for (int i = 0 ; i < replyList.size() ; i++) {
	FreeReply fr = replyList.get(i);
	obj = (i == 0 ? "" : ", ") + "{fridx:\"" + fr.getFr_idx() + "\", miid:\"" + fr.getMi_id() + "\", frip:\"" + fr.getFr_ip() + 
		"\", frdate:\"" + fr.getFr_date() + "\", frcontent:\"" + fr.getFr_content() + "\"}";
	out.println(obj);
}
%>
		],
		writer: "",
		content: "", 
		kind: "in",		// 댓글 등록(in) 및 수정(up) 여부
		fridx: "", 		// 댓글 번호로 수정시 사용됨
		btnValue: "댓글달기"
	},
	components : {
		"reply-list" : ReplyList
	},
	methods : {
		replyDel(fridx) {
			axios.get("./replyDel?flidx=<%=flidx%>&fridx=" + fridx)
			.then(response => {		// GET 요청 성공시 실행
				for (var i = 0 ; i < this.arrReply.length ; i++) {
					if (this.arrReply[i].fridx == fridx) {
						this.arrReply.splice(i, 1);
						break;
					}
				}
			})
			.catch(e => {
				alert("댓글 삭제에 실패했습니다. 다시 시도하세요.");
				console.log(e);
			})
			
		},
		replyAddUp() {
		// 댓글 등록 및 수정 처리를 위한 ajax 호출 메소드
			if(this.writer == "" || this.content == "") {
				alert("작성자와 댓글 내용을 입력하세요.");
				return;
			}

			var form = new FormData();	// 가져갈 데이터를 담을 객체
			form.append("flidx", <%=flidx%>);
			form.append("fridx", this.fridx);
			form.append("writer", this.writer);
			form.append("content", this.content);
			
			var url = "./replyAdd";
			if (this.kind == "up")	url = "./replyUp";
			axios({
				url: url, 
				method: "POST", 
				data: form
			})

			.then(response => {
				if (this.kind == "up") {
					for (var i = 0 ; i < this.arrReply.length ; i++) {
						if (this.fridx == this.arrReply[i].fridx) {
							this.arrReply[i].frcontent = this.content.replace(/(?:\r\n|\r|\n)/g, "<br />");
							break;
						}
					}				
				} else {
//					console.log(response.data);
					var obj = JSON.parse(JSON.stringify(response.data));
					// response.data를 json형 스트링(stringify)으로 변경 후
					// 자바스크립트 객체로 변환(parse)시킴	// 배열 아니면 객체
//					console.log(obj.miid);
					var reply = {fridx:obj.fridx, miid:obj.miid, frip:obj.frip, frdate:obj.frdate, frcontent:this.content.replace(/(?:\r\n|\r|\n)/g, "<br />")};
					// content에 들어있는 모든 엔터는 <br />태그로 변경
					this.arrReply.push(reply);
					// arrReply배열의 가장 끝에 댓글 객체 추가
				}
				this.kind = "in";	this.btnValue = "댓글달기";	this.writer = "";	this.content = "";
			})
			.catch(e => {
				console.log("댓글 추가시 오류 발생 : " + e);
			})
		}, 
		replyUpForm(fridx, miid, frcontent) {		// 수정을 위해 폼으로 내용을 전송시키는 메소드
			this.btnValue = "댓글수정";
			this.kind = "up";
			this.fridx = fridx;
			this.writer = miid;
			this.content = frcontent.replace(/(<br>|<br \/>)/g, "\r\n");
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