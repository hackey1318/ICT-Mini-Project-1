package com.ict.rs.vo;

import lombok.ToString;

@ToString
public class PagingVO {
	private int nowPage = 1;
	private int onePageRecord = 12;
	
	private int totalRecord;
	private int totalPage;
	
	private int offset;
	
	private int onePageCount = 5;
	private int startPageNum = 1;
	
	private String city;
	private String district;
	private String crewName;
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		offset = (nowPage - 1) * onePageRecord;
		
		startPageNum = (nowPage - 1) / onePageCount * onePageCount + 1;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage = (totalRecord % onePageRecord == 0) ? totalRecord /onePageRecord : totalRecord / onePageRecord + 1;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String searchKey) {
		this.city = searchKey;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String searchWord) {
		this.district = searchWord;
	}
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	
}

