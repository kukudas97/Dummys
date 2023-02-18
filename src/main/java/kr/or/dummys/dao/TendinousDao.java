package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Tendinous;

public interface TendinousDao {
	
	//문의사항 생성
	public int insertTendinous(Tendinous tendinous);
	
	//문의사항 리스트
	public List<Tendinous> listTendinous();
	
	//문의사항 삭제
	public int deleteTendinous(int tendinous_no);
	
	//문의사항 세부 사항
	public Tendinous detailTendinous(int tendinous_no);
}
