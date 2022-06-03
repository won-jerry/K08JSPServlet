<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - choose/when/otherwise</title></head>
<!--  
choose태그
	: 하위에 when, otherwise태그를 가지고 있다. 
	여러 조건이 있는경우 사용하기에 적합하다. 
-->
<body>
 	<!-- 변수 선언 -->
    <c:set var="number" value="100" />
	
    <h4>choose 태그로 홀짝 판단하기</h4>
    <c:choose>
        <c:when test="${ number mod 2 eq 0 }">
            ${ number }는 짝수입니다.
        </c:when>
        <c:otherwise>
            ${ number }는 홀수입니다.
        </c:otherwise>
    </c:choose> 

    <h4>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h4>
    <form>  
        국어 : <input type="text" name="kor" /> <br />
        영어 : <input type="text" name="eng" /> <br />
        수학 : <input type="text" name="math" /> <br />
        <input type="submit" value="학점 구하기" />
    </form>
    <!--  
    실행 초기에는 전송한 폼값이 없는 상태이므로 아무런 결과도 출력되지 않는다. 
    EL의 empty를 통해 파라미터가 빈값인지 확인할 수 있다. 
    -->
    <c:if test="${ not (empty param.kor or empty param.eng or empty param.math) }">
	    <!-- 파라미터로 전달된 국,영,수 점수의 평균값을 구해 avg변수에 저장한다. -->
        <c:set var="avg" value="${ (param.kor + param.eng + param.math) / 3}" />
        평균 점수는 ${avg }으로
        <!-- 각 조건에 맞는 학점을 출력한다.  -->
       
       	<!-- choose와 when 사이에는 HTML주석을 기술할 수 없다. 즉, 텍스트 출력이 
       	허용되는 곳에서만 주석을 사용할 수 있다.  -->
        <c:choose>                	
            <c:when test="${ avg >= 90 }">A 학점</c:when>
            <c:when test="${ avg >= 80 }">B 학점</c:when>
            <c:when test="${ avg ge 70 }">C 학점</c:when>
            <c:when test="${ avg ge 60 }">D 학점</c:when>
            <c:otherwise>F 학점</c:otherwise>
        </c:choose>
        
        입니다.
    </c:if>
       
</body>
</html>