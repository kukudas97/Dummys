package kr.or.dummys.service.warning;

import java.security.Principal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.WarningDao;
import kr.or.dummys.dto.Warning;

@Service
public class WarningService {
	
	//Mybatis 작업
	@Autowired	
	private SqlSession sqlsession;
		
		public String reportWarning(Warning warning, Principal principal) {
			System.out.println("warning 서비스 탔다");
			int result = 0;
			try {
				WarningDao warningDao = sqlsession.getMapper(WarningDao.class);
				warning.setSend_id(principal.getName());
				System.out.println(warning.getSend_id());
				
				warningDao.reportWarning(warning);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return(result>=1) ? "성공":"실패";
		}

}
