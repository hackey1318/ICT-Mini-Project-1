package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

public interface RunService {

	public int runInsert(RunVO vo);

	List<RunVO> runList(RunSelectVO sVO);

	public int runUpdate(RunVO vo);

	public int runDelete(int no);
	
	public int participantsDelete(int runningno);

	public RunVO runInfo(int no);

	public int runJoin(int runningno, int userno);

	public int runLeave(int runningno, int userno);

	public int checkJoined(int runningno, int userno);

	public int checkPersonNum(int runningno);

	public int personNumInsert(int no, int joinednum);

}
