package com.ict.rs.service;

import com.ict.rs.dao.MemberDAO;
import com.ict.rs.vo.MemberVO;
import com.ict.rs.vo.constant.member.MemberRole;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberDAO memberDAO;
    

    @Override
    public int registerMember(MemberVO vo) {

        return memberDAO.registerMember(vo);
    }

	@Override
	public MemberVO loginOk(String id, String pw) {
		
		return memberDAO.loginOk(id, pw);
	}
}
