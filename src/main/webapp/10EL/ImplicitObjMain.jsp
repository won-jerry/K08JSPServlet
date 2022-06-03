<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//4가지 영역에 동일한 속성명으로 각기 다른값을 저장한다. 
pageContext.setAttribute("scopeValue", "페이지 영역");
request.setAttribute("scopeValue", "리퀘스트 영역");
session.setAttribute("scopeValue", "세션 영역");
application.setAttribute("scopeValue","애플리케이션 영역");
%>     
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 내장 객체</title></head>
<body>
    <h2>ImplicitObjMain 페이지</h2>
    
    <h3>각 영역에 저장된 속성 읽기(JSP내장객체 사용)</h3>
    <ul>
        <li>페이지 영역 : <%=pageContext.getAttribute("scopeValue") %></li>
        <li>리퀘스트 영역 : <%=request.getAttribute("scopeValue") %></li>
        <li>세션 영역 : <%=session.getAttribute("scopeValue") %></li>
        <li>애플리케이션 영역 : <%=application.getAttribute("scopeValue") %></li>
    </ul>
        
    <!--
    4가지 영역에 접근할때 EL의 내장객체를 통해 내용을 출력한다. 
    모두 동일한 패턴으로 "영역명Scope"와 같은 형태로 되어있다.   
    -->
    <h3>각 영역에 저장된 속성 읽기(EL사용)</h3>
    <ul>
        <li>페이지 영역 : ${ pageScope.scopeValue }</li>
        <li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
        <li>세션 영역 : ${ sessionScope.scopeValue }</li>
        <li>애플리케이션 영역 : ${ applicationScope.scopeValue }</li>
    </ul>

	<!--  
	만약 영역명 지정없이 속성을 읽을때는 가장 좁은 영역을 우선으로 출력한다. 
	즉, 여기서는 page영역의 속성을 출력하게된다. 실무에서는 동일한 속성명으로 
	저장하는 경우가 거의 없으므로 대부분 이와같이 사용할 수 있다. 
	-->
    <h3>영역 지정 없이 속성 읽기</h3>
    <ul>
        <li>${ scopeValue }</li> 
    </ul>
    
	<!-- 다음 페이지로 포워드 한다. -->    
    <jsp:forward page="ImplicitForwardResult.jsp" />
</body>
</html>



