<%@ page import="common.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - set 2</title></head>
<body>
    <h4>List 컬렉션 이용하기</h4>
    <%
    //Person 객체를 저장할 수 있는 List계열의 컬렉션 생성
    ArrayList<Person> pList = new ArrayList<Person>();
    //List컬렉션에 객체를 추가한다. 
    pList.add(new Person("성삼문", 55));
    pList.add(new Person("박팽년", 60));
    %>  
    <!-- request영역에 컬렉션을 저장한다.  -->
    <c:set var="personList" value="<%= pList %>" scope="request" />
    <!-- 2개의 객체중 0번 인덱스를 출력한다. List이므로 인덱스로 접근할 수 있다. -->
    <ul>
        <li>이름 : ${ requestScope.personList[0].name }</li> 
        <li>나이 : ${ personList[0].age }</li>
    </ul>

    <h4>Map 컬렉션 이용하기</h4>
    <%
    //Key는 String타입, Value는 Person타입인 Map계열의 컬렉션 생성
    Map<String, Person> pMap = new HashMap<String, Person>();
    //컬렉션에 2개의 객체를 저장한다.
    pMap.put("personArgs1", new Person("하위지", 65));
    pMap.put("personArgs2", new Person("이개", 67));
    %>
    <!-- request영역에 저장한다.  -->
    <c:set var="personMap" value="<%= pMap %>" scope="request" />
    <!-- Map컬렉션이므로 Key를 통해 접근하여 출력한다. -->
    <ul> 
        <li>아이디 : ${ requestScope.personMap.personArgs2.name }</li>
        <li>비번 : ${ personMap.personArgs2.age }</li>
    </ul>
</body>
</html>