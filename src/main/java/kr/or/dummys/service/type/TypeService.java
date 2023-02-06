package kr.or.dummys.service.type;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.TypeDao;
import kr.or.dummys.dto.Type;

@Service
public class TypeService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//타입 생성
	@Transactional(rollbackFor = Exception.class)
	public int insert(Type type, List<String> dummy) {
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		int typeresult =0;
		int dummy_dataresult = 0;
		typeresult = typedao.insertType(type);
		int seq = type.getType_no();
		for(String word : dummy) {
			dummy_dataresult += typedao.insertDummy(seq, word);
		}
		
		return (typeresult + dummy_dataresult >= 2) ? 1 : 0;
	}
	
	//아이디 별 타입 찾아오기
	public List<Type> getTypeUserId(String userid){
		
		List<Type> typelist = new ArrayList<Type>();
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		typelist = typedao.getTypeUserId(userid);
		
		return typelist;
	}
	
	//타입 삭제
	@Transactional(rollbackFor = Exception.class)
	public int deleteType(List<Integer> type_no_list) {
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		
		int result_all = 0;
		
		for(int type_no : type_no_list) {
			System.out.println(type_no);
			result_all += typedao.deleteType(type_no);
		}
		
		return result_all;
	}
}
