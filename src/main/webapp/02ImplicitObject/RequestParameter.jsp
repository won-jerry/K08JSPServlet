<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<html>
<head><title>내장 객체 - request</title></head>
<body>
<%
//post방식으로 전송된 한글이 깨지는 현상을 처리할때 사용
request.setCharacterEncoding("UTF-8");  
/*
getParameter() : input 태그중 text, radio 타입처럼 하나의 값이 전송될 경우
	사용한다. 받은값은 String타입으로 저장된다. 	
getParameterValues() : checkbox이거나 <select>태그에 multiple 속성을 부여하여
	2개이상의 값이 전송될경우 사용한다. 받은 값은 String 타입의 배열로 저장된다.
*/
String id = request.getParameter("id");  
String sex = request.getParameter("sex");
String[] favo = request.getParameterValues("favo");  
String favoStr = "";
if (favo != null) { 
    for (int i = 0; i < favo.length; i++) {
        favoStr += favo[i] + " ";
    }
}
/*
<textarea> 태그는 두줄 이상 입력이 가능하므로 엔터키는 \r\n으로 저장된다. 
따라서 화면에 출력시에는 <br>태그로 변경해야 한다. 
*/
String intro = request.getParameter("intro").replace("\r\n", "<br/>");  
%>
<ul>
    <li>아이디 : <%= id %></li>
    <li>성별 : <%= sex %></li>
    <li>관심사항 : <%= favoStr %></li>
    <li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>