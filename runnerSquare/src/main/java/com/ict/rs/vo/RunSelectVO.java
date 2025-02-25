package com.ict.rs.vo;

public class RunSelectVO {
	private String searchDate;
	private String searchDay;
	private String searchSido;
	private String searchGu;
	private String searchCrewName;
	private String searchTime;

	public RunSelectVO() {}
	@Override
	public String toString() {
		return "runSelectVO [searchDate="+searchDate+", searchDay="+searchDay+", searchSido="+
				searchSido+", searchGu="+searchGu+", searchCrewName="+searchCrewName+", searchTime="+searchTime+"]";
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getSearchDay() {
		return searchDay;
	}
	public void setSearchDay(String searchDay) {
		this.searchDay = searchDay;
	}
	public String getSearchSido() {
		return searchSido;
	}
	public void setSearchSido(String searchSido) {
		this.searchSido = searchSido;
	}
	public String getSearchGu() {
		return searchGu;
	}
	public void setSearchGu(String searchGu) {
		this.searchGu = searchGu;
	}
	public String getSearchCrewName() {
		return searchCrewName;
	}
	public void setSearchCrewName(String searchCrewName) {
		this.searchCrewName = searchCrewName;
	}
	public String getSearchTime() {
		return searchTime;
	}
	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}


}
