package kr.or.dummys.dto;

import java.util.List;

import lombok.Data;

@Data
public class CreateData {
	private int row;
	private int type;
	private List<Col> list;
}
