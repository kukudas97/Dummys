package kr.or.dummys.dao;

import kr.or.dummys.dto.Users;

public interface UserDao {
	
	//회원가입
	public int insertUser(Users users);
/*	
	//아이디 체크
	public int idCheck(String id);
	
	//로그인 체크
	public int loginCheck(String id, String password);
	
	//회원 상세
	public Users userDetail(String id);
	
	//회원 수정
	public int updateUser(Users users);
*/
}
