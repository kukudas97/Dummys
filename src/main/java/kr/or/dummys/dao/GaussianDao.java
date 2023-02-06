package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;

public interface GaussianDao {
	
	public int insertGaussian(Gaussian gaussian);
	
	public int insertGaussian_result(Gaussian_result gaussian);
	
	public List<Gaussian> getGaussianListById(String userid);
	
	public int deleteGaussianByNo(int no);
}
