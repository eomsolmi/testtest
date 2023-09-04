<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
ArrayList<String> arr = new ArrayList<String>();
arr.add("abc");	arr.add("aac");	arr.add("zbc");	arr.add("afa");	arr.add("sfc");	arr.add("zza");
out.println("원본 : " + arr);
%>
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
</div>
<script>
// 자바 실행후 script 실행

new Vue({
	el: "#app", 
	data: {
		arrTest: [
<% for (int i = 0 ; i < arr.size() ; i++) {
	if (i > 0)	out.println(", ");
%>
		"<%=arr.get(i)%>"
<% } %>
		], 
<%
String str = "arrTest2 : [";
for (int i = 0 ; i < arr.size() ; i++) {
	if (i > 0)	str += ", ";
	str += "\"" + arr.get(i) + "\"";
}
str += "]";
out.println(str);
%>
	}
});
</script>

</body>
</html>