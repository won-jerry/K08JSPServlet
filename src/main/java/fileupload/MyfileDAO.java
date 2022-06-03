package fileupload;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

//DB커넥션풀을 통한 연결
public class MyfileDAO extends DBConnPool {
	
	//파일 및 게시물 입력
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		try {
			//1. 쿼리문 작성
			String query = "INSERT INTO myfile ( "
					+ " idx, name, title, cate, ofile, sfile) "
					+ " VALUES ( "
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";
			//2. prepared 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			//3. 쿼리문 실행
			applyResult = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	//파일 목록 출력
	public List<MyfileDTO> myFileList() {
		List<MyfileDTO> fileList = new Vector<MyfileDTO>();
		
		//레코드를 일련번호를 기준으로 내림파순으로 정렬
		String query = "SELECT * FROM myfile ORDER BY idx DESC";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//레코드의 갯수만큼 반복
			while(rs.next()) {
				//하나의 레코드를 DTO에 저장
	            MyfileDTO dto = new MyfileDTO();
	            
	            dto.setIdx(rs.getString(1));
	            dto.setName(rs.getString(2));
	            dto.setTitle(rs.getString(3));
	            dto.setCate(rs.getString(4));
	            dto.setOfile(rs.getString(5));
	            dto.setSfile(rs.getString(6));
	            dto.setPostdate(rs.getString(6));
	            
	            //DTO 객체를 List 컬렉션에 추가
	            fileList.add(dto);
	        }
		}
	    catch (Exception e) {
	        e.printStackTrace();
	    }
		return fileList;

	}
}
