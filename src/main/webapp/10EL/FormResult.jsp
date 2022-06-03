<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 폼값 처리</title></head>
<body>
	<!--
	폼값이 파라미터를 받을때 EL의 내장객체를 사용할 수 있다. 
	param : 단일값을 받을 때 사용한다. 
	paramValues : 2개 이상의 값을 받을 때 사용한다. 단 이경우 배열을
		통해 값을 구분해야 한다.   
	-->
    <h3>EL로 폼값 받기</h3>
    <ul>
        <li>이름 : ${ param.name }</li>
        <li>성별 : ${ param.gender }</li>
        <li>학력 : ${ param.grade }</li>
        <li>관심사항 : ${ paramValues.inter[0] } 
            ${ paramValues.inter[1] }
            ${ paramValues.inter[2] }
            ${ paramValues.inter[3] }</li>
        <!--  
        checkbox의 경우 체크한 값만 서버로 전송되는데, EL은 
        NullPointerException이 발생하지 않으므로 위와 같이 기술해도 문제없다.
        --> 
    </ul>
    
    
    <h3>JSP내장객체를 통해 폼값 받기</h3>
    <%
    String name = request.getParameter("name");
    String[] interArr = request.getParameterValues("inter");
    
    out.println("이름:"+ name);
    out.println("관심사항1:"+ interArr[0]);
    out.println("관심사항2:"+ interArr[1]);
    /*
    JSP 내장객체를 통해 폼값을 받은 후 출력하는 경우 선택된 값이 1개밖에 없다면
    에러가 발생하게 된다. 이 경우 if문으로 값이 있는지 체크하거나 예외처리를
    해야하므로 EL에 비해서는 불편한 점이 있다. 
    */
    %>
</body>
</html>