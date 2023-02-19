package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class WordDataCreator implements DummyDataCreator {

	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> dummyData = new ArrayList<String>(row);
		List<String> wordList = (List)map.get("data");
		
		int wordListSize = wordList.size();
		
		// 더미데이터용 문자가 row 보다 많을 경우
		if(wordListSize > row) {
			dummyData.addAll(wordList.subList(0, row));
		} else {
			// 반복 횟수
			int rotate = (int)(row/wordListSize);
			// 나머지
			int remainder = row%wordListSize;
			for(int i = 0; i< rotate; i++) {
				dummyData.addAll(wordList);
			}
			dummyData.addAll(wordList.subList(0, remainder));
		}
		
		return dummyData;
	}

	@Override
	public List<String> run(Map<String, Object> map, int row, List<String> wordList) {
		// TODO Auto-generated method stub
		return null;
	}

}
