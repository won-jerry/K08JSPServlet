<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Session</title></head>
<body>
	<!-- 액션 태그를 통해 공통링크로 사용할 페이지를 인클루드한다. -->
	<jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <!-- 
    삼항연산자를 통해 request 영역에 저장된 속성값이 있는 경우에만
    에러메세지를 화면에 출력한다. 해당 속성을 로그인 처리 페이지에서
    회원정보를 찾지 못한 경우 request 영역에 속성값을 저장한다.
     -->
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("UserId") == null) {
    	/*session 영역에 저장된 속성값이 없다면 로그아웃 상태이다.
    	그러므로 로그인 폼이 화면에 출력되어야 한다. */
    %>
    <script>
    /* 로그인 폼의 입력값을 검증하기 위한 함수로 빈값인지를 확인한다. */
    function validateForm(form) {
    	//입력값이 공백인지 확인 후 경고창, 포커스이동, 폼값전송중단 처리를 한다.
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            form.user_id.focus();
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
    <!-- 
    폼값 체크를 위한 validateForm() 함수 호출 시 <form> 태그의 DOM 객체를
    this를 통해 전달한다.
     -->
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
    } else { 
    	/*session 영역에 저장된 속성값이 있다면 로그인된 상태이다.
    	그러므로 회원정보 및 로그아웃 버튼을 화면에 출력한다. */
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>

</html>