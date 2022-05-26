<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	포함되는 페이지를 만들 때에도 반드시 page지시어는 있어야 한다.
	page 지시어가 없는 JSP 파일은 오류가 발생한다.
 --%>
<%
LocalDate today = LocalDate.now();
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>