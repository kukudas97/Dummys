package kr.or.dummys.dao;

import java.util.List;

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
	
	//type상세
	public Type typeDetail(int type_no);
	
	//type수정
	public int updateType(Type type);
	
	//type삭제
	public int deleteType(int type_no);
	
	//더미데이터 받아오기
	public int insertDummy(int seq, String word);
}
