<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="person" class="common.Person" scope="request" /> 
    <h2>포워드된 페이지에서 매개변수 확인</h2>
    <ul>
    	<!-- request 영역을 통해 공유된 person 객체와 파라미터로 전달된 값을
    	화면에 출력한다. 즉, 자바빈(객체)은 영역의 공유 속성을 이용해서
    	전달할 수 있다. -->
        <li><jsp:getProperty name="person" property="name" /></li> 
        <li>나이 : <jsp:getProperty name="person" property="age" /></li>
        <li>본명 : <%= request.getParameter("param1") %></li> 
        <li>출생 : <%= request.getParameter("param2") %></li>
        <li>특징 : <%= request.getParameter("param3") %></li>
    </ul>
    <jsp:include page="inc/ParamInclude.jsp">
        <jsp:param name="loc1" value="강원도 영월" />
        <jsp:param name="loc2" value="김삿갓면" />
    </jsp:include>
</body>
</html>