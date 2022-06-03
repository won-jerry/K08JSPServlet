<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pValue = "방랑시인";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
	<!-- 자바빈생성 : request영역에 저장 -->
    <jsp:useBean id="person" class="common.Person" scope="request" />
    <!-- 값 설정 -->
    <jsp:setProperty name="person" property="name" value="김삿갓" /> 
    <jsp:setProperty name="person" property="age" value="56" />
    <!-- 다음 페이지로 포워드. 이때 3개의 파라미터를 전달한다.  -->
    <jsp:forward page="ParamForward.jsp?param1=김병연">
        <jsp:param name="param2" value="경기도 양주" />
        <jsp:param name="param3" value="<%=pValue%>" />
    </jsp:forward> 
    <!-- 
   	쿼리스트링으로 param1을 전달하고, 액션태그를 통해 2개를 전달한다.
   	시작태그와 종료태그를 나눠서 작성하는 경우, 태그사이에 HTML주석을 기술하면
   	에러가 발생한다  
   	-->
</body>
</html>





