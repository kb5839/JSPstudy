package kr.or.ddit.vo;

import java.io.Serializable;

public class MenuVO implements Serializable{
	private String menuId;
	private String menuText;
	private String menuURI;
	private String jspPath; // view 경로
	public MenuVO() {
		super();
	}
	
	public MenuVO(String menuId, String menuText, String menuURI, String jspPath) {
		super();
		this.menuId = menuId;
		this.menuText = menuText;
		this.menuURI = menuURI;
		this.jspPath = jspPath;
	}

	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuText() {
		return menuText;
	}
	public void setMenuText(String menuText) {
		this.menuText = menuText;
	}
	public String getMenuURI() {
		return menuURI;
	}
	public void setMenuURI(String menuURI) {
		this.menuURI = menuURI;
	}
	public String getJspPath() {
		return jspPath;
	}
	public void setJspPath(String jspPath) {
		this.jspPath = jspPath;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuVO other = (MenuVO) obj;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + ", menuText=" + menuText + ", menuURI=" + menuURI + ", jspPath=" + jspPath
				+ "]";
	}
	
	
}
