package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 생성을 위해 첫번째로 HttpServlet을 상속한다.
public class DirectServletPrint extends HttpServlet {
	
	/*
	사용자의 요청을 처리한 메서드를 오버라이딩한다. 여기서는
	post방식의 요청이므로 doPost()를 오버라이딩하면 된다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//서블릿에서 직접 HTML태그를 출력하기 위해 문서의 컨텐츠 타입을 설정
		resp.setContentType("text/html;charset=UTF-8");
		//직접 출력하기 위해 PrintWriter 객체를 생성
		PrintWriter writer = resp.getWriter();
		//출력한 내용을 기술한다.
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
}
