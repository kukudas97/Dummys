package kr.or.dummys.utils.Creator;

import java.util.List;
import java.util.Map;

public interface DummyDataCreator {
	public List<String> run(Map<String,Object> map,int row);
	public List<String> run(Map<String,Object> map,int row,List<String> wordList);
}
