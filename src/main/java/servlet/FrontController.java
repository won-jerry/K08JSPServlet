package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
어노테이션을 통한 요청명 매핑으로 *를 통해 여러 요청명을 한번에 매핑한다.
즉, .one으로 끝나는 모든 요청에 대해 매핑처리 하였다.
 */
@WebServlet("*.one")
public class FrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		/*
		request 내장객체를 통해 현재 요청된 URL을 얻어온다. //웹브라우저의 주소표시줄의
		전체경로명에서 HOST명(localhost)을 제외한 나머지 경로를 얻어올 수 있다.
		 */
		String uri = req.getRequestURI();
		System.out.println(uri);
		//URL에서 마지막에 있는 /의 index 값을 찾는다.
		int lastSlash = uri.lastIndexOf("/");
		//앞에서 얻는 index를 통해 URL을 자른다. 즉 마지막에 있는 요청명만 남긴다.
		String commandStr = uri.substring(lastSlash);
		//마지막 요청명을 통해 요청을 판단한 후 해당 요청을 처리할 메서드를 호출한다.
		if (commandStr.equals("/regist.one")) registFunc(req); //회원가입요청
		else if (commandStr.equals("/login.one")) loginFunc(req); //로그인요청
		else if (commandStr.equals("/freeboard.one")) freeboardFunc(req); //자유게시판 요청
		
		//요청명과 관련된 변수들을 request 영역에 저장한다.
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		//View로 포워드한다.
		req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req, resp);
	}
	
	/*
	만약 Get 방식의 요청이 들어왔을 때 이를 처리한 doGet() 메서드가 없으면
	405 에러가 발생하게 된다. 즉 해당 방식의 요청을 처리할 수 없다는 의미이다.
	 */
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
//			throws ServletException, IOException {
//		System.out.println("doPost 요청");
//	}
	
	//페이지별 처리 메서드. 요청을 처리한 후 request 영역에 속성값을 저장한다.
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}

	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}
}
