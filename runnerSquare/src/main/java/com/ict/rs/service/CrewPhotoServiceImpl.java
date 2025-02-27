package com.ict.rs.service;

import com.ict.rs.dao.CrewPhotoDAO;
import com.ict.rs.dto.CrewPhotoDTO;
import com.ict.rs.vo.CrewPhotoVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CrewPhotoServiceImpl implements CrewPhotoService {

    private final CrewPhotoDAO crewPhotoDAO;

    @Override
    public int registerCrewPhoto(CrewPhotoVO crewPhotoVO) {
        return crewPhotoDAO.registerCrewPhoto(crewPhotoVO);
    }

    @Override
    public List<CrewPhotoDTO> getCrewPhoto(int crewNo) {
        return crewPhotoDAO.selectCrewPhotoByCrewNo(crewNo, null);
    }
}
