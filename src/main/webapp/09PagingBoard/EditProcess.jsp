<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
//폼값 받기
String num = request.getParameter("num"); 
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO에 폼값 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content); 

//DAO객체 생성 및 게시물 수정을 위한 메서드 호출
BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if (affected == 1) {
	//수정이 정상적으로 처리된 경우에는 1이 반환되고, 상세보기로 이동한다. 
    response.sendRedirect("View.jsp?num=" + dto.getNum()); 
} 
else {
	//실패한 경우에는 뒤로 이동한다.
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>
