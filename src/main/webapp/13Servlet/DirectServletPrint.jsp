<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DirectServletPrint.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 Servlet에서 직접 출력하기</h2>
	<!-- 컨텍스트루트 경로를 제외한 상대 경로로 링크를 생성 -->
	<form method="post" action="../13Servlet/DirectServletPrint.do">
		<!-- POST 방식으로 요청 -->
		<input type="submit" value="바로가기" />
	</form>
</body>
</html>