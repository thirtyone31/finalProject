package org.kh.fin.member.domain;

public class Msearch {
	private String searchCondition;//jsp의 값을 담기 위해서 필요하다
	private String searchValue;
	
	public Msearch() {}

	public Msearch(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "Msearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}

	
	
	
}
