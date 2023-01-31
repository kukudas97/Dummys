package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Message {
	private int message_no;
	private String message_content;
	private String send_id;
	private String receive_id;
	private String message_name;
	private String message_date;
	private int message_check;
	private int send;
	private int receive;
}
