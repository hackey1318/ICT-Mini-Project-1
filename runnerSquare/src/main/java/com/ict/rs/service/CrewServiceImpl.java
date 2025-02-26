package com.ict.rs.service;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import com.ict.rs.dao.CrewPhotoDAO;
import com.ict.rs.dto.CrewPhotoDTO;
import com.ict.rs.vo.CrewPhotoVO;
import com.ict.rs.vo.CrewVO;
import com.ict.rs.vo.PagingVO;

import org.springframework.stereotype.Service;

import com.ict.rs.dao.CrewDAO;

@Service
public class CrewServiceImpl implements CrewService {
	@Inject
	CrewDAO dao;

	@Inject
	CrewPhotoDAO crewPhotoDAO;

	@Override
	public List<CrewVO> crewTopThree() {
		List<CrewVO> crewVOList = dao.crewTopThree();
		for (CrewVO crewVO : crewVOList) {
			List<CrewPhotoDTO> crewPhotoList =  crewPhotoDAO.selectCrewPhotoByCrewNo(crewVO.getNo(), "logo");
			crewVO.setImageIdList(crewPhotoList.stream()
					.map(CrewPhotoDTO::getImageId)
					.collect(Collectors.toList()));
		}
		return crewVOList;
	}
	
	@Override
	public int crewTotalRecord(PagingVO pvo) {
		return dao.crewTotalRecord(pvo);
	}
	
	@Override
	public CrewVO crewViewSelect(int crew_no) {
		CrewVO crewVO = dao.crewViewSelect(crew_no);
		List<CrewPhotoDTO> crewPhotoList =  crewPhotoDAO.selectCrewPhotoByCrewNo(crewVO.getNo(), null);
		crewVO.setImageIdList(crewPhotoList.stream()
				.map(CrewPhotoDTO::getImageId)
				.collect(Collectors.toList()));
		return crewVO;
	}

	@Override
	public List<CrewVO> crewSelect(PagingVO pvo) {
		List<CrewVO> crewVOList =  dao.crewSelect(pvo);
		for (CrewVO crewVO : crewVOList) {
			List<CrewPhotoDTO> crewPhotoList =  crewPhotoDAO.selectCrewPhotoByCrewNo(crewVO.getNo(), "logo");
			crewVO.setImageIdList(crewPhotoList.stream()
					.map(CrewPhotoDTO::getImageId)
					.collect(Collectors.toList()));
		}
		return crewVOList;
	}
	
	@Override
	public int crewInsert(CrewVO vo) {
		return dao.crewInsert(vo);
	}

	@Override
	public int crewUpdate(CrewVO vo) {
		return dao.crewUpdate(vo);
	}

	@Override
	public int crewDelete(int crew_no) {
		return dao.crewDelete(crew_no);
	}

}