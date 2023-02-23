package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Schema;

public interface BoardDao {
	
	//게시물 개수
	public int getBoardCount(String field, String query) throws ClassNotFoundException, SQLException;
		
	//전체 게시물
	public List<Board> boardList(@Param("board_kind") String board_kind, int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	//게시글 작성(insert)
	public int boardWrite(Board n) throws ClassNotFoundException, SQLException;
	
	//게시글 상세보기
	public Board boardDetail(String seq) throws ClassNotFoundException, SQLException;
	
	//게시물 수정(update)
	public int boardUpdate(Board board) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제(delete)
	public int boardDelete(String seq) throws ClassNotFoundException, SQLException;
	
	public int insertBoardSchema(int board_no, int schema_no);
	
	public Schema getBoardSchema(int board_no);
}
