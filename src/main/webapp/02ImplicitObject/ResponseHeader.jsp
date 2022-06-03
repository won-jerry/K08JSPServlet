<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//get방식으로 전송된 폼값을 날짜형식을 통해 타임스템프로 변경한다. 
/*
	addDateHeader(헤더명, long타임의 타임스템프)
	: 응답헤더중 날짜를 추가하는 메서드로 세계표준시를 사용해서 설정한다. 
	대한민국은 표준시 +09, 즉 9시간이 느리므로 9시간을 더해줘야 정상적인
	날짜가 출력된다. 만약 9시 이전의 시간이 설정되면 어제날짜가 나오게된다. 
*/
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date="+add_date);
//숫자형식으로 전송된 값은 정수로 변경한다. 
int add_int = Integer.parseInt(request.getParameter("add_int"));
//<form>태그를 통해 전송되는 모든 값은 문자열로 저장된다. 
String add_str = request.getParameter("add_str");

/*
add계열의 메서드를 통해 응답헤더에 값을 추가한다. 
set계열의 메서드는 기존의 응답헤더값을 수정한다. 	
*/
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);
//기존의 값을 '안중근'으로 수정한다. 
response.setHeader("myName", "안중근");
%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>응답 헤더 정보 출력하기</h2>
    <%
    //getHeaderNames() 메서드를 통해 응답헤더명을 얻어온후..
    Collection<String> headerNames = response.getHeaderNames();
    for (String hName : headerNames) {
    	//반복하면서 응답헤더값을 얻어온다. 
        String hValue = response.getHeader(hName);
    %>
        <li><%= hName %> : <%= hValue %></li>
    <%
    } 
    /*
    첫번째 출력결과에서는 myNumber라는 헤더명이 2번 출력되는데 동일한 값이 출력된다. 
    이것은 getHeader()메서드의 특성으로 처음 입력한 헤더값만 출력되게 된다. 
    */
    %>
    
    <h2>myNumber만 출력하기</h2>
    <%
    /*
    myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는 각각의 값이
    정상적으로 출력된다. 즉 add계열의 메서드는 헤더명을 동일하게 사용하더라도
    헤더값은 정상적으로 추가된다. 
    */
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<!-- 8282, 1004가 순서대로 출력된다.  -->
		<li>myNumber : <%= myNum %></li> 
	<%
	}
	/*
	이처럼 응답헤더에는 개발자가 원하는 값을 추가할 수 있으므로
	프로그램에 여러형태로 응용할 수 있다.
	*/
	%>
</body>
</html>



