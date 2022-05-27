<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//page 영역과 request 영역에 속성값 저장
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>
	<!-- 
	페이지 이동의 경우 새로운 요청을 하는 것이므로 완전히 서로 다른 페이지를
	의미한다. 따라서 page 영역, request 영역 모두 공유되지 않는다.
	 -->
	<h3>sendRedirect를 통한 페이지 이동</h3>
	<%
	//response.sendRedirect("ForwardSub.jsp");
	%>
	
	<!-- 
	포워드된 페이지에서는 request 영역이 공유된다. 주소줄에는 최초 요청한
	페이지의 경로가 보여지지만, 사용자는 포워드된 페이지의 내용을 보게 된다. 
	액션 태그를 사용하면 아래와 같이 표현이 간결해 진다.
	 -->
	<h2>액션 태그를 이용한 포워딩</h2>
	<jsp:forward page="/07ActionTag/ForwardSub.jsp" />
	<%
	//자바코드를 통한 포워딩
	//request.getRequestDispatcher("/07ActionTag/ForwardSub.jsp").forward(request, response);
	%>
</body>
</html>