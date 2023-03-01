package kr.or.dummys.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.or.dummys.dto.CreateData;

public class SchemaDownLoad {
//    <option value="1">JSON</option>
//    <option value="2">CSV</option>
//    <option value="3">HTML TABLE</option>
//    <option value="4">SQL</option>
//    <option value="5">Excel</option>
	public static String download(List<Map<String,Object>> result,CreateData dataInfo) {
		int row = dataInfo.getRow();
		int type = dataInfo.getType();
		StringBuffer sb = new StringBuffer();
		int rowIndex = 0;
		//=================JSON 만들기================= 
		if(type == 1) {
			sb.append("[\n");
			for(int i = 0; i< row; i++) {
				sb.append("{");
				for(int j = 0; j< result.size(); j++) {
					Map<String,Object> m = result.get(j);
					sb.append("\""); // '
					sb.append((String)m.get("name")); // 이름
					sb.append("\":\""); // ' : '
					sb.append(((List<String>)m.get("list")).get(i)); // 값
					sb.append("\""); // '
					if(j < result.size()-1) sb.append(",");
				}
				sb.append("}");
				if(i+1< row) {
					sb.append(",\n");
				} else {
					sb.append('\n');
				}
			}
			sb.append("]"); 
		//===========================================
		} else if(type == 2) {
			for(int j = 0; j< result.size(); j++) {
				Map<String,Object> m = result.get(j);
				sb.append((String)m.get("name"));
				if(j < result.size()-1) sb.append(",");
			}
			sb.append("\n");
			for(int i = 0; i< row; i++) {
				for(int j = 0; j< result.size(); j++) {
					Map<String,Object> m = result.get(j);
					sb.append(((List<String>)m.get("list")).get(i)); // 값
					if(j < result.size()-1) sb.append(",");
				}
				sb.append("\n");
			}
		} else if(type == 3) {
			sb.append("<!DOCTYPE html>\n" + 
					"<html lang=\"en\">\n" + 
					"<head>\n" + 
					"    <meta charset=\"UTF-8\">\n" + 
					"    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" + 
					"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" + 
					"    <title>Document</title>\n" + 
					"</head>\n" + 
					"<body>\n" + 
					"    <table>\n" + 
					"        <thead>\n" + 
					"            <tr>\n");
			//<th>이름</th>
			for(Map<String,Object> m : result) {
				sb.append("	                <th>" + (String)m.get("name") +"</th>\n");
			}
			sb.append("            </tr>\n" + 
					"        </thead>\n" + 
					"        <tbody>\n");
			// <tr>
			//   <td></td>
			// <tr>
			for(int i = 0; i< row; i++) {
				sb.append("            <tr>\n");
				for(Map<String,Object> m : result) {
					sb.append("	                <td>" +((List<String>)m.get("list")).get(i) + "</td>\n");
				}
				sb.append("            </tr>\n");
			}
			sb.append("        </tbody>\n" + 
					"    </table>\n" + 
					"</body>\n" + 
					"</html>");
		} else if(type == 4) {
			//insert into 스키마이름(이름1,이름2,이름3) values(값1, 값2, 값3);
			StringBuffer headerBuf = new StringBuffer();
			headerBuf.append("insert into ");
			headerBuf.append(dataInfo.getSchema_name());
			headerBuf.append("(");
			for(int j = 0; j< result.size(); j++) {
				Map<String,Object> m = result.get(j);
				headerBuf.append((String)m.get("name"));
				if(j < result.size()-1) headerBuf.append(",");
			}
			headerBuf.append(") values(");
			String header = headerBuf.toString();
			
			for(int i = 0; i< row; i++) {
				sb.append(header);
				for(int j = 0; j< result.size(); j++) {
					Map<String,Object> m = result.get(j);
					sb.append("'");
					sb.append(((List<String>)m.get("list")).get(i));
					sb.append("'");
					if(j < result.size()-1) sb.append(",");
				}
				sb.append(");\n");
			}
		} 
		return sb.toString();
	}
}