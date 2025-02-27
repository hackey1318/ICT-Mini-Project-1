package com.ict.rs.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface myPageDAO{
   public int pwdChk(String userId, String pwd);
}
