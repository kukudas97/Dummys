package kr.or.dummys.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Users;

@Service
public class UserService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//user확인
	public Users getUser(String userid) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		
		Users user = userDao.userDetail(userid);
		
		return user;
	}
	
	public Map<String, Object> myBoardList(String userid){
		// service
		Map<String, Object> mypageMap = new HashMap<String, Object>();
		List<Board> myBoardList = null;
		List<Board> myReplyBoardList = null;
		
		try {
			UserDao userDao = sqlsession.getMapper(UserDao.class);
			myBoardList = userDao.myBoardList(userid);
			myReplyBoardList = userDao.myReplyBoardList(userid);
			
			mypageMap.put("myBoardList", myBoardList);
			mypageMap.put("myReplyBoardList", myReplyBoardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
		
		return mypageMap;
	}
}
