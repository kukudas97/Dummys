package kr.or.dummys.utils.Creator;

import java.util.List;
import java.util.Map;

public class DummyDataFactory {
	private DummyDataCreator creator;
	public List<String> create(Map<String,Object> map,int row){
		return creator.run(map, row);
	}
	public List<String> create(Map<String,Object> map,int row, List<String> wordList){
		return creator.run(map, row,wordList);
	}
	public void setCreator(String factory) {
		DummyDataCreator setter = null;
		if(factory.equals("word")) {
			setter = new WordDataCreator();
		} else if(factory.equals("random")) {
			setter = new RandomWordDataCreator();
		} else if(factory.equals("number")) {
			setter = new NumberDataCreator();
		} else if(factory.equals("gaussian")) {
			setter = new GaussianDataCreator();
		}
		this.creator = setter;
	}
}