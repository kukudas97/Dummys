package kr.or.dummys.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Col {
	private int col_no;
	private int schema_no;
	private int type_no;
	private String col_name;
	private int col_blank;
	private String col_function;
	private int col_order;
	private List<Integer> col_options;
}
