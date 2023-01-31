package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Warning {
	private int warning_no;
	private String send_id;
	private String receive_id;
	private String warning_type;
	private int warning_type_no;
	private String warning_reason;
}
