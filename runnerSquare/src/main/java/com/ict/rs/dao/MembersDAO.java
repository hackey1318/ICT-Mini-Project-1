package com.ict.rs.dao;

import com.ict.rs.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MembersDAO {

    int registerMember(MemberVO vo);
    
    MemberVO loginOk(String id, String pw);

    int idDuplicate(String id);

    MemberVO selectMember(int no);

    int updateMember(MemberVO vo);

    MemberVO getUser(int no);
}
