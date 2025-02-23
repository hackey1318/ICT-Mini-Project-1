package com.ict.rs.dao;

import com.ict.rs.vo.ImagesVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface FileSystemDAO {

    int insertImages(@Param("images") List<ImagesVO> images);

    List<ImagesVO> getImage(@Param("imageIds") List<String> imageIdList);
}
