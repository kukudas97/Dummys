package kr.or.dummys.service.type;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.TypeDao;
import kr.or.dummys.dto.Dummy_data;
import kr.or.dummys.dto.Type;

public class TypeService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Transactional
	public int insert(Type type, List<String> dummy) {
		
		//seq생성
		int seq = seq();
		
		int typeresult =0;
		int dummy_dataresult = 0;
		typeresult = insertType(type);
		for() {
			
		}

		return 0;
	}
	
	public int insertType(Type type) {
		
		int result = 0;
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		result = typedao.insertType(type);
		
		return result;
	}
	
	public int insertDummy(Dummy_data dummy_data){
		
		int result = 0;
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		result = typedao.insertDummy(dummy_data);
		
		return result;
	}
	
	//seq생성
	public int seq() {
	
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		int seq = typedao.seq();
		
		return seq;
	}
}
