<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 페이지에서 사용자가 입력한 회원정보 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

//application 내장객체를 통해 web.xml에 입력된 DB접속정보를 읽어옴
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC를 통해 오라클 접속
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//받아온 아이디, 패스워드를 매개변수로 메서드 호출. 일치하는 회원정보가 있는지 확인함.
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//DB 작업이 끝나면 자원해제
dao.close();

if (memberDTO.getId() != null){
	//회원인증(로그인)에 성공한 경우
	/*
	세션 영역에 아이디와 이름을 저장한다.
	session 영역은 페이지를 이동하더라도 웹브라이저를 닫을 때까지는 영역이 공유되어
	접근할 수 없다.
	*/
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	response.sendRedirect("LoginForm.jsp");
}
else {
	//인증에 실패한 경우
	/*
	리퀘스트 영역에 실패메세지를 저장한다. request 영역은 하나의 요청을 완료할 때까지
	영역을 공유한다. 즉 요청을 전달하는 기능이므로 포워드된 페이지까지 데이터를
	공유할 수 있다.
	*/
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//로그인 페이지로 포워드(요청 전달) 한다.
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>