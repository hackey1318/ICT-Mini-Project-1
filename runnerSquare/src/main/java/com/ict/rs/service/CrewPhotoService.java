package com.ict.rs.service;

import com.ict.rs.dto.CrewPhotoDTO;
import com.ict.rs.vo.CrewPhotoVO;

import java.util.List;

public interface CrewPhotoService {

    int registerCrewPhoto(CrewPhotoVO crewPhotoVO);

    List<CrewPhotoDTO> getCrewPhoto(int crewNo);
}
