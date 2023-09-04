<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL Test View</h2>
<!--  출력만 됨 object 클래스에있는 toString 매소드가 동작하기 때문, 담아서 쓰려고 하면 에러남  -->
sessTest : <%=session.getAttribute("sessTest")  %><br />
이름 : <%=request.getParameter("uname") %>
<hr />
<!-- EL을 이용하여 특정 영역의 값을 출력 -->
sessTest : ${ sessionScope.sessTest }<br />
<!-- EL에 있는 내장객체들 중 sessionScope안에 들어있는 sessTest라는 attribute의 값을 추출하여 출력 (jquery와는 상관없음)-->
이름 : ${ param.uname }
</body>
</html>