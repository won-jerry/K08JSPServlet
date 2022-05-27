<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//외부파일의 경로를 변수로 설정한다.
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

pageContext.setAttribute("pAttr", "동명왕");
request.setAttribute("rAttr", "온조왕");
%>
<html>
<head><title>지시어와 액션 태그 동작 방식 비교</title></head>
<body>
	<h2>지시어와 액션 태그 동작 방식 비교</h2>
	<h3>지시어로 페이지 포함하기</h3>
	<!-- 
	지시어의 경우 페이지의 경로를 문자열의 형태로만 기술할 수 있다.
	표현식을 통해 변수를 사용할 수 있다.
	 -->
	<!-- 정상적으로 문서가 포함됨 -->
	<%@ include file="./inc/OuterPage1.jsp" %>
	<!-- 에러발생됨 -->
	<%--@ include file="<=outerPath1OuterPage1%>" --%>
	
	<!-- 
	지시어를 통한 인클루드는 포함할 파일의 소스를 그래도 현재 문서에
	포함시킨 후 컴파일을 진행한다. 따라서 하나의 페이지라 생각하면 된다.
	그러므로 newVar1은 정상적으로 출력된다.
	 -->
	<p>외부 파일에 선언한 변수 : <%=newVar1%></p>
	
	<h3>액션 태그로 페이지 표현하기</h3>
	<!-- 
	액션태그의 경우 문자열과 표현식 둘 다 사용할 수 있다.
	 -->
	<jsp:include page="./inc/OuterPage2.jsp" />
	<jsp:include page="<%=outerPath2%>" />
	
	<!-- 
	액션태그를 통한 인클루드는 포함할 파일을 먼저 실행(컴파일)한 후
	실행된 결과를 해당 문서에 포함시킨다. 따라서 외부파일에서 선언한
	변수를 현재 페이지에서 사용할 수 없게 된다.
	 -->
	<!-- 에러발생됨 -->
	<p>외부 파일에 선언한 변수 : <%--=newVar2 --%></p>
	
	<!-- 
	include 지시어와 액션태그의 차이점
	지시어
		- jsp 소스를 그대로 포함시킨 후 페이지를 컴파일한다.
			따라서 같은 페이지를 의미한다.
		- 서로 다른 페이지를 의미하므로 page 영역은 공유되지 않는다.
		- 하지만 forward처럼 하나의 요청을 공유하므로 request 영역은 공유된다.
	액션태그
    	-jsp소스를 먼저 실행한 후 실행된 결과를 포함시킨다.
    	-따라서 기존페이지에서 선언된 변수는 포함시킨 페이지에서 사용할 수 없다.
    	-서로 다른 페이지를 의미하므로 page영역은 공유되지 않는다.
    	-하지만 forward처럼 하나의 요청을 공유하므로 request영역은 공유된다.
    	-HTML만 있는 경우 주로 사용한다.
	 -->
	
</body>
</html>















