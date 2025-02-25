package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.CrewManageVO;

public interface CrewManageService {

	public List<CrewManageVO> crewNameList(int userNo);
	
	public List<CrewManageVO> crewMemberList(int userNo);
}
