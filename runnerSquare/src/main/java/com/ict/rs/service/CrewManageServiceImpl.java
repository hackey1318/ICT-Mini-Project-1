package com.ict.rs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ict.rs.dao.CrewDAO;
import com.ict.rs.dao.CrewManageDAO;
import com.ict.rs.vo.CrewManageVO;

@Service
public class CrewManageServiceImpl implements CrewManageService {
	@Inject
	CrewManageDAO dao;

	@Override
	public List<CrewManageVO> crewNameList(int userNo) {
		return dao.crewNameList(userNo);
	}

	@Override
	public List<CrewManageVO> crewMemberList(int userNo) {
		// TODO Auto-generated method stub
		return dao.crewMemberList(userNo);
	}

	
}
