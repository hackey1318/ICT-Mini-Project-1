package com.ict.rs.dao;

import com.ict.rs.vo.CrewMemberVO;
import com.ict.rs.vo.CrewVO;
import com.ict.rs.vo.PagingVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CrewDAO {
	public List<CrewVO> crewTopThree();
	public int crewTotalRecord(PagingVO pvo);
    public CrewVO crewViewSelect(int crew_no);
    public List<CrewVO> crewSelect(PagingVO pvo);
    public int crewInsert(CrewVO vo);
    public int crewUpdate(CrewVO vo);
    public int crewDelete(int crew_no);
    public int crewJoin(CrewMemberVO vo);
}
