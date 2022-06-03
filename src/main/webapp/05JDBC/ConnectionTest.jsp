<%@page import="common.DBConnPool"%>
<%@ page import="common.JDBConnect"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<html>
<head><title>JDBC</title></head>
<body>
    <h2>JDBC 테스트 1</h2>
    <%
    JDBConnect jdbc1 = new JDBConnect(); 
    jdbc1.close(); 
    %>


    <h2>JDBC 테스트 2</h2>
    <%
    //application 내장객체의 메서드를 통해 컨텍스트 초기화 파라미터 가져옴.
    String driver = application.getInitParameter("OracleDriver"); 
    String url = application.getInitParameter("OracleURL");
    String id = application.getInitParameter("OracleId");
    String pwd = application.getInitParameter("OraclePwd");
	//인자생성자 호출을 통해 DB 연결
    JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd); 
    jdbc2.close();
    %>
    
    
    <h2>JDBC 테스트 3</h2>
    <%
    JDBConnect jdbc3 = new JDBConnect(application); 
    jdbc3.close();
    %>
    
    
    <h2>커넥션 풀 테스트</h2>
    <%
    DBConnPool pool = new DBConnPool();
    pool.close();
    %>   
</body>
</html>