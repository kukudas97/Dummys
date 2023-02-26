package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.math3.random.RandomDataGenerator;

public class NumberDataCreator implements DummyDataCreator {

	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> dummyData = new ArrayList<String>();
		long min = (long)map.get("min");
		long max = (long)map.get("max");
		RandomDataGenerator randomLong = new RandomDataGenerator();
		
		for(int i = 0; i < row; i++) {
		    long generatedLong = randomLong.nextLong(min, max);
			dummyData.add(generatedLong+"");
		}
		
		return dummyData;
	}

	@Override
	public List<String> run(Map<String, Object> map, int row, List<String> wordList) {
		// TODO Auto-generated method stub
		return null;
	}

}
