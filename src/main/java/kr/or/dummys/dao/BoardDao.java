package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.dummys.dto.Board;

public interface BoardDao {
	
	//게시물 개수
	int getBoardCount(String field, String query) throws ClassNotFoundException, SQLException;
		
	//전체 게시물
	List<Board> boardList(int page, String field, String query) throws ClassNotFoundException, SQLException;

}
