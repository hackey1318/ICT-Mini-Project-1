package com.ict.rs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ict.rs.vo.CrewManageVO;

@Mapper
@Repository
public interface CrewManageDAO {
	
	public List<CrewManageVO> crewNameList(@Param("userNo") int userNo);
	
	public List<CrewManageVO> crewMemberList(@Param("crewNo") int crewNo);

	public int updateCrewStatus(CrewManageVO vo);


}
