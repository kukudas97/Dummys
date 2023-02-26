package kr.or.dummys.dto;

import java.util.List;

import lombok.Data;

@Data
public class Col {
	private int col_no;
	private int schema_no;
	private int type_no;
	private String type_name;
	private int process_no;
	private String col_name;
	private int col_blank;
	private String col_function;
	private int col_order;
	private List<Long> col_options;
}
