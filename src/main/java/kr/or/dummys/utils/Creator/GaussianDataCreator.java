package kr.or.dummys.utils.Creator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;

public class GaussianDataCreator implements DummyDataCreator {

	private List<String> dummylist;
	
	@Override
	public List<String> run(Map<String, Object> map, int row) {
		List<String> dummyData = new ArrayList<String>();
		Gaussian gaussian = (Gaussian)map.get("gaussian");
		List<Gaussian_result> resultList = (List<Gaussian_result>)map.get("resultList");
		Random random = new Random();
		Map<String,Map<String,Integer>> info = new HashMap<String, Map<String,Integer>>();
		
		if(dummylist != null) {
			for(Gaussian_result rs : resultList) {
				Map<String, Integer> m = new HashMap<>();
				m.put("avg",rs.getGaussian_result_avg());
				m.put("dev",rs.getStandard_deviation());
				info.put(rs.getGaussian_result(),m);
			}
		}
		
		for(int i = 0; i< row; i++) {
			if(dummylist == null) {
				dummyData.add("");
			} else {
				String word = dummylist.get(i);
				Map<String,Integer> m =  info.get(word);
				if(m != null) {
					int r = m.get("avg") + (int)(random.nextGaussian() * m.get("dev"));
					dummyData.add(Integer.toString(r));
				} else {
					dummyData.add("");
				}
			}
		}
		return dummyData;
	}
	public List<String> run(Map<String, Object> map, int row, List<String> dummylist) {
		this.dummylist = dummylist;
		return this.run(map, row);
	}
}
