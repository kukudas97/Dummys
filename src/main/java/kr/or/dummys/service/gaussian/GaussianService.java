package kr.or.dummys.service.gaussian;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.GaussianDao;
import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.GaussianCreate;
import kr.or.dummys.dto.Gaussian_result;

@Service
public class GaussianService {
	
	@Autowired
	private SqlSession session;
	
	@Transactional
	public int insertGaussian(GaussianCreate data) {
		
		int gaussian_row = 0;
		int gaussian_result_row = 0;
		Gaussian gaussian = data.getGaussian();
		List<Gaussian_result> list = data.getList();
		
		GaussianDao dao = session.getMapper(GaussianDao.class);
		
		// 시퀸스 읽기
		int seq = dao.getGaussianSeq();
		
		// Gaussian 설정 및 insert
		gaussian.setGaussian_no(seq);
		gaussian_row += dao.insertGaussian(gaussian);
		
		// Gaussian_result 설정 및 insert
		for(Gaussian_result gaussian_result : list) {
			gaussian_result.setGaussian_no(seq);
			gaussian_result_row += dao.insertGaussian_result(gaussian_result);
		}

		System.out.println("gaussian row : " + gaussian_row);
		System.out.println("gaussian_result row : " + gaussian_result_row);
		
		return gaussian_row + gaussian_result_row;
	}
}
