<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - forEach2</title></head>
<body>
	<!--
	forEach 태그의 향상된 for문 형태
		: 주로 배열이나 컬렉션에서 값을 순차적으로 접근하고 싶을때 사용한다. 
		속성]
			items : 사용할 배열이나 컬렉션 변수
			var : 해당 loop에서 반환한 객체를 저장할 변수  
	-->
    <h4>향상된 for문 형태의 forEach 태그</h4>
    <%
    String[] rgba = {"Red", "Green", "Blue", "Black"};
    %>
    <c:forEach items="<%= rgba %>" var="c">
        <span style="color:${ c };">${ c }</span>
    </c:forEach>

    <h4>varStatus 속성 살펴보기</h4>
    <!--
    개선되 for문에서의 varStatus속성
    	index : 현제 루프에서의 인덱스를 표현한다. 0부터 시작한다. 
    	current : 현제 루프의 실제요소를 반환한다.
    	count : 실제 반복횟수를 반환한다. 1부터 시작한다.    
    -->
    <table border="1">
    <c:forEach items="<%= rgba %>" var="c" varStatus="loop">
        <tr>
            <td>count : ${ loop.count }</td>
            <td>index : ${ loop.index }</td>
            <td>current : ${ loop.current }</td>
            <td>first : ${ loop.first }</td>
            <td>last : ${ loop.last }</td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
