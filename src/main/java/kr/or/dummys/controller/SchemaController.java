package kr.or.dummys.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.CreateData;
import kr.or.dummys.dto.Schema;
import kr.or.dummys.dto.TestForm;
import kr.or.dummys.service.schema.SchemaService;

@Controller
@RequestMapping("/schema/")
public class SchemaController {

	@Autowired
	private SchemaService service;
	
	@GetMapping("schemaCreate.do")
	public String getSchemaView() {
		return "schema/schemaView"; 
	}
	@GetMapping("schemaList.do")
	public String schemaList(@RequestParam String type, Principal pri, Model model) {
		List<Schema> list = null;
		if(pri != null) {
			if(type != null) {
				list = service.getSchemaList(type, pri);
			}
		}
		model.addAttribute("list",list);
		return "schema/schemaList";
	}
	@GetMapping("schemaDetail.do")
	public String schemaDetail(@RequestParam String schema_no, String password, Principal pri, Model model, HttpServletRequest request) {
		if(pri == null || schema_no == null) {
			return "/index.do";
		}
		
		Schema schema = service.getSchemaByNo(schema_no);
		List<Col> col_list = service.getColListBySchemaNo(schema_no);

		boolean passwordCheck = false;
		
		// 스키마에 비밀번호가 있으면 비밀번호를 입력했는지 확인 후 맞을 경우에만 디테일 페이지로 이동한다.
		if(schema.getSchema_password() != null) {
			if(!schema.getSchema_password().equals("")) {
				// 비밀번호 입력했는지 확인
				if(password != null) {
					// 입력한 비밀번호가 맞으면 true
					if(password.equals(schema.getSchema_password())) {
						//password가 없거나 틀리면 password 페이지로 보내기
						passwordCheck = true;
					}
					// 스키마 비밀번호가 있는데 입력된 비밀번호가 없으면 false
				}
			}
		}

		// 스키마 작성자와 보려는 사람이 다르면 정보 지우기
		if(!pri.getName().equals(schema.getUserid())) {
			schema.setSchema_password("");
		} else {
			//같으면 비밀번호 입력과 상관 없이 디테일 페이지로
			passwordCheck = true;
		}
		
		// 비밀번호를 틀렸거나, 입력하지 않았다면 password 페이지로 이동
		if(!passwordCheck) {
			return "schema/schemaPassword";
		}
		
		
		model.addAttribute("schema",schema);
		model.addAttribute("col_list",col_list);
		
		return "schema/schemaDetail";
	}
	@GetMapping("schemaPassword.do")
	public String password() {
		return "schema/schemaPassword";
	}
}