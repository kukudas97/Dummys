package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.dummys.dto.Warning;

public interface WarningDao {
	
	//신고 개수
	public int getWarningCount(String field, String query);
	
	//신고 리스트
	public List<Warning> listWarning(String warning_type, int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	//신고 접수(insert)
	public int reportWarning(Warning warning) throws ClassNotFoundException, SQLException;
	
	//신고 받은 사람 수
	public List<Warning> getWarningCnt() throws ClassNotFoundException, SQLException;
	
	//정지된 사람 리스트
	public List<String> getBlockUsers() throws ClassNotFoundException, SQLException;
	
	//신고 처리(ROLE_BLOCK 권한 부여)
	public int insertRoleBlock(String userid) throws ClassNotFoundException, SQLException;
	
	//회원 정지 해제 (ROLE_BLOCK 권한 삭제)
	public int deleteRoleBlock(String userid) throws ClassNotFoundException, SQLException;

}
