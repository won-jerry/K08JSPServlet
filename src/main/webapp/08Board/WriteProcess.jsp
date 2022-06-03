<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 처리전 로그인 되었는지 확인한다. 글쓰기 페이지에 매우 오랜시간 작업없이
머물렀을경우 session은 끊어질 수 있다.  -->    
<%@ include file="./IsLoggedIn.jsp"%>
<%
//폼값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

//사용자가 입력한 폼값을 저장하기 위해 DTO객체를 생성한다. 
BoardDTO dto = new BoardDTO();
//DTO에 데이터를 저장한다. 
dto.setTitle(title);
dto.setContent(content);
//특히 작성자 아이디의 경우 폼값이 아닌 session영역에 저장된 데이터를 이용한다. 
dto.setId(session.getAttribute("UserId").toString());

//DAO객체 생성을 통해 DB연결 및 회원정보를 입력한다. 
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto); 
dao.close();

if (iResult == 1) {
	//글쓰기에 성공하면 리스트로 이동한다. 
    response.sendRedirect("List.jsp");
} else {
	//실패한 경우에는 글쓰기 페이지로 이동하기 위해 뒤로 이동한다. 	
    JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>