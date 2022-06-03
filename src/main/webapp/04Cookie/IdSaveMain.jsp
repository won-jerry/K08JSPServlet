<%@ page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//loginId 라는 이름의 쿠키를 읽어온다. 
String loginId = CookieManager.readCookie(request, "loginId");

//앞에서 읽어온 쿠키값이 있다면 checked 속성값을 변수에 설정한다.
String cookieCheck = "";
if (!loginId.equals("")) {
    cookieCheck = "checked";
}
%>
<html>
<head><title>Cookie - 아이디 저장하기</title></head>
<body>
    <h2>로그인 페이지</h2>
    <!--  
    폼에서 포커스 이동을 위해 tab버튼을 누르는 경우 작성된 태그순으로 포커스가
    이동하게 되는데, 변경하고 싶다면 tabindex속성을 사용한다. 
    -->
    <form action="IdSaveProcess.jsp" method="post">
    <!--  
    쿠키를 통해 읽어온 값이 있는경우 text상자에는 value속성에 변수를 추가하고
    체크박스에는 checked속성을 추가한다. 
    -->
    아이디 : <input type="text" name="user_id" value="<%= loginId %>" tabindex="1" />  
        <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3" />
        아이디 저장하기
    <br />
    패스워드 : <input type="text" name="user_pw" tabindex="2" />
    <br />
    <input type="submit" value="로그인하기" />
    </form>
</body>
</html>