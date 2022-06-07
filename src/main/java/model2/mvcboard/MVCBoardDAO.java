package model2.mvcboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

//모델2 방식의 자료실형 게시판에서 사용할 DAO 클래스 생성
//DB연결은 커넥션풀(DBCP)을 사용한다.
public class MVCBoardDAO extends DBConnPool{
	
	//부모클래스의 기본생성자 호출을 통해 DB를 연결한다.
    public MVCBoardDAO() {
        super();
    }
    
    //mvcboard 테이블의 게시물의 갯수를 카운트하여 반환한다.
    //목록의 페이징 처리나 게시물의 가상번호 부여에 사용한다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM mvcboard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        
        try {
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);   
            rs.next();   
            totalCount = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount; 
    }
    
    /*
    모델1 방식에서는 board 테이블 및 boardDTO 클래스를 사용했지만
    모델2 방식에서는 mvcboard 테이블 및 MVCBoardDTO 클래스를 사용하므로
    해당 코드만 수정하면 된다.
    
    모델2 방식의 게시판 목록에 대한 페이징 처리 쿼리문 실행
     */
    public List<MVCBoardDTO> selectListPage(Map<String, Object> map) { 
        List<MVCBoardDTO> board = new ArrayList<MVCBoardDTO>();  
        String query = " "
        		+ " SELECT * FROM ( "
    			+ "    SELECT Tb.*, ROWNUM rNum FROM ( "
                + "        SELECT * FROM mvcboard ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += "      ORDER BY idx DESC "
                + "     ) Tb "
                + " ) "
                + " WHERE rNum BETWEEN ? AND ?";
        try {        	
        	psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO(); 
                dto.setIdx(rs.getString(1));   
                dto.setName(rs.getString(2));  
                dto.setTitle(rs.getString(3));      
                dto.setContent(rs.getString(4));   
                dto.setPostdate(rs.getDate(5));  
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));  
                dto.setDowncount(rs.getInt(8));  
                dto.setPass(rs.getString(9));             
                dto.setVisitcount(rs.getInt(10));  
                
                board.add(dto);  
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        return board;
    }
}
