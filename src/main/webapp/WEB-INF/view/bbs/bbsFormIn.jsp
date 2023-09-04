<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일 업로드</h2>
<form name="frm" action="bbsProcIn" method="post" enctype="multipart/form-data">
	<p><input type="file" name="uploadFile" multiple="multiple" /></p>
	<p><input type="submit" value="업로드" /></p>
</form>
</body>
</html>