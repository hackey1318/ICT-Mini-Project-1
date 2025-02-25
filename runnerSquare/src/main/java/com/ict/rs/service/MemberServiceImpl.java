package com.ict.rs.service;

import com.ict.rs.dao.MembersDAO;
import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MembersDAO membersDAO;

    @Override
    public int registerMember(MemberVO vo) {

        return membersDAO.registerMember(vo);
    }

	@Override
	public MemberVO loginOk(String id, String pw) {

		return membersDAO.loginOk(id, pw);
	}

    @Override
    public int idDuplicate(String id) {

        return membersDAO.idDuplicate(id);
    }

    @Override
    public MemberVO getUser(int userNo) {
        return membersDAO.getUser(userNo);
    }
}
