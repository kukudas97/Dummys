package kr.or.dummys.service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Users;

@Service
public class UserService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//user확인
	public Users getUser(String userid) {
		UserDao dao = sqlsession.getMapper(UserDao.class);
		
		Users user = dao.userDetail(userid);
		
		return user;
	}
}
