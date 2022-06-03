<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<html>
<head>
<title>JSTL - fmt 1</title>
</head>
<body>
	<!-- 
	국제화(Formatting) 태그
	- 국가별로 다양한 언어, 날짜, 시간, 숫자 형식을 설정할 때 사용한다.
	- 접두어로는 fmt를 사용한다.
	 -->
	<h4>숫자 포맷 설정</h4>
	<!-- 변수 생성 -->
	<c:set var="number1" value="12345" />
	<!-- 
	groupingUsed : 세자리마다 콤마를 출력한다. 디폴트 값이 true이므로 콤마를
		출력하고 싶지 않다면 false를 지정해야 한다.
	 -->
	콤마 O : <fmt:formatNumber value="${ number1 }" /><br />
	콤마 X : <fmt:formatNumber value="${ number1 }" groupingUsed="false" /><br />
	<!-- 
	Type이 currency인 경우 현지 통화기호로 출력된다. var 속성 지정 시 
	즉시 출력되지 않고, 원하는 위치에 EL을 통해 출력한다. currencySymbol 속성으로
	통화기호를 변경할 수 있다.
	 -->
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1" />
	통화기호 : ${ printNum1 } <br />
	<!-- value 속성값을 %단위로 변환해서 출력한다. 즉 100을 곱한 결과에 %기호까지 붙여준다. -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2" />
	퍼센트 : ${ printNum2 }
	
	<h4>문자열을 숫자로 변경</h4>
	<!-- 
	Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경한다.
	pattern : 반환할 문자열의 패턴을 지정하여 파싱한다.
	intergerOnly : 소수점 이하를 절삭하여 정수부분만 출력한다.
	 -->
	<c:set var="number2" value="6,789.01" />
	<!-- 
	pattern으로 주어진 부분을 분석하여 문자열을 숫자형식으로 파싱한다.
	 -->
	<fmt:parseNumber value="${ number2 }" pattern="00,000.00" var="printNum3" />
	소수점까지 : ${ printNum3 } <br />
	<fmt:parseNumber value="${ printNum2 }" integerOnly="true" var="printNum4" />
	정수 부분만 : ${ printNum4 }
</body>
</html>