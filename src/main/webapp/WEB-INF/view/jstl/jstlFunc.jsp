<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL에서는 문자열 함수 사용</h2>
\${fn:length("abcd efg") } : ${fn:length("abcd efg") }
<br /><!-- 8 -->
\${fn:toUpperCase("aBcD eFg") } : ${fn:toUpperCase("aBcD eFg") }
<br /><!-- ABCD EFG -->
\${fn:toLowerCase("aBcD eFg") } : ${fn:toLowerCase("aBcD eFg") }
<br /><!-- abcd efg -->
<hr />
\${fn:substring("aBcD eFg", 2, 6) } : ${fn:substring("aBcD eFg", 2, 6) }
<br /><!-- cD e -->
\${fn:substringBefore("aBcD eFg", "c") } : ${fn:substringBefore("aBcD eFg", "c") }
<br /><!-- aB -->
\${fn:substringAfter("aBcD eFg", "c") } : ${fn:substringAfter("aBcD eFg", "c") }
<br /><!-- D eFg -->
<hr />
\${fn:trim("    aBcD eFg    ") } : ${fn:trim("    aBcD eFg    ") }
<br /><!-- aBcD eFg -->
\${fn:replace("aBcD eFg", "c", "z") } : ${fn:replace("aBcD eFg", "c", "z") }
<br /><!-- aBzD eFg -->
\${fn:indexOf("aBcD eFg", "e") } : ${fn:indexOf("aBcD eFg", "e") }
<br /><!-- 5 -->
<hr />
\${fn:startsWith("aBcD eFg", "abc") } : ${fn:startsWith("aBcD eFg", "abc") }
<br /><!-- false -->
\${fn:endsWith("aBcD eFg", "g") } : ${fn:endsWith("aBcD eFg", "g") }
<br /><!-- true -->
<hr />
\${fn:contains("aBcD eFg", "cd") } : ${fn:contains("aBcD eFg", "cd") }
<br /><!-- false -->
\${fn:containsIgnoreCase("aBcD eFg", "cd") } : ${fn:containsIgnoreCase("aBcD eFg", "cd") }
<br /><!-- true -->
\${fn:escapeXml("<a> Tag is Link") } : ${fn:escapeXml("<a> Tag is Link") }
<br /><!--  &lt;a&gt; Tag is Link (페이지 소스보기에서 이렇게 보임) -->
<hr />
<!-- "ab-cd-ef-gh" 문자열을 하이픈을 기준으로 arr배열로 생성 후 출력 -->
<c:set var="arr" value="${fn:split('ab-cd-ef-gh', '-') }" />
\${fn:split('ab-cd-ef-gh', '-') } : 
<c:forEach var="v" items="${arr }">
	${v }<br />
</c:forEach>
<!-- arr 배열을 쉼표를 기준으로 하나의 문자열로 생성후 출력 -->
\${fn:join(arr, ',') } : ${fn:join(arr, ',') } <!-- ab,cd,ef,gh -->
</body>
</html>