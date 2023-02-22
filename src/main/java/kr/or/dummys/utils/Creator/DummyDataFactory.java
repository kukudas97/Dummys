package kr.or.dummys.utils.Creator;

import java.util.Collections;
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
	public void blankProcess(List<String> list, int blank){
		// 100개면 100.0
		// 1개면 1.0
		double size = (double)list.size();
		// 50 이면 0.5
		double per = (double)blank / 100;
		// 삭제할 low 구하기 100 * 0.5 = 50
		// 							1 * 0.5 = 0.5
		int max = (int)(size*per);
		
		if(max != 0) {
			try {
				for(int i = 0; i < max; i++) {
					list.set(i,"");
				}	
			} catch (Exception e) {
			}
			Collections.shuffle(list);
		}
	}
	
}