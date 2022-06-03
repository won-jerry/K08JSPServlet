<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head><title>JSTL - url</title></head>
<body>
	<!--  
	url태그
	-url을 생성할때 사용한다. 
	-절대경로로 생성시에는 컨텍스트 루트 경로를 제외한다. 
	-var속성을 미지정 할때에는 해당 위치에 즉시 URL이 출력된다. 
	-param태그로 지정한 값은 쿼리스트링으로 연결된다. 
	-->
    <h4>url 태그로 링크 걸기</h4>
    <c:url value="/11JSTL/inc/OtherPage.jsp" var="url"> 
        <c:param name="user_param1" value="Must" /> 
        <c:param name="user_param2">Have</c:param> 
    </c:url>
    <a href="${url }">OtherPage.jsp 바로가기</a> 
</body>
</html>