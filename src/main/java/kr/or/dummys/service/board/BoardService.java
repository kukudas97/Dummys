package kr.or.dummys.service.board;

import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.BoardDao;
import kr.or.dummys.dto.Board;

@Service
public class BoardService {
	
	//Mybatis 작업
	private SqlSession sqlsession;
	
	private String encodedParam;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//글목록보기 서비스(DB)
	public List<Board> boardList(String board_kind, String pg, String f, String q){
		
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
			boardList = boardDao.boardList(board_kind, page, field, query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//글쓰기 처리 서비스
	public String boardWrite(Board board, HttpServletRequest request, Principal principal) {
		//인증 객체
		board.setUserid(principal.getName().trim());		
		try {
			//동기화
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			boardDao.boardWrite(board); //DB insert
			encodedParam = URLEncoder.encode(board.getBoard_kind(), "UTF-8");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:boardList.do?board_kind=" + encodedParam;
	}
	
	//게시글 상세보기 서비스
	public Board boardDetail(String board_no) {
		Board board = null;
		try {
			//동기화
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			////
			board = boardDao.boardDetail(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	//글 수정하기 서비스
	public Board boardUpdate(String board_no) {
		Board board = null;
		try {
			//동기화
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			board = boardDao.boardDetail(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	//글 수정처리 서비스
	public String boardUpdate(Board board, HttpServletRequest request) {
		try {
			//동기화
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			boardDao.boardUpdate(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//처리가 끝나면 상페 페이지로 이동: redirect 글번호를 가지고
		return "redirect:boardDetail.do?board_no=" + board.getBoard_no(); //서버에게 새 요청
	}
	
	//글 삭제 서비스
	public String boardDelete(Board board, String board_no) {
		BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
		try {
			boardDao.boardDelete(board_no);
			encodedParam = URLEncoder.encode(board.getBoard_kind(), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:boardList.do?board_kind=" + encodedParam;
	}
		


}
