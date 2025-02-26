package com.ict.rs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ict.rs.vo.PagingVO;
import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

@Mapper
@Repository
public interface RunDAO {
	
	public int runInsert(RunVO vo);

    List<RunVO> runList(RunSelectVO sVO);

	public RunVO runInfo(int no);

	public int runUpdate(RunVO vo);

	public int participantsDelete(int runningno);
	
	public int runDelete(int no);

	public int runJoin(int runningno, int userno);

	public int runLeave(int runningno, int userno);

	public int checkJoined(int runningno, int userno);

	public int checkPersonNum(int runningno);

	public int personNumInsert(int no, int joinednum);

}
