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
	public List<Board> boardList(String pg, String f, String q){
		
		//default 값 설정
				int page = 1;
				String field = "TITLE";
				String query = "%%";
				
				if(pg !=null && ! pg.contentEquals("")) {
					page = Integer.parseInt(pg);
				}
				
				if(f != null && ! f.contentEquals("")) {
					field = f;
				}
				
				if(q !=null && ! q.contentEquals("")) {
					query = q;
				}
		
		//DAO 작업
		List<Board> boardList = null;
		try {
			//동기화
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			//////////////////////////////////
			boardList = boardDao.boardList(page, field, query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
		


}
