<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSON Test Page!!</h2>
<table width="700" cellpadding="5">
<tr>
<td width="25%"><a href="jsObject">Javascript Object</a></td>
<td width="25%"><a href="test01Stringify">stringify() Test</a></td>
<td width="25%"><a href="test02Parse">parse() Test</a></td>
<td width="25%"><a href="whyJson">why json</a></td>
</tr>
<tr>
<td><a href="jsonFile">json file</a></td>
<td><a href="jsonArray1">JSONArray1</a></td>
<!-- 
jsonArray1.jsp에서 자바스크립트 배열을 문자열로 만들어 jsonArray2로 보냄
jsonArray1에서 보낸 문자열을 jsonArray2에서 받은 후
 - 문자열을 JSONArray로 만들어 출력
 - 문자열을 jsonArray2.jsp로 보낸 후 다시 자바스크립트 배열로 변환하여 사용
 -->
<td><a href="jsonArrayDb1">JSONArray2</a></td>
<!-- 
jsonArrayDb1.jsp에서 회원 목록을 보여줌(아이디, 이름(성별), 생년월일, 전화번호, 포인트)
 - 아이디와 이름으로 검색할 수 있음
 - 원하는 회원들을 선택할 수 있음
jsonArrayDb2에서는 jsonArrayDb1.jsp에서 보낸 회원들의 정보들을 
JSONArray로 변경하여 출력
 -->
<td><a href="jsonArray3">JSONArray3</a></td>
</tr>
<tr>
<td><a href="addrOpenApi">Address Open API</a></td>
<td><a href="openApi1">OPEN API 1</a></td>
<td><a href="openApi2">OPEN API 2</a></td>
<td><a href="kakaoMap">Kakao Map</a></td>	<!-- 현재 실행된 위치 / url의 위치 의미함 / 루트에 있는 kakaoMap 부름 -->
</tr>
<tr>
<td><a href="kakaoBook">Kakao Book</a></td>
<td><a href="kakaoLogin">Kakao Login</a></td>
</tr>
</table>
</body>
</html>
