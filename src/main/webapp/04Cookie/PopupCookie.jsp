<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>    
<%
/*
	trimDirectiveWhitespaces : 지시어 속성중 상단의 불필요한 공백을 삭제하는 
		기능을 가진다. 콜백데이터는 해당 페이지에 출력되는 모든 소스코드를 
		반환하게 되는데 공백도 하나의 문자이므로 필요없는경우 제거하는것이 좋다.
*/

//하루동안 열지않음 체크박스를 체크한후 닫기버튼을 누르면 값 1이 파라미터로 전달된다.
String chkVal = request.getParameter("inactiveToday");

//파라미터의 값이 null 아닌 동시에 1이라면 쿠키를 아래와 같이 생성한다. 
if (chkVal != null && chkVal.equals("1")) {	
    //쿠키명과 쿠키값 설정하여 쿠키생성
	Cookie cookie = new Cookie("PopupClose", "off");
    cookie.setPath(request.getContextPath());
  	//유효기간설정(1일:86400초)
    cookie.setMaxAge(60*60*24);
  	//응답헤더에 쿠키를 실어 클라이언트로 전송
    response.addCookie(cookie);
  	//콜백데이터 출력
    out.println("쿠키 : 하루 동안 열지 않음"); 
}
%>