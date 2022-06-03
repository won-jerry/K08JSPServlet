package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

/*
web.xml에 매핑을 하는 대신 @WebServlet 어느테이션을 사용하여
요청명에 대한 매핑을 한다. 편한 방식이지만 차후 유지보수를 위해서는
요청명과 서블릿 클래스의 관계를 명확히 해둔 상태에서 사용해야 한다.
 */
@WebServlet("/13Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet{

@Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	//request영역에 속성값 저장
	req.setAttribute("message","@webServlet으로 매핑");
	//JSP로 포워드를 걸어준다.
	req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp); }
}
