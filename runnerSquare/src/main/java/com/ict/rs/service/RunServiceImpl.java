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

	@Inject
	NotificationService notificationService;

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
	public int participantsDelete(int runningno) {
		return dao.participantsDelete(runningno);
	}
	
	@Override
	public int runDelete(int no) {
		return dao.runDelete(no);
	}

	@Override
	public RunVO runInfo(int no) {
		return dao.runInfo(no);
	}

	@Override
	public int runJoin(int runningno, int userno) {
		int join = dao.runJoin(runningno, userno);
		notificationService.generateNotification(userno, dao.runInfo(runningno), "참여");
		return join;
	}

	@Override
	public int runLeave(int runningno, int userno) {
		int leave = dao.runLeave(runningno, userno);
		notificationService.generateNotification(userno, dao.runInfo(runningno), "참여 취소");
		return leave;
	}

	@Override
	public int checkJoined(int no, int userno) {
		return dao.checkJoined(no, userno);
	}

	@Override
	public int checkPersonNum(int runningno) {
		return dao.checkPersonNum(runningno);
	}

	@Override
	public int personNumInsert(int no, int joinednum) {
		return dao.personNumInsert(no, joinednum);
	}

	@Override
	public String getCrewName(int no) {
		return dao.getCrewName(no);
	}

}
