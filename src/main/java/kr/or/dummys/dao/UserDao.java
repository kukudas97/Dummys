package kr.or.dummys.dao;

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
}
