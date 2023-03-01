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
	
	//정규분포 insert
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
			gaussian_result_row += dao.insertGaussian_result(gaussian_result);
		}
		
		return gaussian_result_row;
	}
	
	//정규분포 리스트 by userid
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
	//정규분포 리스트에서 삭제 버튼 누르는거
	@Transactional(rollbackFor = Exception.class)
	public int deleteGaussiansByNo(List<Integer> list) {
		int result = 0;
		GaussianDao dao = session.getMapper(GaussianDao.class);
		for(int no : list) {
			result += dao.deleteGaussianByNo(no);
		}
		
		return result;
	}
	//gaussian 하나 얻어오기(수정/디테일 페이지)
	public Gaussian getGaussianByNo(String gaussian_no) {
		Gaussian gaussian = null;
		try {
			GaussianDao dao = session.getMapper(GaussianDao.class);
			gaussian = dao.getGaussianByNo(gaussian_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gaussian;
	}
	
	// gaussianResult 목록 불러오기
	public List<Gaussian_result> getGaussianResultListByNo(String gaussian_no){
		List<Gaussian_result> list = null;
		try {
			GaussianDao dao = session.getMapper(GaussianDao.class);
			list = dao.getGaussianResultListByNo(gaussian_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Gaussian 업데이트
	@Transactional(rollbackFor = Exception.class)
	public boolean updateGaussian(GaussianCreate data) {
		
		Gaussian gaussian = data.getGaussian();
		List<Gaussian_result> list = data.getList();
		
		GaussianDao dao = session.getMapper(GaussianDao.class);
		
		dao.updateGaussian(gaussian);
		
		// gauusian_result delete -> insert 
		// 해당 gaussian_no에 들어있던 result 삭제하고
		dao.deleteGaussianResultByGaussianNo(gaussian.getGaussian_no());
		// 다시 삽입하기
		for(Gaussian_result  result : list) {
			result.setGaussian_no(gaussian.getGaussian_no());
			dao.insertGaussian_result(result);
		}
		
		return true;
	}
}
