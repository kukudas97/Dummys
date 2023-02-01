package kr.or.dummys.dto;

import lombok.Data;

@Data
public class Users {
	private String userid;
	private String password;
	private String nickname;
	private int enabled;
}
