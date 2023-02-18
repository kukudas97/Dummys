package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GaussianDataCreator implements DummyDataCreator {

	private List<String> dummylist;
	
	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> wordList = new ArrayList<String>();
		return wordList;
	}
	public List<String> run(Map<String, Object> map, int row, List<String> dummylist) {
		this.dummylist = dummylist;
		return this.run(map, row);
	}
}
