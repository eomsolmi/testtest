<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");
MemberInfo mi = (MemberInfo)session.getAttribute("loginInfo");
ArrayList<FreeReply> replyList = 
	(ArrayList<FreeReply>)request.getAttribute("replyList");
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
.content { width:500px; height:75px; border-radius:6px; }
#btn { width:80px; height:75px; }
.btn2 { width:50px; height:30px; font-size:0.7em; margin-left:15px; }
.gnbImg { margin-left:10px; cursor:pointer; }
.gnbText { font-size:0.8em; font-weight:normal; }
</style>
</head>
<body>
<% if (mi == null) { %><a href="loginSpr">로그인-SPR</a><hr />
<% } else { %><a href="logout">로그아웃</a><hr /><% } %>
<h2>Vue.js를 이용한 댓글 처리(DB 사용 및 좋아요/싫어요)</h2>
<div id="app">
	<table width="600" cellpadding="5">
	<tr>
	<td width="500">
		<textarea v-model.trim="content" class="content" <% if (mi == null) { %>v-on:click="goLogin"<% } %> placeholder="<%=(mi == null) ? "로그인 후 사용하실 수 있습니다." : "200자 이내로 입력하세요."%>"></textarea>
		남은 글자는 {{leftCnt}} 입니다.
	</td>
	<td width="*" valign="top">
		<input type="button" v-on:click="replyAddUp" v-bind:value="btnValue" id="btn" />
	</td>
	</tr>
	<tr><td colspan="2"><hr /></td></tr>
	</table>
	<div v-for="item in arrReply" v-bind:key="item.fridx">
		<reply-list v-bind:object="item" v-on:reply-gnb="replyGnb" v-on:reply-gnb="replyAnswer" v-on:reply-del="replyDel" v-on:reply-up-form="replyUpForm"></reply-list>
	</div>
</div>
<script>
var ReplyList = {
	props: ["object"], 
	template:`
		<table width="600" cellpadding="5" class="list">
		<tr>
		<td width="35%">{{object.miid}} ({{object.frip}})</td>
		<td width="*" align="right">{{object.frdate}}
		<img src="resources/img/thumbs-up.png" v-on:click="replyGnb('good', object.fridx)" width="12" class="gnbImg" title="좋아요" />
		<span class="gnbText">{{object.frgood}}</span>
		<img src="resources/img/thumbs-down.png" v-on:click="replyGnb('bad', object.fridx)" width="12" class="gnbImg" title="싫어요" />
		<span class="gnbText">{{object.frbad}}</span>
		<input type="button" v-on:click="replyUpForm(object.fridx, object.isGrant)" value="수정" class="btn2" />
		<input type="button" v-on:click="replyDel(object.fridx, object.isGrant)" value="삭제" class="btn2" />
		</td>
		</tr>
		<tr><td colspan="2"><span v-html="object.frcontent"></span></td></tr>
		</table>`, 
	methods: {
		replyGnb(kind, fridx) {
		<% if (mi == null) { %>
			alert("로그인 후 사용하실 수 있습니다.");	return;
		<% } else { %>
			this.$emit("reply-gnb", kind, fridx);
		<% } %>
		}, 
		replyDel(fridx, isGrant) {
			if (isGrant == "false") {
				alert("삭제 권한이 없습니다.");	return;
			}
			if (confirm("정말 삭제하시겠습니까?")) {
				this.$emit("reply-del", fridx);
				// this.$emit("메소드명-케밥스타일"[, 인수1, 인수2, ...])
				// 자식(컴포넌트)에서 부모(vue)에 값을 넘겨주는 방법
			}
		}, 
		replyUpForm(fridx, isGrant) {
			if (isGrant == "false") {
				alert("수정 권한이 없습니다.");	return;
			}
			this.$emit("reply-up-form", fridx);
		}
	}
}

new Vue({
	el: "#app", 
	data: {
		arrReply: [
<%
String obj = "", isGrant = "false";
for (int i = 0 ; i < replyList.size() ; i++) {
	FreeReply fr = replyList.get(i);
	if (mi != null && fr.getMi_id().equals(mi.getMi_id()))	isGrant = "true";
	else	isGrant = "false";
	obj = (i == 0 ? "" : ", ") + 
	"{fridx:\"" + fr.getFr_idx() + "\", miid:\"" + fr.getMi_id() + 
	"\", frip:\"" + fr.getFr_ip() + "\", frdate:\"" + 
	fr.getFr_date() + "\", frgood:\"" + fr.getFr_good() + 
	"\", frbad:\"" + fr.getFr_bad() + "\", frcontent:\"" + 
	fr.getFr_content() + "\", isGrant:\"" + isGrant + "\"}";
	out.println(obj);
}
%>
		], 
		content: "", 
		kind: "in", 	// 댓글 등록(in) 및 수정(up) 여부
		fridx: "", 		// 댓글 번호로 수정시 사용됨
		btnValue: "댓 글\n달 기"
	}, 
	components: {
		"reply-list": ReplyList
	}, 
	computed: {
		leftCnt: function() {
			var cnt = 200 - this.content.length;
			if (cnt < 1) {
				this.content = this.content.substring(0, 200);
			}
			return 200 - this.content.length;
		}
	}, 
	methods: {
		goLogin() {
			location.href="loginSpr";
		}, 
		replyGnb(kind, fridx) {
			axios.get("./replyGnb?fridx=" + fridx + "&kind=" + kind)
			.then(response => {
				var obj = JSON.parse(JSON.stringify(response.data));
				console.log(obj);
				if (obj == '-1') {
					alert("이미 참여했습니다.");
				} else {
					for (var i = 0 ; i < this.arrReply.length ; i++) {
						if (this.arrReply[i].fridx == fridx) {
							if (kind == "good") {
								this.arrReply[i].frgood = parseInt(this.arrReply[i].frgood) + 1;
							} else {
								this.arrReply[i].frbad = parseInt(this.arrReply[i].frbad) + 1;
							}
							break;
						}
					}
				}
			})
			.catch(e => {	// GET요청 실패시 실행할 코드
				console.log(e);
			})
		}, 
		replyDel(fridx) {
			axios.get("./replyDel?fridx=" + fridx + "&flidx=<%=flidx%>")
			.then(response => {	// GET요청 성공시 실행할 코드
				for (var i = 0 ; i < this.arrReply.length ; i++) {
					if (this.arrReply[i].fridx == fridx) {
						this.arrReply.splice(i, 1);
						break;
					}
				}
				console.log(response);
			})
			.catch(e => {	// GET요청 실패시 실행할 코드
				alert("댓글 삭제에 실패했습니다. 다시 시도하세요.");
				console.log(e);
			})
		}, 
		replyAddUp() {
		// 댓글 등록 및 수정 처리를 위한 ajax호출 메소드
			if (this.content == "") {
				alert("댓글 내용을 입력하세요.");		return;
			}

			var form = new FormData();	// 가져갈 데이터를 담을 객체
			form.append("flidx", <%=flidx%>);
			form.append("fridx", this.fridx);
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
						if (this.arrReply[i].fridx == this.fridx) {
							this.arrReply[i].frcontent = 
								this.content.replace(/(?:\r\n|\r|\n)/g, "<br />");
							break;
						}
					}
				} else {
					var obj = JSON.parse(JSON.stringify(response.data));
					var reply = {
						fridx:obj.fridx, 	miid:obj.miid, 
						frip:obj.frip, 	 	frdate:obj.frdate, 
						frgood:0, 	frbad:0, 	isGrant:"true", 
						frcontent:this.content.replace(/(?:\r\n|\r|\n)/g, "<br />")
					}
					this.arrReply.push(reply);
				}
				this.kind = "in";	this.btnValue = "댓 글\n달 기";
				this.writer = "";	this.content = "";
			})
			.catch(e => {
				console.log("댓글 추가시 오류 발생 : " + e);
			})
		}, 
		replyUpForm(fridx) {	// 수정을 위해 폼으로 내용을 전송시키는 메소드
			this.kind = "up";
			this.fridx = fridx;
			this.btnValue = "댓 글\n수 정";
			for (var i = 0 ; i < this.arrReply.length ; i++) {
				if (this.arrReply[i].fridx == fridx) {
					this.content = 
					this.arrReply[i].frcontent.replace(/(<br>|<br \/>)/g, "\r\n");
					break;
				}
			}
		}
	}
});
</script>
</body>
</html>
