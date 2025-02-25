package com.ict.rs.service;

import java.util.List;

import javax.inject.Inject;

import com.ict.rs.vo.CrewVO;
import com.ict.rs.vo.PagingVO;

import org.springframework.stereotype.Service;

import com.ict.rs.dao.CrewDAO;

@Service
public class CrewServiceImpl implements CrewService {
	@Inject
	CrewDAO dao;

	@Override
	public List<CrewVO> crewTopThree() {
		return dao.crewTopThree();
	}
	
	@Override
	public int crewTotalRecord(PagingVO pvo) {
		return dao.crewTotalRecord(pvo);
	}
	
	@Override
	public CrewVO crewViewSelect(int crew_no) {
		return dao.crewViewSelect(crew_no);
	}

	@Override
	public List<CrewVO> crewSelect(PagingVO pvo) {
		return dao.crewSelect(pvo);
	}
	
	@Override
	public int crewInsert(CrewVO vo) {
		return dao.crewInsert(vo);
	}

	@Override
	public int crewUpdate(CrewVO vo) {
		return dao.crewUpdate(vo);
	}

	@Override
	public int crewDelete(int crew_no) {
		return dao.crewDelete(crew_no);
	}
	
}