package kr.or.dummys.service.type;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.TypeDao;
import kr.or.dummys.dto.Dummy_data;
import kr.or.dummys.dto.Random_form;
import kr.or.dummys.dto.Type;

@Service
public class TypeService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//타입 생성(더미데이터 형식)
	@Transactional(rollbackFor = Exception.class)
	public int insertDummy(Type type, List<String> dummy) {
		
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
	
	//타입 생성(랜덤문자 형식)
	@Transactional(rollbackFor = Exception.class)
	public int insertRandom(Type type, String random_word_form, List<String> dummy) {
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		int typeresult =0;
		int dummy_dataresult = 0;
		typeresult = typedao.insertType(type);
		int seq = type.getType_no();
		typedao.insertRandom(seq, random_word_form);
		for(String word : dummy) {
			dummy_dataresult += typedao.insertDummy(seq, word);
		}
		
		return (typeresult + dummy_dataresult >= 2) ? 1 : 0;
	}
	
	//더미 업데이트
	@Transactional(rollbackFor = Exception.class)
	public int updateDummy(Type type, List<String> dummy) {
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		int update = 0;
		int dummy_dataresult = 0;
		
		update = typedao.updateType(type);
		int seq = type.getType_no();
		typedao.deleteDummy(seq);
		for(String word : dummy) {
			dummy_dataresult += typedao.insertDummy(seq, word);
		}
		
		return (update + dummy_dataresult >= 2) ? 1 : 0;
	}
	
	//아이디 별 타입 찾아오기
	public List<Type> getTypeUserId(String userid){
		
		List<Type> typelist = new ArrayList<Type>();
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		typelist = typedao.getTypeUserId(userid);
		
		return typelist;
	}
	
	//타입으로 찾아오기
	public Type getTypeType_no(int type_no) {
		Type type = new Type();
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		type = typedao.typeDetail(type_no);
		
		return type;
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
	
	//dummy_data불러오기
	public List<Dummy_data> listDetail(int type_no) {
		
		List<Dummy_data> dummy_datalist = new ArrayList<Dummy_data>();
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		dummy_datalist = typedao.getDummy_data(type_no);
		
		
		return dummy_datalist;
	}
	
	//랜덤 폼 type_no로 불러오기
	public Random_form randomFormType_no(int type_no) {
		
		Random_form random_form = new Random_form();
		
		TypeDao typedao = sqlsession.getMapper(TypeDao.class);
		random_form = typedao.getRandomFormType_no(type_no);
		
		return random_form;
	}
}
