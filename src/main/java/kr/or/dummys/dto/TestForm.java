package kr.or.dummys.dto;

import lombok.Data;

@Data
public class TestForm {
    private String row;
    private String type;
    private String schema_name;
    private String schema_no;
    private String schema_content;
    private String schema_password;
    private Col[] list;

    // getter/setter 생략

}