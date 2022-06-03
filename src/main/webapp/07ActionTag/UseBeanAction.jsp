<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>액션 태그 - UseBean</title></head>
<body>
    <h3>액션 태그로 폼값 한 번에 받기</h3>
    <!--
    폼값을 전송하는 페이지에서 input태그의 name속성과 이를 저장할
    DTO객체의 멤버변수명이 반드시 일치해야하고, 또한 값 설정을 위한
    setter/getter 메서드가 반드시 정의되어 있어야 한다.   
    -->
    <jsp:useBean id="person" class="common.Person" />
    <jsp:setProperty property="*" name="person" />  
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li>  
        <li>나이 : <jsp:getProperty name="person" property="age" /></li> 
    </ul>
</body>
</html>