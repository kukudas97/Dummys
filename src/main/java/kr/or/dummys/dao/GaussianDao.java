package kr.or.dummys.dao;

import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;

public interface GaussianDao {
	
	public int getGaussianSeq();
	
	public int insertGaussian(Gaussian gaussian);
	
	public int insertGaussian_result(Gaussian_result gaussian);
}
