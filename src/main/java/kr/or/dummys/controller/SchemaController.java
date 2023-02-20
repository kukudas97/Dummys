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
	public String schemaView() {
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
	public String schemaDetail(@RequestParam String schema_no, Principal pri, Model model, HttpServletRequest request) {
		if(pri == null || schema_no == null) {
			return "/index.do";
		}
		System.out.println("schema_no : " + schema_no);
		Schema schema = service.getSchemaByNo(schema_no);
		List<Col> col_list = service.getColListBySchemaNo(schema_no);
		
		if(schema.getUserid().equals(pri.getName()) || request.isUserInRole("ROLE_ADMIN")) {
			model.addAttribute("schema",schema);
			model.addAttribute("col_list",col_list);
		}
		return "schema/schemaDetail";
	}
}