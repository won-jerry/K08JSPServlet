<%@page import="java.util.Set"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="common.Person"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - forEach 2</title></head>
<body>
    <h4>List 컬렉션 사용하기</h4>
    <%
    //List계열의 컬렉션 생성 및 객체 추가
    LinkedList<Person> lists = new LinkedList<Person>();
    lists.add(new Person("맹사성", 34));
    lists.add(new Person("장영실", 44));
    lists.add(new Person("신숙주", 54));
    %>
    <!-- set태그로 변수 설정 -->
    <c:set var="lists" value="<%= lists %>"/>
    <!-- 확장for문을 이용해서 반복 출력 -->
    <c:forEach items="${ lists }" var="list">
    <li>
        이름 : ${ list.name }, 나이 : ${ list.age }
    </li>
    </c:forEach>
    
    <h4>Java코드를 통한 출력</h4>
    <%
    for(Person p : lists){
    	out.println("이름:"+p.getName()+", 나이:"+p.getAge()+"<br>");	
    }    
    %>    
    

    <h4>Map 컬렉션 사용하기</h4>
    <%
    Map<String,Person> maps = new HashMap<String,Person>();
    maps.put("1st", new Person("맹사성", 34));
    maps.put("2nd", new Person("장영실", 44));
    maps.put("3rd", new Person("신숙주", 54));
    %>
    <c:set var="maps" value="<%= maps %>" />
    <!--  
    Map컬렉션 사용시 key값을 별도로 얻어올 필요없이 객체.key 혹은 
    객체.value를 통해 값을 출력할 수 있다. 
    -->
    <c:forEach items="${ maps }" var="map">
        <li>Key => ${ map.key }  <br />
            Value => 이름 : ${ map.value.name }, 나이 : ${ map.value.age }</li>
    </c:forEach>
    
    
	<h4>Java코드를 통한 출력</h4>
	<%
	//Map컬렉션은 항상 Key값을 먼저 얻어와야 한다. 
	Set<String> keys = maps.keySet();
	//앞에서 얻어온 Key의 갯수만큼 반복한다. 
	for(String k : keys){
		//Key값을 통해 해당 객체를 얻어온다. 
		Person p = maps.get(k);
		//Key를 출력한다. 
		out.println("Key=>"+ k +"<br>");
		//getter를 이용해서 Person객체의 멤버변수값을 출력한다. 
		out.println("Value=>"+ p.getName() +", "+ p.getAge() +"<br>");
	}	
	/*
	JSTL의 확장for문을 사용하면 Key값을 별도로 얻어와야 하는 번거로움이
	없으므로 훨씬 편리하다.
	*/
	%>    
</body>
</html>