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
	
	@Transactional(rollbackFor = Exception.class)
	public int insertGaussian(GaussianCreate data) {
		int gaussian_result_row = 0;
		Gaussian gaussian = data.getGaussian();
		List<Gaussian_result> list = data.getList();
		
		GaussianDao dao = session.getMapper(GaussianDao.class);
		
		dao.insertGaussian(gaussian);
		int seq = gaussian.getGaussian_no();
		
		
		// Gaussian_result 설정 및 insert
		for(Gaussian_result gaussian_result : list) {
			gaussian_result.setGaussian_no(seq);
			System.out.println("데이터 DTO : " + gaussian_result);
			gaussian_result_row += dao.insertGaussian_result(gaussian_result);
		}
		
		return gaussian_result_row;
	}
	
	public List<Gaussian> getGaussianList(String userid){
		List<Gaussian> list = null;
		try {
			GaussianDao dao = session.getMapper(GaussianDao.class);
			list = dao.getGaussianListById(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteGaussiansByNo(List<Integer> list) {
		int result = 0;
		GaussianDao dao = session.getMapper(GaussianDao.class);
		for(int no : list) {
			result += dao.deleteGaussianByNo(no);
		}
		
		return result;
	}
}
