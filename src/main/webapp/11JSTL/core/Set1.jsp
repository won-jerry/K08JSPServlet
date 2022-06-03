<%@ page import="java.util.Date"%>
<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - set 1</title></head>
<!-- 
	set태그
		: 변수를 선언할때 사용한다. JSP의 setAttribute()와 동일한 기능을 한다. 
		4가지 영역에 새로운 속성을 추가한다. 
	속성정리
		var : 속성명(변수명). 즉 영역에 저장될 이름.
		value : 속성값. 
		scope : 4가지 영역명을 지정. 미 지정시 가장 좁은 page영역을 지정됨.
		target : set태그를 통해 생성된 자바빈즈의 이름을 지정함.
		property : target으로 지정한 자바빈즈의 멤버변수(property)값을 지정함.
-->
<body>
	<!-- 변수선언 -->
	<!-- 1.일반값을 사용함. -->
    <c:set var="directVar" value="100" />
    <!-- 2.EL을 사용함.  --> 
    <c:set var="elVar" value="${ directVar mod 5}" />
    <!-- 3.JSP의 표현식을 사용함.  --> 
    <c:set var="expVar" value="<%= new Date() %>" />
    <!-- 4.value속성을 대신하여 태그 사이에 값 지정함.  --> 
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>
    <!-- 위 4개의 변수는 scope지정이 없으므로 가장 좁은 page영역에 저장된다.  --> 

	<!--  
	속성명이 중복되지 않는다면 영역을 표시하는 내장객체를 생략할 수 있다. 
	-->
    <h4>EL을 이용해 변수 출력</h4>
    <ul>
        <li>directVar : ${ pageScope.directVar }</li>
        <li>elVar : ${ elVar }</li>
        <li>expVar : ${ expVar }</li>
        <li>betweenVar : ${ betweenVar }</li>
    </ul>
    
    <!-- 클래스의 생성자를 통해 객체를 생성한 후 request영역에 저장한다.  -->
    <h4>자바빈즈 생성 1 - 생성자 사용</h4>
    <!-- JSTL은 JSP코드이므로 value속성에 기술할때 객체를 생성하기 위한 더블쿼테이션이
    겹쳐지는 경우가 발생하게 된다. 이때는 value를 싱글쿼테이션으로 감싸서 겹쳐지지 않게
    처리해야 한다. -->
    <c:set var="personVar1" value='<%= new Person("박문수", 50) %>' scope="request" />
    <!-- 자바빈즈의 getter()를 통해 멤버변수의 값을 출력한다.  -->
    <ul> 
        <li>이름 : ${ requestScope.personVar1.name }</li>
        <li>나이 : ${ personVar1.age}</li>
    </ul>
 
 	<!-- 빈 객체를 생성한 후 target, property를 통해 멤버변수의 값을 지정한다. -->
    <h4>자바빈즈 생성 2 - target, property 사용</h4>
    <c:set var="personVar2" value="<%= new Person() %>" scope="request" />
    <c:set target="${personVar2 }" property="name" value="정약용" />
    <c:set target="${personVar2 }" property="age" value="60" />
    <ul>
        <li>이름 : ${ personVar2.name }</li>
        <li>나이 : ${ requestScope.personVar2.age }</li>
    </ul>
</body>
</html>