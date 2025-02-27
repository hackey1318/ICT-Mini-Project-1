package com.ict.rs.vo;

public class RunVO {
	private int no;
	private String name;
	private String runningdate;
	private String runningcity;
	private String region;
	private String meetingpoint;
	private String runningtime;
	private String type;
	private int runmaxnum;
	private int joinednum;
	private int crewno;
	private int ownerno;
	private String status;

	public RunVO() {}
	@Override
    public String toString() {
        return "runVO [no=" + no + ", name=" + name + ", runningdate=" + runningdate + 
                ", runningcity=" + runningcity + ", region=" + region + ", meetingpoint=" + meetingpoint +
                ", runningtime=" + runningtime + ", type=" + type + ", joinednum=" + joinednum + ", runmaxnum=" + runmaxnum +
                ", crewno=" + crewno + ",ownerno=" + ownerno + ",status=" + status + "]";
    }
	
	public int getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(int ownerno) {
		this.ownerno = ownerno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRunningdate() {
		return runningdate;
	}
	public void setRunningdate(String runningdate) {
		this.runningdate = runningdate;
	}
	public String getRunningcity() {
		return runningcity;
	}
	public void setRunningcity(String runningcity) {
		this.runningcity = runningcity;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getMeetingpoint() {
		return meetingpoint;
	}
	public void setMeetingpoint(String meetingpoint) {
		this.meetingpoint = meetingpoint;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRunmaxnum() {
		return runmaxnum;
	}
	public void setRunmaxnum(int runmaxnum) {
		this.runmaxnum = runmaxnum;
	}
	public int getJoinednum() {
		return joinednum;
	}
	public void setJoinednum(int joinednum) {
		this.joinednum = joinednum;
	}
	public int getCrewno() {
		return crewno;
	}
	public void setCrewno(int crewno) {
		this.crewno = crewno;
	}

	
}
