package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Col {
	private int col_no;
	private int schema_no;
	private int type_no;
	private String col_name;
	private int col_blank;
	private String col_function;
	private int col_order;
	
	//옵션 테이블
	private int option_no;
	private String option_result;
}
