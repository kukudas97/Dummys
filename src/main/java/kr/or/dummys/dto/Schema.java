package kr.or.dummys.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Schema {
	private int schema_no;
	private String userid;
	private String schema_name;
	private String schema_content;
	private String schema_date;
	private int schema_delete;
	private String schema_password;
}
