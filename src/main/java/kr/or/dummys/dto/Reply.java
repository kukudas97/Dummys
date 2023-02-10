package kr.or.dummys.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
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
