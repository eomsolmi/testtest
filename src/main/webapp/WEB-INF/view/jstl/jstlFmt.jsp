<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Number Format</h2>
<h3>parseNumber : 789.970</h3>
<c:set var="amount" value="789.970" />
<fmt:parseNumber var="j" type="number" value="${amount }" />
amount : ${j }<br /><!-- 789.97 -->
<fmt:parseNumber var="j" type="number" integerOnly="true" value="${amount }" />
amount : ${j }<br /><!-- 789 -->
<hr />
<h3>numberFormat : 9850.14115</h3>
<c:set var="amount" value="9850.14115" />
<p>type="currency" : <fmt:formatNumber value="${amount }" type="currency" /></p>
<!-- ￦9,850 -->
<p>type="number" groupingUsed="true" : <fmt:formatNumber value="${amount }" type="number" groupingUsed="true" /></p>
<!-- 9,850.141 -->
<p>type="number" maxIntegerDigits="3" : <fmt:formatNumber value="${amount }" type="number" maxIntegerDigits="3" /></p>
<!-- 850.141 -->
<p>type="number" maxFractionDigits="6" : <fmt:formatNumber value="${amount }" type="number" maxFractionDigits="6" /></p>
<!-- 9,850.14115 -->
<p>type="number" pattern="###.###$" : <fmt:formatNumber value="${amount }" type="number" pattern="###.###$" /></p>
<!-- 9850.141$ -->
<hr />
<h2>Date Format</h2>
<c:set var="now" value="<%=new java.util.Date() %>" />
<!-- jstl에서는 time 패키지를 지원하지 않아 Date클래스를 사용해야 함 -->
<p>normal : <fmt:formatDate value="${now }" /></p>
<!-- 2023. 7. 26 -->
<p>timeStyle-default : <fmt:formatDate value="${now }" type="both" dateStyle="default" timeStyle="default" /></p>
<!-- 2023. 7. 26 오전 10:45:48 -->
<p>timeStyle-short : <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short" /></p>
<!-- 23. 7. 26 오전 10:45 -->
<p>timeStyle-medium : <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium" /></p>
<!-- 2023. 7. 26 오전 10:45:48 -->
<p>timeStyle-long : <fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long" /></p>
<!-- 2023년 7월 26일 (수) 오전 10시 45분 48초 -->
<p>timeStyle-full : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /></p>
<!-- 2023년 7월 26일 수요일 오전 10시 45분 48초 KST -->
<p>timeStyle-pattern : <fmt:formatDate value="${now }" type="both" pattern="yyyy년MM월dd일hh일mm분ss초" /></p>
<!-- 2023년07월26일10일45분48초 -->
</body>
</html>