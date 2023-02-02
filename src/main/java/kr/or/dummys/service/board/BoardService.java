package kr.or.dummys.service.board;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.BoardDao;
import kr.or.dummys.dto.Board;

@Service
public class BoardService {
	
	//Mybatis 작업
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//글목록보기 서비스(DB)
	public List<Board> boardList(){
		List<Board> boardList = null;
		
		return boardList;
	}
		


}
