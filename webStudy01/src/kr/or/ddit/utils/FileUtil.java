package kr.or.ddit.utils;

import java.io.*;
import java.util.*;

public class FileUtil{
	
	private FileUtil(){}
	
	public static List<String> getSearchFile(String path, String... extensions){
		File folder = new File(path);
		List<String> fileName = new ArrayList<>();
		fileName.addAll(Arrays.asList(folder.list()));
		
		for(int i=0; i<fileName.size(); i++){
			boolean check = false;
			for(String extension : extensions){
				if(fileName.get(i).contains(extension)){
					check = true;
					break;
				}
			}
			if(!check){
				fileName.remove(i--);
			}
		}
		return fileName;
	}
}