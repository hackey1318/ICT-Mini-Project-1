package com.ict.rs.service;

import com.ict.rs.vo.MemberVO;

public interface MemberService {

    int registerMember(MemberVO vo);
    MemberVO loginOk(String id, String pw);
}
