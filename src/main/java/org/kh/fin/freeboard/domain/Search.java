package org.kh.fin.freeboard.domain;

public class Search {
	
	private String searchCondition;
	private String serchValue;
	
	public Search() {
	}

	public Search(String searchCondition, String serchValue) {
		super();
		this.searchCondition = searchCondition;
		this.serchValue = serchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSerchValue() {
		return serchValue;
	}

	public void setSerchValue(String serchValue) {
		this.serchValue = serchValue;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", serchValue=" + serchValue + "]";
	}
	
	
	
	

}
