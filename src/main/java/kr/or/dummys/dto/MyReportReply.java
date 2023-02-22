package kr.or.dummys.dto;

import lombok.Data;

@Data
public class MyReportReply {
	
	private String board_kind;
	private String board_name;
	private String reply_content;
	private String warning_count;

}
