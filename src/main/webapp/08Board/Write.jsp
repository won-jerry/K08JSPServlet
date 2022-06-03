<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지 진입전 로그인을 확인한다. 만약 로그인 되지 않았다면 
로그인 페이지로 이동한다. -->    
<%@ include file="./IsLoggedIn.jsp"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>
<!-- 액션태그를 통해 공통링크 페이지를 인클루드 한다.  -->
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<!-- 글쓰기 처리에는 반드시 post방식을 사용한다. get방식은 전송량의 제한이 있으므로
HTML태그와 같이 매우 긴 내용을 전송하지 못할수도 있기 때문이다.  -->
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);">
    <!-- 작성자 아이디의 경우 session영역에 저장된 회원인증정보를 가져다가
    사용할 것이므로 별도의 <input> 이 필요하지 않다.  -->
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>