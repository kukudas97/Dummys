package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class RandomWordDataCreator implements DummyDataCreator {

	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> dummyData = new ArrayList<String>();
		List<String> wordList = (List<String>)map.get("data");
		String random_form = (String)map.get("random_form");
		
		for(int i = 0; i<row; i++) {
			StringBuffer strBuffer = new StringBuffer();
			random_form.chars().forEach(c-> makeWord((char) c,strBuffer, wordList));
			String word = strBuffer.toString();
			dummyData.add(word);
		}
		return dummyData;
	}

	@Override
	public List<String> run(Map<String, Object> map, int row, List<String> wordList) {
		// TODO Auto-generated method stub
		return null;
	}
	public void makeWord(char c, StringBuffer buffer,List<String> word) {
		if(c == '*') {
			buffer.append(word.get(new Random().nextInt(word.size())));
		} else if(c == '#') {
			buffer.append(new Random().nextInt(10));
		} else {
			buffer.append(c);
		}
	}
}
