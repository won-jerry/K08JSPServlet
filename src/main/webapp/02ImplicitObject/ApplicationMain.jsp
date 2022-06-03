<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head><title>내장 객체 - application</title></head>
<body>	
    <h2>web.xml에 설정한 내용 읽어오기</h2>
    <!-- <context-param> 으로 설정한 값을 내장객체를 통해 읽어올수 있다. -->
    초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>
 
 	<!--
 	이클립스에서는 우리가 직접 작성한 파일을 실행하는것이 아니고 metadata폴더 
 	하위에 프로젝트와 동일한 환경을 만들어서 복사본 파일이 실행된다. 
 	따라서 아래의 물리적 경로는 metadata하위의 경로가 출력된다.  
 	-->
    <h2>서버의 물리적 경로 얻어오기</h2>
    application 내장 객체 : <%= application.getRealPath("/02ImplicitObject") %>

    <h2>선언부에서 application 내장 객체 사용하기</h2>
    <%!
    /*
    선언부에서 내장객체를 바로 사용하는건 불가능하다. 
    내장객체는 _jspService() 메서드내에서 생성된 지역변수 이므로 더 넓은 지역인
    선언부에서 사용하려면 매개변수로 전달받아야 한다. 
    */
    public String useImplicitObject() {
    	/*
    	방법1 : getServletContext() 메서드를 통해 선언부에서 application
    		내장객체를 얻어올 수 있다.
    	*/
        return this.getServletContext().getRealPath("/02ImplicitObject");
    }
    public String useImplicitObject(ServletContext app) {
    	/*
    	방법2 : 스크립트렛에서 메서드 호출시 application내장객체를 매개변수로
    		전달해서 사용한다. 
    	*/
        return app.getRealPath("/02ImplicitObject");
    }
    %>
    <ul>
        <li>this 사용 : <%= useImplicitObject() %></li>
        <li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
    </ul>
</body>
</html>
