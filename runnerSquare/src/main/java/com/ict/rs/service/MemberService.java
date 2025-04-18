package com.ict.rs.service;

import com.ict.rs.vo.MemberVO;

public interface MemberService {

    int registerMember(MemberVO vo);

    MemberVO loginOk(String id, String pw);

    int idDuplicate(String id);

    MemberVO selectMember(int no);

	int updateMember(MemberVO vo);

    MemberVO getUser(int userNo);
}
