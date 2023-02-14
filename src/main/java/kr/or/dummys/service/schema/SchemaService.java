package kr.or.dummys.service.schema;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SchemaService {

	@Autowired
	private SqlSession sqlSession;
	
}