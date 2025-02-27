package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.PagingVO;
import com.ict.rs.vo.CrewMemberVO;
import com.ict.rs.vo.CrewVO;

public interface CrewService {
	public List<CrewVO> crewTopThree();
	public int crewTotalRecord(PagingVO pvo);
    public CrewVO crewViewSelect(int crew_no);
    public List<CrewVO> crewSelect(PagingVO pvo);
    public int crewInsert(CrewVO vo);
    public int crewUpdate(CrewVO vo);
    public int crewDelete(int crew_no);
    public int crewJoin(CrewMemberVO vo);
}
