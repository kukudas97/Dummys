package kr.or.dummys.dto;

import java.util.List;

import lombok.Data;

@Data
public class CreateData {
	private int row; // 생성할 데이터 수
	private int type; //생성 타입 (엑셀 , JSON 등)
	private String schema_name;
	private int schema_no;
	private String schema_password;
	private List<Col> list;
}
