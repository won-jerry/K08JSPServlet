package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

//게시판 목록 요청 처리를 위한 서블릿 클래스
public class ListController extends HttpServlet {
	
	//목록의 경우 메뉴를 클릭한 후 이동하므로 get방식으로 요청하게 된다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//커넥션풀을 이용한 DB연결을 위해 DAO객체 생성
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색어 관련 파라미터 처리
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			//검색어를 입력한 경우에만 Model로 전달하기 위해 저장함
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물의 갯수를 카운트. 검색어가 있는 경우 Map 컬렉션을 통해 전달됨
		int totalCount = dao.selectCount(map);
		
		/* 페이지 처리 start */
		//서블릿에서 web.xml에 접근하기 위해 application 내장 객체를 얻어옴
		ServletContext application = getServletContext();
		//컨텍스트 초기화 파라미터를 얻어옴
		//한 페이지당 출력할 게시물의 갯수
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		//한 블럭당 출력할 페이지번호 갯수 
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		/*
		목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
		특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산해서 얻어옴
		 */
		int pageNum = 1;
		//파라미터로 넘어오는 pageNum이 있다면 값을 얻어와서,
		String pageTemp = req.getParameter("pageNum");
		//정수로 변환한 후 현재 페이지 번호로 지정한다.
		if (pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
		
		//게시물의 구간을 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		//계산된 값은 Model로 전달하기 위해 Map 컬렉션에 저장함
		map.put("start", start);
		map.put("end", end);
		/* 페이지 처리 end */
		
		//현재 페이지에 출력할 게시물을 얻어옴
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		//커넥션풀에 자원 반납
		dao.close();
		
		//페이지 번호를 생성하기 위한 유틸리티 클래스의 메서드 호출
		//모델1 방식의 게시판에서 사용했던 메서드를 그대로 사용한다.
		String pagingImg 
			= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		//View로 전달할 데이터를 Map 컬렉션에 저장
		map.put("pagingImg", pagingImg);//페이지번호
		map.put("totalCount", totalCount);//전체 게시물 수
		map.put("pageSize", pageSize);//한 페이지당 출력할 게시물 수(설정값)
		map.put("pageNum", pageNum);//현재 페이지 번호
		
		//View로 전달할 객체들을 request 영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		//View로 포워드를 걸어준다.
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
}
