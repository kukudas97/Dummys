package kr.or.dummys.service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Users;

@Service
public class JoinService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertUser(Users users) {
		int result = 0;
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		result = userDao.insertUser(users);
		return result;
	}
	
	public int idCheck(String id) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		int result = userDao.idCheck(id);
		return result;
	}
	
	public int loginCheck(String id, String password) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		int result = userDao.loginCheck(id, password);
		return result;
	}
	

}
