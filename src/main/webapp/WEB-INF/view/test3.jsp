<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1262000/CountryPopulationService2/getCountryPopulationList2'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
// queryParams += '&' + encodeURIComponent('cond[country_nm::EQ]') + '=' + encodeURIComponent('가나'); /**/
// queryParams += '&' + encodeURIComponent('cond[country_iso_alp2::EQ]') + '=' + encodeURIComponent('GH'); /**/
queryParams += '&' + encodeURIComponent('returnType') + '=' + encodeURIComponent('JSON'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
	if (this.readyState == 4) {
		alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		var cont = this.responseText;
		cont = cont.substring(cont.indexOf("[") + 1, cont.indexOf("]"));
		alert(cont);
		var obj = document.getElementById("content");
		obj.innerHTML = cont;
	}
};

xhr.send('');
</script>
</head>
<body>
<div id="content"></div>
</body>
</html>
