package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class NumberDataCreator implements DummyDataCreator {

	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> dummyData = new ArrayList<String>();
		int min = (int)map.get("min");
		int max = (int)map.get("max");
		Random random = new Random();
		
		for(int i = 0; i < row; i++) {
			int randomNumber = random.nextInt(max - min + 1) + min;
			dummyData.add(randomNumber+"");
		}
		
		return dummyData;
	}

	@Override
	public List<String> run(Map<String, Object> map, int row, List<String> wordList) {
		// TODO Auto-generated method stub
		return null;
	}

}
