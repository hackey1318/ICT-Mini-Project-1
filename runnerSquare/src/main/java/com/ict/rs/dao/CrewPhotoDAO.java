package com.ict.rs.dao;

import com.ict.rs.dto.CrewPhotoDTO;
import com.ict.rs.vo.CrewPhotoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CrewPhotoDAO {

    int registerCrewPhoto(CrewPhotoVO vo);

    List<CrewPhotoDTO> selectCrewPhotoByCrewNo(@Param("crewNo") int crewNo, @Param("type") String type);
}
