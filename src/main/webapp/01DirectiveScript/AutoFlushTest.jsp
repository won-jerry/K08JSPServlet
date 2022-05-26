<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="1kb" autoFlush="false"%>
<!-- 
	JSP는 화면상에 내용을 출력할 때 항상 버퍼에 먼저 저장한다.
	buffer 속성을 통해 버퍼 사용 여부(용량)를 설정할 수 있고
	autoFlush 속성을 통해 버퍼가 꽉 찬 경우 내보내기 할지를 설정한다.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - buffer, autoFlush 속성</title>
</head>
<body>
	<%
	/*
	for문을 통해 10글자(10byte)를 100번 반복해서 출력하므로 1000byte가 된다.
	여기에 html 태그들이 있으므로 해당 페이지의 용량은 1kb를 초과하게 되어
	실행 시 에러가 발생한다. 
	
	해결 방법은 buffer의 용량을 늘리거나, autoFlush를 true로 변경한다.
	*/
	for (int i=1; i<=10000; i++) {
		out.println("abcde12345");
	}
	%>
</body>
</html>