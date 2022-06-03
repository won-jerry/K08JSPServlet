<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 컬렉션</title></head>
<body>
<h2>List 컬렉션</h2>
<%
//List컬렉션을 Object 기반으로 생성한다. 
List<Object> aList = new ArrayList<Object>();
//아래와 같이 선언해도 Object기반의 컬렉션이 된다.
//List aList2 = new ArrayList();

//String객체 추가
aList.add("청해진");
//Person객체 추가
aList.add(new Person("장보고", 28));
//page영역에 저장한다. 
pageContext.setAttribute("Ocean", aList); 
%>
<ul>
	<!-- String객체가 출력된다. ArrayList는 배열의 특성이 있으므로 인덱스로 접근할수있다. -->
    <li>0번째 요소 : ${ Ocean[0] }</li> 
    <!-- Person객체가 출력된다. 멤버변수명을 통해 getter()를 호출하여 출력한다. -->
    <li>1번째 요소 : ${ Ocean[1].name }, ${ Ocean[1].age }</li>
    <!-- 2번 인덱스에는 아무런 값도 없으므로 출력되지 않는다. Java코드라면 예외가 
    발생하겠지만, EL은 기본적인 예외는 발생되지 않는다. -->
    <li>2번째 요소 : ${ Ocean[2] } </li>
</ul>
<h2>Map 컬렉션</h2>
<%
Map<String, String> map = new HashMap<String, String>();
//한글을 Key로 설정하여 값을 저장한다. 
map.put("한글", "훈민정음"); 
//영문을 key로 사용한다. 
map.put("Eng", "English");
//page영역에 속성값을 저장한다. 
pageContext.setAttribute("King", map); 
%>
<ul>
	<!-- key값이 영문이 경우 아래 3가지 방법 모두 사용할 수 있으나, 한글인 경우
	.(점)으로 출력할 수 없다. -->
    <li>영문 Key : ${ King["Eng"] }, ${ King['Eng'] }, ${ King.Eng }</li>
    <li>한글 Key : ${ King["한글"] }, ${ King['한글'] }, \${King.한글 }<!-- 에러발생됨 --> </li>
    <!-- EL앞에 \(역슬러쉬)를 붙히면 주석이 된다.  -->
</ul>
</body>
</html>