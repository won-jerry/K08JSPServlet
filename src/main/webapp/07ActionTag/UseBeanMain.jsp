<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    <%--
    아래 액션태그를 Java코드로 변경하면 다음과 같다. 
    import="common.Person"
    Person person2 = new Person();
    person2.setName("홍길동");
    person2.setAge(33);
    request.setAttribute("person2", person2);
    즉, 클래스를 임포트 한 후 객체를 생성하고 setter를 통해 멤버변수의 값을
    설정한다. 
    하지만 액션태그를 이용하면 다음 한문장으로 처리할 수 있다.
    id="참조변수명" class="패키지를 포함한 클래스명" scope="저장할영역" 
    --%>
    <jsp:useBean id="person" class="common.Person" scope="request" />
    
    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
    <!-- DTO객체의 setter() 메서드를 이용해서 값을 설정한다.  -->
    <jsp:setProperty name="person" property="name" value="임꺽정" /> 
    <jsp:setProperty name="person" property="age" value="41" /> 

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
    <!-- getter()를 통해 값을 출력한다.  -->
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li> 
        <li>나이 : <jsp:getProperty name="person" property="age" /></li> 
    </ul>
</body>
</html>