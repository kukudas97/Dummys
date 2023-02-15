package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Dummy_data;
import kr.or.dummys.dto.Random_form;
import kr.or.dummys.dto.Type;

public interface TypeDao {
//create, selectuserid, selectall, update, delete
	
	//type생성
	public int insertType(Type type);
	
	//id로 타입 찾기
	public List<Type> getTypeUserId(String userid);
	
	//타입 전체
	public List<Type> getTypeAll();
	
	//카테고리 별 조회
	public List<Type> getTypeCategory(int category);
	
	// 동적쿼리로 타입리스트 조회
	public List<Type> getTypeBySql(String sql);
	
	//type상세
	public Type typeDetail(int type_no);
	
	//type수정
	public int updateType(Type type);
	
	//random수정
	public int updatetRandom(int seq, String word);
	
	//더미데이터 삭제
	public int deleteDummy(int seq);
	
	//type삭제
	public int deleteType(int type_no);
	
	//더미데이터 받아오기
	public int insertDummy(int seq, String word);
		
	//랜덤문자 저장
	public int insertRandom(int seq, String word);
	
	//랜덤문자 불러오기
	public List<Dummy_data> getDummy_data(int type_no);
	
	//랜덤 폼 불러오기
	public Random_form getRandomFormType_no(int type_no);
}
