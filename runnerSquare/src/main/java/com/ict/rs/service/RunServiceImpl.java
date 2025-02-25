package com.ict.rs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ict.rs.dao.RunDAO;
import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

@Service
public class RunServiceImpl implements RunService {

	@Inject RunDAO dao;

	@Override
	public int runInsert(RunVO vo) {
		return dao.runInsert(vo);
	}

	@Override
    public List<RunVO> runList(RunSelectVO sVO) {
        return dao.runList(sVO);
    }

	@Override
	public int runUpdate(RunVO vo) {
		return dao.runUpdate(vo);
	}

	@Override
	public int participantsDelete(int run_no) {
		return dao.participantsDelete(run_no);
	}
	
	@Override
	public int runDelete(int run_no) {
		return dao.runDelete(run_no);
	}

	@Override
	public RunVO runInfo(int run_no) {
		return dao.runInfo(run_no);
	}

	@Override
	public int runJoin(int run_no, String userid) {
		return dao.runJoin(run_no, userid);
	}

	@Override
	public int runLeave(int run_no, String userid) {
		return dao.runLeave(run_no, userid);
	}

	@Override
	public int checkJoined(int run_no, String userid) {
		return dao.checkJoined(run_no, userid);
	}

	@Override
	public int checkPersonNum(int run_no) {
		return dao.checkPersonNum(run_no);
	}

	@Override
	public int personNumInsert(int run_no, int joinednum) {
		return dao.personNumInsert(run_no, joinednum);
	}

}
