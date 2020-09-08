package kr.or.ddit.servlet04;

import java.io.File;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;

public class FileWrapper extends File{

	public FileWrapper(File file, ServletContext application) {
		super(file.getAbsolutePath());
		clz = file.isDirectory() ? "lazy folder" : "file";
		String abPath = file.getAbsolutePath();
		String contextRealPath = application.getRealPath("/");
		String tmp = StringUtils.remove(abPath, contextRealPath);
		fileURI = tmp.replace(File.separatorChar, '/');
		fileURI = fileURI.startsWith("/") ? fileURI : "/" + fileURI;
	}
	
	private String clz;
	private String fileURI;
	public String getClz() {
		return clz;
	}
	public String getFileURI() {
		return fileURI;
	}
	
	public String getKey() {
		return fileURI;
	}
	public String getTitle() {
		return getName();
	}
	public boolean isFolder() {
		return isDirectory();
	}
	public boolean isLazy() {
		return true;
	}
}

