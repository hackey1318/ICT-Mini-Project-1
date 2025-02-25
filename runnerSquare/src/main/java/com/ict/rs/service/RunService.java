package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

public interface RunService {

	public int runInsert(RunVO vo);

	List<RunVO> runList(RunSelectVO sVO);

	public int runUpdate(RunVO vo);

	public int runDelete(int run_no);
	
	public int participantsDelete(int run_no);

	public RunVO runInfo(int run_no);

	public int runJoin(int run_no, String userid);

	public int runLeave(int run_no, String userid);

	public int checkJoined(int run_no, String userid);

	public int checkPersonNum(int run_no);

	public int personNumInsert(int run_no, int joinednum);


}

