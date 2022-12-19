package model2.mvcboard;

import java.util.ArrayList;
import java.sql.SQLException;
import java.util.*;


import common.DBConnPool;
import lombok.NoArgsConstructor;


@NoArgsConstructor

//게시판용 DAO 
public class MVCBoardDAO extends DBConnPool {
	
	//검색조건에 맞는 게시물의 개수를 반환한다.
	public int selectCount(Map<String,Object> map) {
		
		int totalCount = 0;
		//쿼리문 준비
		String query = "select count(*) from mvcboard";
		//검색 조건이 있다면 WHERE절로 추가
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		try {  //위에 ? 값이 없기때문에 변동없는 정적 쿼리문(stmt) 사용 
			stmt = con.createStatement();  //쿼리문 생성
			rs = stmt.executeQuery(query); //쿼리문 실행
			rs.next();
			totalCount = rs.getInt(1);  //검색된 게시물 갯수 저장
		}catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}	
		return totalCount;  //게시물 개수를 서블릿으로 반환
	}
	
	
	
	//검색 조건에 맞는 게시물 목록을 반환한다.(페이징 기능 지원)
	public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
	      
	      List<MVCBoardDTO> board = new ArrayList<>();
	      //쿼리문 준비
	      String query = " "
	                + "SELECT * FROM ( "
	                + "    SELECT Tb.*, ROWNUM rNum FROM ( "
	                + "        SELECT * FROM mvcboard ";
	      //검색 조건이 있다면 WHERE절로 추가
	      if (map.get("searchWord") != null)
	      {
	          query += " where " + map.get("searchField")
	                 + " like '%" + map.get("searchWord") + "%' ";
	      }
	   
	      query += "        order by idx desc "
	             + "    ) Tb "
	             + " ) "
	             + " where rNum between ? and ?";  //게시물 구간은 인파라미터로..
	               
	      try {  //?값이 있기때문에 값에 변동이 있는 동적 쿼리문 (psmt)사용
	          psmt = con.prepareStatement(query);  //동적 쿼리문 생성
	          psmt.setString(1, map.get("start").toString()); //인파라미터 설정
	          psmt.setString(2, map.get("end").toString());
	          rs = psmt.executeQuery();  //쿼리문 실행
	   
	          //반환된 게시물 목록을 List 컬렉션에 추가
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
	      return board;  //목록 반환
	   }
	
	
	
	//게시글 데이터를 받아 DB에 추가한다(파일 업로드 지원)
	public int insertWrite(MVCBoardDTO dto) {
			
		int result = 0;
		
			String query = "insert into mvcboard ( " 
					+ " idx, name, title, content, ofile, sfile, pass) "
					+ " values ("
					+ " seq_board_num.nextval,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			
			result = psmt.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public void updateVisitCount(String idx) {
		String query = "update mvcboard"
				+ " set visitcount = visitcount + 1"
				+ " where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		
		}catch(SQLException e) {
			System.out.println("게시물 조회 수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "select * from mvcboard where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
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
			}
			
		}catch(SQLException e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	
	
	public void downCountPlus(String idx) {
		String sql = "update mvcboard set"
				+ " downcount = downcount + 1"
				+ " where idx = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}catch(Exception e) {
			
		}
	}
	
	
	
	//입력한 비밀번호가 지정한 일련번호의 게시물의 비밀번호와 일치하는지 확인하는 기능
	public boolean confirmPassword(String pass, String idx) {
		
		boolean isCorr = true;
		try {
			String sql = "select count(*) from mvcboard where pass = ? and idx = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) == 0) {
				isCorr = false;
			}
		}catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}
	
	
	
	//지정한 일련번호의 게시물을 삭제하는 기능
	public int deletePost(String idx) {
		
		int result = 0;
		try {
			String query = "delete from mvcboard where idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	//게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신한다.(파일업로드 지원)
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = "update mvcboard set title=?, name=?, content=?, ofile=?, sfile=? where idx=? and pass=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	

	

	
	
}
	
	
