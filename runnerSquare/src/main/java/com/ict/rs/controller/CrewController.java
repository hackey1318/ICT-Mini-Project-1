package com.ict.rs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.ict.rs.dto.CrewPhotoDTO;
import com.ict.rs.service.CrewPhotoService;
import com.ict.rs.vo.CrewMemberVO;
import com.ict.rs.vo.CrewPhotoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.rs.service.CrewService;
import com.ict.rs.vo.CrewVO;
import com.ict.rs.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CrewController {
	@Inject
	CrewService service;

	@Inject
	CrewPhotoService crewPhotoService;

	@GetMapping("/crew/topThree")
	@ResponseBody
	public List<CrewVO> crewTopThree() {

		return service.crewTopThree();
	}

	@GetMapping("/crew/crewSearch")
	public ModelAndView crewSearch(PagingVO pvo, String city, String district, String crewName) {
		if(city != null && !city.equals("")) pvo.setCity(city);
		else pvo.setCity("");
		if(district != null && !district.equals("")) pvo.setDistrict(district);
		else pvo.setDistrict("");
		if(crewName != null && !crewName.equals("")) pvo.setCrewName(crewName);
		else pvo.setCrewName("");

		pvo.setTotalRecord(service.crewTotalRecord(pvo));
		System.out.println(pvo.toString());
		List<CrewVO> crewList = service.crewSelect(pvo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pvo", pvo);
		mav.addObject("crewList", crewList);
		mav.setViewName("crew/crewSearch");
		return mav;
	}

	@ResponseBody
	@GetMapping("/crew/details/{no}")
	public CrewVO crewDetail(@PathVariable int no) {

		CrewVO crew = service.crewViewSelect(no);

		return crew;
	}

	@PostMapping("/crew/crewCreateOk")
	@ResponseBody
	public CrewVO crewCreateOk(@RequestBody CrewVO vo, HttpSession session) {

		String userNo = (String)session.getAttribute("userId");
		vo.setUserid(userNo);

		int res = service.crewInsert(vo);
		if (res > 0) {
			return service.crewViewSelect(vo.getNo());
		} else {
			throw new RuntimeException("크루 생성에 실패하였습니다.");
		}
	}

	@GetMapping("/crew/crewUpdate")
	@ResponseBody
	public CrewVO crewUpdate(@RequestParam int crew_no) {
		CrewVO vo = service.crewViewSelect(crew_no);

		return vo;
	}

	@PostMapping("/crew/crewUpdateOk")
	@ResponseBody
	public int crewUpdateOk(@RequestBody CrewVO vo) {
		return service.crewUpdate(vo);
	}

	@GetMapping("/crew/crewDelete")
	@ResponseBody
	public int crewDelete(@RequestParam int crew_no) {

		return service.crewDelete(crew_no);
	}

	@PostMapping("/crew/crewJoin")
	@ResponseBody
	public int crewJoin(@RequestBody CrewMemberVO vo) {
		vo.setStatus("active");

		return service.crewJoin(vo);
	}

	@ResponseBody
	@PostMapping("/crew/crewPhoto")
	public int registerCrewPhoto(@RequestBody CrewPhotoVO crewPhotoVO) {

		return crewPhotoService.registerCrewPhoto(crewPhotoVO);
	}

	@ResponseBody
	@GetMapping("/crew/crewPhoto/{crewNo}")
	public List<CrewPhotoDTO> getCrewPhoto(@PathVariable int crewNo) {

		return crewPhotoService.getCrewPhoto(crewNo);
	}
}
