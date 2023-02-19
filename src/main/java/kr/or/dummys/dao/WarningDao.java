package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.dummys.dto.Warning;

public interface WarningDao {
	
	//신고 개수
	int getWarningCount(String field, String query);
	
	//신고 리스트
	List<Warning> listWarning(String warning_type, int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	//신고 접수(insert)
	int reportWarning(Warning warning) throws ClassNotFoundException, SQLException;

}
