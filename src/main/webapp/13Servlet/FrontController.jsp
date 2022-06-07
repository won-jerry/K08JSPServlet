<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>
	<h3>한 번의 매핑으로 여러 가지 요청 처리하기</h3>
	${ resultValue }
	<ol>
		<li>URI : ${ uri }</li>
		<li>요청명 : ${ commandStr }</li>
	</ol>
	<!-- 요청명은 일괄적으로 .one의 형태로 생성한 후 링크를 걸어준다.
	이러첨 요청명은 우리가 마음대로 네이밍할 수 있다. -->
	<ul>
		<li><a href="../13Servlet/regist.one">회원가입</a></li>
		<li><a href="../13Servlet/login.one">로그인</a></li>
		<li><a href="../13Servlet/freeboard.one">자유게시판</a></li>
	</ul>
	<!-- 해당 요청명은 web.xml을 사용하지 않고 어노테이션을 통해 설정한다.
		FrontController.java를 서블릿으로 생성한다. -->
</body>
</html>