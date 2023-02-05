package kr.or.dummys.dto;

import java.util.List;

import lombok.Data;

@Data
public class GaussianCreate {
	private Gaussian gaussian;
	private List<Gaussian_result> list;
}
