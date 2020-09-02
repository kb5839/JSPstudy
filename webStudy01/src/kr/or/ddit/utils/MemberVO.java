package kr.or.ddit.utils;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MemberVO {

	public static void main(String[] args) {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,String> map = new HashMap<>();
		map.put("mem_id","S001");
		map.put("mem_name","원종찬");
		map.put("mem_tel","000-0000-0000");
		map.put("mem_addr","종찬이네집");
		map.put("mem_age","23");
		map.put("mem_gen","true");
		
		try {  
		String json = mapper.writeValueAsString(map); 
		System.out.println(json); // compact-print 
		System.out.println();
		System.out.println();
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map); 
		System.out.println(json); 
		} catch (JsonProcessingException e) { 
			e.printStackTrace(); 
			} 
		} 
	}
