<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값받기
String num = request.getParameter("num");

//DTO 객체와 DB연결 및 기존 게시물 가져오기
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

//세선 영역에 저장된 아이디를 문자열로 반환
//4가지 영역의 데이터는 모두 Object 타입이므로 비교를 위해 String형으로 변환
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

//현재 삭제하는 사람이 해당 글의 작성자가 맞는지 확인
if (sessionId.equals(dto.getId())) { //작성자 본인이 맞으면,
	
	//DTO 객체에 일련번호를 저장한 후 DAO로 매개변수 전달
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	//연결해제
	dao.close();
	
	if (delResult == 1) {
		//게시물 삭제에 성공하면 리스트로 이동한다.
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	}
	else {
		JSFunction.alertBack("삭제에 실패했습니다.", out);
	}
}
else { //작성자 본인이 아니면 삭제할 수 없음
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>    