<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%
request.setCharacterEncoding("utf-8");
String jsonStr = 
((String)request.getAttribute("jsonStr")).replaceAll("\'", "\"");
JSONParser p = new JSONParser();
JSONArray jsonArr = new JSONArray();
jsonArr = (JSONArray)p.parse(jsonStr);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>선택된 회원 목록</h2>
<table width="400" cellpadding="5">
<tr>
<th width="20%">번호</th>
<th width="40%">아이디</th>
<th width="*">이름(성별)</th>
</tr>
<%
if (jsonArr.size() > 0) {
	int num = jsonArr.size();
	for (int i = 0 ; i < jsonArr.size() ; i++) {
		JSONObject jo = (JSONObject)jsonArr.get(i);
%>
<tr align="center">
<td><%=num %></td>
<td><%=jo.get("id") %></td>
<td><%=jo.get("name") %></td>
</tr>
<%
		num--;
	}
} else {
	out.println("<tr><td colspan='3' align='center'>");
	out.println("데이터가 없습니다.</td></tr>");
}
%>
</table>
</body>
</html>
