package com.ict.rs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

@Mapper
@Repository
public interface RunDAO {
	//번개런 등록
	public int runInsert(RunVO vo);

	//런 선택(목록)
	List<RunVO> runList(RunSelectVO sVO);

	//런 선택
	public RunVO runInfo(int run_no);

	//런 업데이트
	public int runUpdate(RunVO vo);

	//런 참석자 삭제
	public int participantsDelete(int run_no);
	
	//런 삭제
	public int runDelete(int run_no);

	//런 조인
	public int runJoin(int run_no, String userid);

	//런 조인 해제
	public int runLeave(int run_no, String userid);

	//조인 여부 확인
	public int checkJoined(int run_no, String userid);

	//조인 인원 확인
	public int checkPersonNum(int run_no);

	//조인 인원 db에 넣기
	public int personNumInsert(int run_no, int joinednum);

}
