<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] arrStr = {"a", "b", "c", "d", "e", "f", "g"};
pageContext.setAttribute("arrStr", arrStr);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>forEach를 이용한 루프</h2>
<table width="600">
<tr>
<td width="200">
</td>
<td width="200">
	<ul>
	<c:forEach var="str" items="${arrStr}">
	<!-- arrStr 배열의 처음부터 끝까지 루프를 돌면서 각 데이터를 str변수에 담음 -->
		<li>${str}</li>
	</c:forEach>
	</ul>
</td>
<td width="200">
	<ul>
	<!-- arrStr 배열의 인덱스 번호 2부터 5까지만 루프 돌면서 출력 -->
	<c:forEach var="str" items="${arrStr}" begin="2" end="5">
		<li>${str}</li>
	</c:forEach>
	</ul>
</td>
<td width="200">
	<ul>
	<!-- arrStr 배열의 인덱스 번호를 2칸식 이동하면서 출력 -->
	<c:forEach var="str" items="${arrStr}" step="2" varStatus="status">
		<li>${status.count}. ${str}</li>
	</c:forEach>
	</ul>
</td>
</tr>
</table>
<hr />
<h2>forTokens를 이용한 루프</h2>
<table width="600">
<tr>
<td width="50%">
	<ul>
	<c:forTokens items="홍길동 전우치 임꺽정 둘리 또치 도우너" delims=" " var="tmp">
		<li>${tmp}</li>
	</c:forTokens>
	</ul>
</td>
<td width="50%">
	<ul>
	<c:forTokens items="홍길동+전우치-임꺽정*둘리/또치_도우너" delims="+-*/_" var="tmp">
		<li>${tmp}</li>
	</c:forTokens>
	</ul>
</td>
</tr>
</table>
<hr />
<table width="800">
<tr>
	<!-- 구구단 출력 -->
	<c:forEach begin="2" end="9" var="num" >
	<td>
		<c:forEach begin="1" end="9" var="count">
			${num} X ${count} = ${count * num}<br />
		</c:forEach>
	</td>
	</c:forEach>
</tr>
</table>
</body>
</html>