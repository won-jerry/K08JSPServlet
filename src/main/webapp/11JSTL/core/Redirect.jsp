<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<head><title>JSTL - redirect</title></head>
<body>
	<!--  
	redirect태그
		: 태그가 실행되는 즉시 페이지 이동된다. 
		새로운 페이지에 대한 요청이므로 request영역은 공유되지 않는다. 
		절대경로 사용시 컨텍스트 루트 경로는 제외한다. 
	-->
    <c:set var="requestVar" value="MustHave" scope="request" />
    <c:redirect url="/11JSTL/inc/OtherPage.jsp">
        <c:param name="user_param1" value="출판사" />
        <c:param name="user_param2" value="골든래빗" />
    </c:redirect>
    
    <!--  
    response내장객체를 통한 이동에서는 컨텍스트루트 경로를 반드시 기술해야한다. 
    또한 파라미터가 한글인 경우 깨짐 현상이 발생하므로 URLEncode클래스를 통해 
    인코딩 처리를 해줘야한다.
    -->
    <h4>JSP 내장객체를 통한 페이지 이동</h4>
    <%--
    String p1 = URLEncoder.encode("출판사");
    String p2 = URLEncoder.encode("골든래빗");
    
    response.sendRedirect(request.getContextPath() 
    		+"/11JSTL/inc/OtherPage.jsp?user_param1="+p1+"&user_param2="+p2);
    --%>
</body>
</html>