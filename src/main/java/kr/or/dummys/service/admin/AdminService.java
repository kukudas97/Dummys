package kr.or.dummys.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.TendinousDao;
import kr.or.dummys.dao.TypeDao;
import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Users;
import kr.or.dummys.dto.Tendinous;
import kr.or.dummys.dto.Type;

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
	
	//타입 리스트(DB)
	public List<Type> typeList(){
		//DB 작업
		List<Type> typeList = null;
		
		try {
			TypeDao typeDao = sqlsession.getMapper(TypeDao.class);
			typeList = typeDao.getChartType();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return typeList;
	}
	
	//회원 활성화 시키기
	public int inUser(List<String> userlist) {
		
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		
		int result = 0;
		
		for(String userid : userlist) {
			result += userdao.inUser(userid);
		}
		
		return result;
	}
	
	//회원 비활성화 시키기
	public int outUser(List<String> userlist) {
		
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		
		int result = 0;
		
		for(String userid : userlist) {
			result += userdao.outUser(userid);
		}
		
		return result;
	}
	
	//문의사항 리스트 불러오기
	public List<Tendinous> listTendinous(){
		TendinousDao tendinousdao = sqlsession.getMapper(TendinousDao.class);
		List<Tendinous> tendinous = new ArrayList<Tendinous>();
		tendinous = tendinousdao.listTendinous();
		
		return tendinous;
	}
	
	//문의사항 삭제
	public int deleteTendinous(int tendinous_no) {
		TendinousDao tendinousdao = sqlsession.getMapper(TendinousDao.class);
		int result = tendinousdao.deleteTendinous(tendinous_no);
		return result;
	}
}
