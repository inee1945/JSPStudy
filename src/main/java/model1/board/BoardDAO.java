package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	public int selectCount(Map<String ,Object>map) {
		int totalCount = 0;
		
		String query = "select count(*) from board";
		if(map.get("searchWord")!=null) {
			query += " where " +map.get("searchField")+ " like '%" + map.get("searchWord")+"%' ";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("게시물 수를 구하는중 예외발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String ,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from board";
		if(map.get("searchWord")!=null) {
			query += " where " +map.get("searchField")+ " like '%" + map.get("searchWord")+"%' ";
		}
		query += " order by num DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
		
				bbs.add(dto);
			}
		}catch(Exception e) {
			System.out.println("게시물조회중 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
	public int insertWrite(BoardDTO dto) {
		int result =0;
		try {
			String query = "insert into board ( "
				 		+ " num,title,content,id,visitcount) "
				 		+ " values ("
				 		+ " seq_board_num.NEXTVAL,?,?,?,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2,  dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
					
		}catch(Exception e) {}
		return result;
	}
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select B.*, M.name "
				+ " from member M inner join board B "
				+ " on M.id=B.id "
				+ " where num = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
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
			System.out.println("게시물 상세내역 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String num) {
		String query = "update board set "
				+ " visitcount = visitcount+1 "
				+ " where num=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
		}catch(Exception e) {
			System.out.println("게시물증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	public int updateEdit(BoardDTO dto) {
		int result =0;
		try {
			String query = " update board set"
					+ " title =? , content=?"
					+ " where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
		result = psmt.executeUpdate();	
		}catch(Exception e) {
			System.out.println("게시물 수정중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int deletePost(BoardDTO dto) {
		int result =0;
		try {
			String query = " delete from board where num=?";
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public List<BoardDTO> selectListPage(Map<String ,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from ( "
				+ " select Tb.*,rownum rNum from ( "
				+ " 	select * from board ";
		if(map.get("searchWord")!=null) {
			query += " where " +map.get("searchField")
			      + " like '%" + map.get("searchWord") + "%' "; 
		}
		query += " order by num desc "
				+ "  )Tb "
				+ " ) "
				+ " where rNum between ? and ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
		
				bbs.add(dto);
			}
		}catch(Exception e) {
			System.out.println("게시물조회중 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
}
