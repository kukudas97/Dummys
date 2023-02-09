package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Reply {
	private int reply_no;
	private String userid;
	private int board_no;
	private String reply_content;
	private int reply_activate;
	private String reply_date;
	private int ref;
	private int dept;
	private int step;
	private String nickname;
}
