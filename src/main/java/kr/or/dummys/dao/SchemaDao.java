package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;
import kr.or.dummys.dto.Schema;

public interface SchemaDao {
	public List<Schema> getSchemaList(String sql, String join);
	public Schema getSchemaByNo(String schema_no);
	public List<Col> getColListBySchemaNo(String schema_no);
	public List<Integer> getOptionsByColNo(int col_no);
	public List<String> getDummDataByTypeNo(int type_no);
	public String getRandomWordFormByTypeNo(int type_no);
	public String getPasswordBySchemaNo(String schema_no);
	
	public int insertSchema(Schema schema);
	public int insertColumn(Col column);
	public int insertOptions(int schema_no,int value);
	public int insertSchemaPassword(Schema schema);
	
	public int updateSchema(Schema schema);
	
	public int deleteColumn(int schema_no);
	public int deleteSchemaByNo(int schema_no);
	public int deletePasswordByNo(int schema_no);
}
