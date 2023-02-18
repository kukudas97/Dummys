package kr.or.dummys.service.tendinous;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.TendinousDao;
import kr.or.dummys.dto.Tendinous;

@Service
public class TendinousService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//문의사항 입력
	public int insertTendinous(Tendinous tendinous) {
		TendinousDao tendinousdao = sqlsession.getMapper(TendinousDao.class);
		int result = tendinousdao.insertTendinous(tendinous);
		return result;
	}

}
