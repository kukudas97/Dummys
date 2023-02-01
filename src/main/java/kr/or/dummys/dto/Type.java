package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Type {
	private int type_no;
	private String userid;
	private int process_no;
	private String type_name;
	private String type_reason;
	private String type_category;
	private int type_open;
	private int type_delete;
}
