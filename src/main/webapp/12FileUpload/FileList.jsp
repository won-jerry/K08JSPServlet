<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<body>
	<h2>업로드된 파일 리스트 보기(디렉토리 읽어오기)</h2>
	<%
	//서버의 물리적 경로 얻어오기
	String saveDirectory = application.getRealPath("/Uploads");
	//경로를 통해 파일 객체를 생성함
	File file = new File(saveDirectory);
	//해당 디렉토리의 파일목록을 배열로 얻어온다.
	File[] fileList = file.listFiles();  
	int fileCnt = 1;
	//갯수만큼 반복하여 출력한다.
	for (File f : fileList){
	%>
		<li>
			파일명<%=fileCnt %> : <%=f.getName() %>
			파일크기 : <%=(int)Math.ceil(f.length() / 1024.0) %>kb
		</li>
	<%	
		fileCnt++;
	}
	%>
	
	<h2>DB에 등록된 파일 리스트 보기</h2>
	<a href="FileUploadMain.jsp">파일 등록하기</a>
	<%
	MyfileDAO dao = new MyfileDAO();
	List<MyfileDTO> fileLists = dao.myFileList();
	dao.close();
	%>
	<table border="1">
		<tr>
			<th>No</th><th>이미지<th/><th>작성자</th><th>제목</th><th>카테고리</th>
			<th>원본 파일명</th><th>저장된 파일명</th><th>작성일</th><th></th>
		</tr>
	<% for (MyfileDTO f : fileLists) { %>
		<tr>
			<td><%= f.getIdx() %></td>
			<td><img src="../Uploads/<%= f.getSfile() %>" width="150"></td>
			<td><%= f.getName() %></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td><%= f.getSfile() %></td>
			<td><%= f.getPostdate() %></td>
			<td><a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(), "UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(), "UTF-8") %>">[다운로드]</a></td>
		</tr>
	<% } %>
	</table>
</body>
</html>