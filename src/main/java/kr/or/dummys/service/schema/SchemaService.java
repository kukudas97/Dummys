package kr.or.dummys.service.schema;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.GaussianDao;
import kr.or.dummys.dao.SchemaDao;
import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.CreateData;
import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;
import kr.or.dummys.dto.Schema;
import kr.or.dummys.utils.Creator.DummyDataFactory;

@Service
public class SchemaService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DummyDataFactory dummyDataFactory;
	
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
				for(long option : col.getCol_options()) {
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
				for(long option : col.getCol_options()) {
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
	
	
	
	
	public List<Map<String,Object>> getDummyData(CreateData data){
		
		int row = data.getRow();
		int type = data.getType();
		List<Col> list = data.getList();
		
		// 더미데이터 생성할때 사용할 정보들 담는 객체
		Map<Col, Map<String,Object>> dataInfo = new HashMap<Col, Map<String,Object>>();
		
		// 컬럼 이름, 컬럼을 담아두는 Map 객체
		// 정규분포에서 사용하기 위해 생성함.
		// 같은 이름의 컬럼이 여러개 있으면 마지막 컬럼을 사용한다. 
		Map<String,List<String>> columnNameMap = new HashMap<String, List<String>>();
		
		/*
			List<Map<String,Object>>
			[
				Map<String,Object> - name/list
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
			]
		*/
		List<Map<String,Object>> resultDatas = new ArrayList<Map<String,Object>>(list.size());
		
		try {
			// DAO 생성
			SchemaDao schemadao = sqlSession.getMapper(SchemaDao.class);
			GaussianDao gaussiandao = sqlSession.getMapper(GaussianDao.class);
			
			// 데이터 생성용 정보 가져오기
			for(Col col : list) {
				// 더미데이터
				if(col.getProcess_no() == 0) {
					List<String> dataList = schemadao.getDummDataByTypeNo(col.getType_no());
					Map<String,Object> map = new HashMap<String, Object>();
					map.put("data",dataList);
					
					dataInfo.put(col,map);
				} // 랜덤조합
				else if(col.getProcess_no() == 1) {
					List<String> dataList = schemadao.getDummDataByTypeNo(col.getType_no());
					String random_form = schemadao.getRandomWordFormByTypeNo(col.getType_no());
					Map<String,Object> map = new HashMap<String, Object>();
					
					map.put("data",dataList);
					map.put("random_form",random_form);
					
					dataInfo.put(col,map);
				} // 랜덤 숫자
				else if(col.getProcess_no() == 2) {
					List<Long> option = col.getCol_options();
					Map<String,Object> map = new HashMap<String, Object>();
					map.put("min",option.get(0));
					map.put("max",option.get(1));
					
					dataInfo.put(col,map);
				} // 정규분포
				else if(col.getProcess_no() == 3) {
					Gaussian gaussian = gaussiandao.getGaussianByNo(col.getCol_options().get(0)+"");
					List<Gaussian_result> resultList = gaussiandao.getGaussianResultListByNo(col.getCol_options().get(0) + "");
					Map<String,Object> map = new HashMap<String, Object>();

					map.put("gaussian",gaussian);
					map.put("resultList",resultList);
					
					dataInfo.put(col,map);
				} // 미정 / 예외(오류)
				else {
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 공장 객체?
		// DI로 생성해보는 중... 되나?
		// DummyDataFactory dummyDataFactory = new DummyDataFactory();
		// 기본 더미데이터 만들기~~
		for(Col col : list) {
			List<String> wordList = null;
			if(col.getProcess_no() == 0) {
				//더미데이터
				dummyDataFactory.setCreator("word");
				wordList = dummyDataFactory.create(dataInfo.get(col), row);
			} else if(col.getProcess_no() == 1) {
				//랜덤문자
				dummyDataFactory.setCreator("random");
				wordList = dummyDataFactory.create(dataInfo.get(col), row);
				
			} else if(col.getProcess_no() == 2) {
				//랜덤숫자
				dummyDataFactory.setCreator("number");
				wordList = dummyDataFactory.create(dataInfo.get(col), row);
			}  
			if(col.getProcess_no() != 3) {
				// 공백 적용하고 섞어주기
				dummyDataFactory.blankProcess(wordList, col.getCol_blank());
			}
			// wordList = 컬럼 하나의 더미데이터 리스트
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name",col.getCol_name());
			map.put("list",wordList);
			
			resultDatas.add(col.getCol_order(), map);
			
			// 정규분포에서 사용할 이름-데이터 Map put 작업
			columnNameMap.put(col.getCol_name(),wordList);
		}
		// 정규분포 데이터 만들기
		for(Col col : list) {
			if(col.getProcess_no() == 3) {
				dummyDataFactory.setCreator("gaussian");
				
				// 적용시킬 이름 구하기
				Gaussian gaussian = (Gaussian)dataInfo.get(col).get("gaussian");
				String col_name = gaussian.getGaussian_col();
				
				// 해당 컬럼의 더미데이터 리스트 구하기
				List<String> li = columnNameMap.get(col_name);
				
				// 정규분포 데이터 만들기
				List<String> wordList = dummyDataFactory.create(dataInfo.get(col), row,li);
				
				dummyDataFactory.blankProcess(wordList, col.getCol_blank());
				// wordList = 컬럼 하나의 더미데이터 리스트
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("name",col.getCol_name());
				map.put("list",wordList);
				
				resultDatas.set(col.getCol_order(),map);
			}
		}
		
		return resultDatas;
	}
}

