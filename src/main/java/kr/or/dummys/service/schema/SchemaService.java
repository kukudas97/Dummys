package kr.or.dummys.service.schema;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.SchemaDao;
import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.CreateData;
import kr.or.dummys.dto.Schema;

@Service
public class SchemaService {

	@Autowired
	private SqlSession sqlSession;
	
	@Transactional(rollbackFor = Exception.class)
	public int createSchema(Schema schema, List<Col> list) throws Exception {
		// dao 만들고
		SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
		// schema insert 하고
		dao.insertSchema(schema);
		
		//스키마 비밀번호 있으면 insert
		if(schema.getSchema_password() != null) {
			if(!schema.getSchema_password().equals("")) {
				dao.insertSchemaPassword(schema);
			}
		}
		
		// column insert 하고
		for(Col col : list) {
			col.setSchema_no(schema.getSchema_no());
			dao.insertColumn(col);
			
		// 옵션이 있으면 옵션 insert
			if(col.getCol_options().size()>0) {
				for(int option : col.getCol_options()) {
					dao.insertOptions(col.getCol_no(), option);
				}
			}
		}
		return 1;
	}
	
	public List<Schema> getSchemaList(String type, Principal pri){
		List<Schema> list = null;
		String sql = "";
		String join = "";
		
		if(type.equals("mine")) {
			sql = "and userid='" + pri.getName() + "'";
			join = "left join";
		} else {
			sql = "and schema_password is null";
			join = "left join";
		}
		
		try {
			SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
			
			list = dao.getSchemaList(sql, join);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Schema getSchemaByNo(String schema_no) {
		Schema schema = null;
		try {
			SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
			schema = dao.getSchemaByNo(schema_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return schema;
	}
	public List<Col> getColListBySchemaNo(String schema_no){
		List<Col> list = null;
		
		try {
			SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
			list = dao.getColListBySchemaNo(schema_no);
			for(Col col : list) {
				col.setCol_options(dao.getOptionsByColNo(col.getCol_no()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Transactional(rollbackFor = Exception.class)
	public int updateSchema(CreateData data) {
		// 객체 생성
		Schema schema = Schema.builder()
				.schema_no(data.getSchema_no())
				.schema_name(data.getSchema_name())
				.schema_content(data.getSchema_content())
				.schema_password(data.getSchema_password()).build();
		List<Col> list = data.getList();
		
		// dao 객체 생성
		SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
		
		// 스키마 업데이트 하고
		dao.updateSchema(schema);
		
		// password 상태 업데이트
		dao.deletePasswordByNo(schema.getSchema_no());
		if(schema.getSchema_password() != null) {
			if(!schema.getSchema_password().equals("")) {
				dao.insertSchemaPassword(schema);
			}
		}
		
		// col 지우고
		dao.deleteColumn(schema.getSchema_no());

		// col insert 하면서
		for(Col col : list) {
			col.setSchema_no(schema.getSchema_no());
			dao.insertColumn(col);
			
		// 옵션이 있으면 옵션 insert
			if(col.getCol_options().size()>0) {
				for(int option : col.getCol_options()) {
					dao.insertOptions(col.getCol_no(), option);
				}
			}
		}
		
		return 1;
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteSchemaList(List<Integer> list) {
		
		SchemaDao dao = sqlSession.getMapper(SchemaDao.class);
		
		for(int schema_no : list) {
			dao.deleteSchemaByNo(schema_no);
		}
		
		return 1;
	}
}