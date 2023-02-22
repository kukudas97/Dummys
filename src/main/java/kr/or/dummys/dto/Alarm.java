package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Alarm {
	private int alarm_no;
	private String userid;
	private String alarm_type;
	private int alarm_type_no;
	private String alarm_content;
	private int alarm_check;
	private String alarm_date;
}
