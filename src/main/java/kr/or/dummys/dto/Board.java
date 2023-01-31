package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Board {
	private int board_no;
	private String id;
	private String board_kind;
	private String board_name;
	private String board_content;
	private String board_date;
}
