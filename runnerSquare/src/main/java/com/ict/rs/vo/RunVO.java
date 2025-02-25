package com.ict.rs.vo;

public class RunVO {
	private int run_no;
	private String userid;
	private String runname;
	private String rundate;
	private String runsido;
	private String rungu;
	private String runspot;
	private String runtime;
	private String runtype;
	private int runmaxnum;
	private int joinednum;
	private String crewname;

	public RunVO() {}
	@Override
    public String toString() {
        return "runVO [run_no=" + run_no + ", userid=" + userid + ", runname=" + runname + ", rundate=" +
                rundate + ", runsido=" + runsido + ", rungu=" + rungu + ", runspot=" + runspot +
                ", runtime=" + runtime + ", runtype=" + runtype + ", joinednum=" + joinednum + ", runmaxnum=" + runmaxnum +
                ", crewname=" + crewname + "]";
    }

	public int getJoinednum() {
		return joinednum;
	}
	public void setJoinednum(int joinednum) {
		this.joinednum = joinednum;
	}
	public int getRun_no() {
		return run_no;
	}
	public void setRun_no(int run_no) {
		this.run_no = run_no;
	}
	public String getCrewname() {
		return crewname;
	}
	public void setCrewname(String crewname) {
		this.crewname = crewname;
	}
	public String getRungu() {
		return rungu;
	}
	public void setRungu(String rungu) {
		this.rungu = rungu;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRunname() {
		return runname;
	}
	public void setRunname(String runname) {
		this.runname = runname;
	}
	public String getRundate() {
		return rundate;
	}
	public void setRundate(String rundate) {
		this.rundate = rundate;
	}
	public String getRunsido() {
		return runsido;
	}
	public void setRunsido(String runsido) {
		this.runsido = runsido;
	}
	public String getRunspot() {
		return runspot;
	}
	public void setRunspot(String runspot) {
		this.runspot = runspot;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public int getRunmaxnum() {
		return runmaxnum;
	}
	public void setRunmaxnum(int runmaxnum) {
		this.runmaxnum = runmaxnum;
	}
	public String getRuntype() {
		return runtype;
	}
	public void setRuntype(String runtype) {
		this.runtype = runtype;
	}
}
