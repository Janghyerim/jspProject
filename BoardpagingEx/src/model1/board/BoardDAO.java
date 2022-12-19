package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import common.JDBConnect;
import oracle.net.aso.r;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM board";
		
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + "  "
					+ "like '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String, Object> map){
		
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board";
		
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + "  "
					+ "like '%" + map.get("searchWord") + "%'";
		} 
		
		query += " order by num desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//+페이징 기능 넣기
	public List<BoardDTO> selectListPage(Map<String, Object> map){
		
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		//쿼리문 템플릿
		String query= " select * from ("
					+ "    select Tb.*, rownum rNum from ("
					+ "        select * from board";
		//검색 조건 추가
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField")
					+" like '%" + map.get("searchWord") + "%' ";
		}
		
		query += "      order by num desc"
			   + "     ) Tb"
			   + " ) "
			   + " where rNum between ? and ?";
		
		try {
			//쿼리문 완성
			psmt = conn.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			//쿼리문 실행
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				//한 행(게시물 하나)의 데이터를 DTO에 저장
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				//반환할 결과 목록에 게시물 추가
				bbs.add(dto);
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		//목록 반환
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		
		int result = 0;
		String query = "insert into board (num,title,content,id,visitcount)"
				+ " values(seq_board_num.nextval,?,?,?,0)"; 

		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void updateVisitCount(String num) {
		String query = "update board set"
				+ " visitcount = visitcount + 1"
				+ " where num = ?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate(); //실행 문장
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO selectView(String num) {
		String query = "select b.*,m.name"
				+ " from member m inner join board b"
				+ " on m.id = b.id"
				+ " where num = ?";
		
		BoardDTO dto = new BoardDTO();
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			//쿼리문 템플릿
			String query = "UPDATE board SET"
						+ " title=?, content=? "
						+ " WHERE num=?";
			
			//쿼리문 완성
			psmt = conn.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			//쿼리문 실행
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//지정한 게시물을 삭제하는 기능
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			//쿼리문 템플릿
			String query = "DELETE FROM board WHERE num=?";
			
			//쿼리문 완성
			psmt = conn.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			//쿼리문 실행
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result; //결과 반환
	}
}
