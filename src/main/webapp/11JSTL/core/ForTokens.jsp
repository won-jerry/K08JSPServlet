<%@page import="org.w3c.dom.css.RGBColor"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="UTF-8">
<head><title>JSTL - forTokens</title></head>
<body>
    <%
    String rgba = "Red,Green,Blue,Black";
    %>
    <!--      
    forTokens태그의 속성
    	items : 구분자를 포함한 문자열(컬렉션, 배열은 사용할 수 없다)
    	delims(delimiter) : 구분자(여러가지 특수기호를 사용할 수 있다)
    	var : 구분자를 통해 잘라낸 토큰을 저장한다. 
    -->
    <h4>JSTL의 forTokens 태그 사용</h4>
    <c:forTokens items="<%= rgba %>" delims="," var="color">
        <span style="color:${ color };">${ color }</span> <br />
    </c:forTokens>
    
    
    <h4>StringTokenizer 클래스 사용</h4>
    <%
    //문자열과 구분자를 인자로 생성자를 통한 객체생성
    StringTokenizer tokens = new StringTokenizer(rgba, ",");
    out.println("토큰수 : "+ tokens.countTokens() +"<br>");
    //인출할 토큰이 있는지 확인
    while(tokens.hasMoreTokens()){
    	//해당 루프의 토큰을 인출한다. 
    	String token = tokens.nextToken();
    	out.println(token +"<br>");
    }    
    %>    
    
    <h4>String 클래스의 split() 메서드 사용</h4>
    <%
    //구분자를 통해 나눈 결과를 문자열 배열로 반환한다. 
    String[] colorArr = rgba.split(",");
    for(String s : colorArr){
    	out.println(s +"<br>");
    }    
    %>
</body>
</html>
