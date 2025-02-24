package com.ict.rs.dao;

import com.ict.rs.vo.ContentVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ContentDAO {

    List<ContentVO> getContentList(@Param("type") String type, @Param("status") String status);

    int registerContent(ContentVO contentVO);

    ContentVO getContent(@Param("no") int no);
}
