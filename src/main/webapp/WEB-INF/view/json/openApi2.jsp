<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.*" %>
<%
request.setCharacterEncoding("utf-8");
// JSONArray dataList = (JSONArray)request.getAttribute("dataList");
ArrayList dataList = (ArrayList)request.getAttribute("dataList");
// JSONArray는 기본적으로 List를 구현한 객체이기 때문에 ArrayList로도 변환이 가능
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if (dataList.size() > 0) {
	for (int i = 0 ; i < dataList.size() ; i++) {
		JSONObject jo = (JSONObject)dataList.get(i);
		out.println(jo.get("html_origin_cn") + "<hr />");
	}
} else {
	out.println("데이터가 없습니다.");
}
%>
</body>
</html>
