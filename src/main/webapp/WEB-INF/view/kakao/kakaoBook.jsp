<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#bImg { border:1px solid black; }
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
$(document).ready(function() {	// 문서가 다 준비가 되면 작동을 하자라는 의미
	$("#frmSearch").submit(function() {
	// frmSearch라는 폼에서 서브밋 이벤트가 발생했을 경우
		var query = $("#keyword").val();	// $ : jquery를 쓰겠다는 의미
		// id가 keyword인 컨트롤의 값(value)을 추출하여 query변수에 저장
		var searchWebParam = { "query" : query, "size" : 20 };
		// ajax로 보낸 데이터를 지정한 변수
		
		if (query == "") {
			alert("검색어를 입력하세요.");
			$("#keyword").focus();	return false;
		}
		
		$.ajax({
//			url : "https://dapi.kakao.com/v3/search/book", 
			url : "https://dapi.kakao.com/v2/search/web", 
			dataType : "json", 
			headers : {"Authorization" : "KakaoAK 229a198f900f5d1569f69b262a3a5dd2"}, 
			async : false, 
			type : "get", 
			data : searchWebParam, 
			success : function(r) {
				// 한줄씩 출력
				var searchResult = "";
				$("#result").empty();	// append를 쓸경우 검색결과가 밑에 또 출력되지 않게 초기화후 다시 append함
				$.each(r.documents, function(i, search) {
					searchResult = "<p><a href='" + search.url + "' target='_blank'>"
					+ search.title + "</a><br />날짜 : " + search.datetime.substring(0, 10) +  "</p>";
					$("#result").append(searchResult);
				});
/*
url : 링크, title : 책제목, datetime : 발행일, price : 가격, publisher : 출판사, authors : 저자, thumbnail : 썸네일 이미지
*/
/*
				// 쇼핑몰 형태 출력
				var schResult = "<table width='800' cellpadding='5'>";
				var lnk = "", img = "";
				$.each(r.documents, function(i, search) {
					lnk = "<a href='" + search.url + "' target='_blank'>";
					img = search.thumbnail;
					if (img == "")	img = "${pageContext.request.contextPath}/resources/img/no_img.png";
					
					if (i % 4 == 0)	schResult += "<tr align='center'>";
					
					schResult += "<td width='25%' valign='top'>" + lnk + "<img id='bImg' src='" + img + "' /></a><br />" + lnk + search.title + "</a><br />가격 : " + search.price + "원<br />저자 : " + search.authors + 
					"<br />출판사 : " + search.publisher + "<br />발행일 : " + search.datetime.substring(0, 10) + "</td>";
					
					if (i % 4 == 3)	schResult += "</tr>";
				});
				schResult += "</table>";
				$("#result").html(schResult);
*/
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
	
		return false;	// 서브밋이 되지 않게 함
	});
});
</script>
</head>
<body>
<form id="frmSearch">
<input type="text" id="keyword" />
<input type="submit" value="검색" />
</form>
<hr />
<div id="result"></div>
</body>
</html>