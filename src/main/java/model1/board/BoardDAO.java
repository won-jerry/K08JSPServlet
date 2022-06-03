package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;//DB연결을 위한 클래스로 패키지가 다르므로 import해야한다. 

public class BoardDAO extends JDBConnect {
	
	//DAO클래스의 생성자. 부모클래스의 생성자 호출을 통해 DB에 연결한다. 
    public BoardDAO(ServletContext application) {
        super(application);
    }
    
    /*
    board테이블에 저장된 게시물의 갯수를 카운트하기 위한 메서드.
    카운트 한 결과값을 통해 목록 출력시 게시물의 순번을 출력한다.
    만약 검색어가 있는 경우를 대비해서 Map컬렉션을 매개변수로 선언한다.  
    */
    public int selectCount(Map<String, Object> map) {
    	//카운트 변수
        int totalCount = 0;
        //쿼리문 작성
        String query = "SELECT COUNT(*) FROM board ";
        //검색어가 있는 경우 where절을 조건부로 추가한다. 
        if (map.get("searchWord") != null) {
        	/*
        	만약 제목에 '노트북'이라고 검색했다면...
        	=> where title like '%노트북%' 
        	과 같이 쿼리문이 추가될 것이다.  
        	*/
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        
        try {
        	//?가 없는 정적쿼리문이므로 Statement객체를 통해 실행한다. 
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);   
            //count(*)를 통한 쿼리문은 항상 0 혹은 정수의 결과가 있으므로 if문이 필요없다.
            //next() 메서드를 통해 결과를 한행 읽어온다.  
            rs.next();   
            //결과값을 변수에 저장한다. 
            totalCount = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }
        //결과값을 반환한다. 
        return totalCount; 
    }
    /*
    목록에 출력할 게시물을 오라클로부터 추출하기 위한 쿼리문을 실행한다. 
    */
    public List<BoardDTO> selectList(Map<String, Object> map) { 
    	
    	/*
    	select한 게시물의 목록은 다수의 레코드가 포함되므로 이를 저장하기 위해
    	순서를 보장하는 List계열의 컬렉션이 필요하다. Set컬렉션은 순서를 보장하지
    	못하므로 게시판 목록을 출력하는 용도로는 사용할 수 없다.
    	 */
    	//List<BoardDTO> bbs = new Vector<BoardDTO>(); 
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();  

        /*
        목록에 출력할 게시물을 추출하기 위한 쿼리문으로 항상 일련번호(작성순)의
        역순(내림차순)으로 정렬해야 한다. 게시판의 목록은 최근 게시물이 제일
        위쪽에 노출되기 때문이다. 
         */
        String query = "SELECT * FROM board "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {        	
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);  
            
            //추출된 결과에 따라 갯수만큼 반복한다. 
            while (rs.next()) {
            	//하나의 레코드를 읽어서 추출한 후 DTO객체에 저장한다. 
            	//DTO객체를 생성한 후..
                BoardDTO dto = new BoardDTO(); 
                //각 멤버변수에 해당하는 컬럼을 매칭하여 데이터를 저장한다. 
                dto.setNum(rs.getString("num"));          
                dto.setTitle(rs.getString("title"));      
                dto.setContent(rs.getString("content"));   
                dto.setPostdate(rs.getDate("postdate"));  
                dto.setId(rs.getString("id"));             
                dto.setVisitcount(rs.getString("visitcount"));  
                
                //하나의 레코드를 DTO에 저장한 후 List컬렉션에 추가한다. 
                bbs.add(dto);  
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        //List.jsp로 컬렉션을 반환한다.
        return bbs;
    }
    //사용자가 입력한 내용을 board테이블에 입력(insert) 처리한다. 
    public int insertWrite(BoardDTO dto) {
    	//입력결과 확인용 변수
    	int result = 0;
        
        try {
        	//인파라미터가 있는 동적 쿼리문 작성(사용자의 입력에 따라 달라짐)
            String query = "INSERT INTO board ( "
                         + " num,title,content,id,visitcount) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL, ?, ?, ?, 0)";  
            //동적쿼리문 실행을 위한 prepared객체 생성
            psmt = con.prepareStatement(query);   
            //인파라미터 설정
            psmt.setString(1, dto.getTitle());  
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());
            //쿼리문실행 : 행에 영향을 미치는 쿼리이므로 executeUpdate()메서드 사용함.
            //	입력에 성공하면 1, 실패하면 0을 반환한다. 
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    //상세보기를 위해 매개변수로 전달된 일련번호에 해당하는 게시물을 인출한다.
    public BoardDTO selectView(String num) { 
        
    	BoardDTO dto = new BoardDTO();
    	
        //join을 이용해서 member테이블의 name컬럼까지 가져온다. 
        String query = "SELECT B.*, M.name " 
                     + " FROM member M INNER JOIN board B " 
                     + " ON M.id=B.id "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);   
            rs = psmt.executeQuery();
            //일련번호는 중복되지 않으므로 if문으로 처리한다. 
            //게시판 목록처럼 여러개의 레코드를 가져온다면 while문을 사용하면된다. 
            if (rs.next()) { 
            	//DTO에 레코드의 내용을 추가한다.
                dto.setNum(rs.getString(1)); 
                dto.setTitle(rs.getString(2));//인덱스를 통해 값 인출
                dto.setContent(rs.getString("content"));//컬럼명을 통해 값 인출
                dto.setPostdate(rs.getDate("postdate"));//날짜타입이므로 getDate()로 인출
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString(6));
                dto.setName(rs.getString("name")); 
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return dto; 
    }
    //게시물의 조회수를 1증가 시킨다. 
    public void updateVisitCount(String num) {
    	//게시물의 일련번호를 매개변수로 받은 후 visitcount를 1증가시킨다. 
    	//해당 컬럼은 number타입이므로 덧셈이 가능하다.
        String query = "UPDATE board SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE num=?";
        
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);   
            psmt.executeQuery();   
        } 
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    //게시물 수정하기
    public int updateEdit(BoardDTO dto) { 
        int result = 0;        
        try {
        	//특정 일련번호에 해당하는 게시물을 수정한다. 
            String query = "UPDATE board SET "
                         + " title=?, content=? "
                         + " WHERE num=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            //적용된(수정된) 행의 갯수가 반환된다. 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; 
    }
    //게시물 삭제를 위해 delete쿼리문을 실행한다. 
    public int deletePost(BoardDTO dto) { 
        int result = 0;

        try {
            String query = "DELETE FROM board WHERE num=?"; 
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 
            //적용된(삭제된) 행의 갯수를 반환한다. 
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;  
    }
    
    //게시판의 페이징 처리를 위한 메서드
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();  
        
        /*
        3개의 서브쿼리문을 통해 각 페이지에 출력할 게시판 목록을 
        인출할 수 있는 쿼리문을 작성한다.(자세한 내용은 JDBC실습.sql 참조)
         */
        String query = " SELECT * FROM ( "
        			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
                    + "        SELECT * FROM board ";
        //검색조건추가. 검색어가 있는 경우에만 where절이 추가된다. 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }        
        query += "      ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";
        /*
        between절 대신 비교연산자를 사용하면 다음과 같이 수정할 수 있다. 
        => where rNum>=? and rNum<=? 
        */
        
        //문자열을 연결할때는 StringBuffer클래스를 사용하면 유용하다.
//      StringBuffer sb = new StringBuffer();
//      sb.append("select * from ");
//      sb.append("  (select tb.*, rownum rNum from ");
//      sb.append("    (select * from board order by num desc) tb) ");
//      sb.append(" where rNum>=? and rNum<=?");
//      sb.toString();

        try {
            psmt = con.prepareStatement(query);
            /*
            인파라미터 설정 : JSP에서 해당 페이지에 출력할 게시물의 구간을
            	계산한 후 Map컬렉션에 저장하고 DAO로 전달하면 해당 값으로 
            	쿼리문을 완성한다. 
             */
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            // 쿼리문 실행 
            rs = psmt.executeQuery();
            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                //반환할 결과 목록을 List컬렉션에 추가한다.
                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        return bbs;
    }
    
    
}



