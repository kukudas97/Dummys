package kr.or.dummys.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Users;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//회원리스트(활성화된)
	public List<Users> listUsers(){
		
		List<Users> listuser = new ArrayList<Users>();
		
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		listuser = userdao.listUsers();
		
		return listuser;
	}
	
	//회원리스트(비활성화된)
	public List<Users> listOutUsers(){
		
		List<Users> listoutusers = new ArrayList<Users>();
		
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		listoutusers = userdao.listOutUsers();
		
		return listoutusers;
	}
}
