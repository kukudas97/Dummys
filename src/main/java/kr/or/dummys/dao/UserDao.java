package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Users;

public interface UserDao {
	
	//회원가입
	public int insertUser(Users users);
	
	//아이디 체크
	public int idCheck(String userid);
	
	//로그인 체크
	public int loginCheck(String userid, String password);
	
	//회원 상세
	public Users userDetail(String userid);
	
	//회원 수정
	public int updateUser(Users users);
	
	//전체 회원(활성화된)
	public List<Users> listUsers();
	
	//전체회원(비활성화된)
	public List<Users> listOutUsers();
	
	//회원 활성화
	public int inUser(String userid);
	
	//회원 비활성화
	public int outUser(String userid);
	
	//회원 지가 쓴 게시글 목록(마이페이지)
	public List<Board> myBoardList(String userid);
	
	//회원 지가 쓴 댓글이 있는 게시글 목록(마이페이지)
	public List<Board> myReplyBoardList(String userid);
	
	//회원로그인 시간 초기화
	public int updateLogin_date(String userid);
	
	//ROLE_SLEEP해제
	public int deleteROLE_SLEEP(String userid);
	
	//ROLE_SLEEP있는지 여부 확인
	public int selectROLE_SLEEP(String userid);
}
