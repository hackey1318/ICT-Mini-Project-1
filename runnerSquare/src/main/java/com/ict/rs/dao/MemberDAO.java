package com.ict.rs.dao;

import com.ict.rs.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {

    int registerMember(MemberVO vo);
}
