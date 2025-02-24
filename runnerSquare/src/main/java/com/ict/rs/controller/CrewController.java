package com.ict.rs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

	@GetMapping("/")
	@ResponseBody
	public ModelAndView crewTopThree() {
		List<CrewVO> crewList = service.crewTopThree();

		ModelAndView mav = new ModelAndView();
		mav.addObject("crewList", crewList);
		mav.setViewName("/home");
		return mav;
	}

	@GetMapping("/crew/crewSearch")
	public ModelAndView crewSearch(PagingVO pvo, String city, String district, String crewName) {
		if(city != null && !city.equals("")) pvo.setCity(city);
		else pvo.setCity("%%");
		if(district != null && !district.equals("")) pvo.setDistrict(district);
		else pvo.setDistrict("%%");
		if(crewName != null && !crewName.equals("")) pvo.setCrewName("%" + crewName + "%");
		else pvo.setCrewName("%%");
		
		pvo.setTotalRecord(service.crewTotalRecord(pvo));
		System.out.println(pvo.toString());
		List<CrewVO> crewList = service.crewSelect(pvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pvo", pvo);
		mav.addObject("crewList", crewList);
		mav.setViewName("crew/crewSearch");
		return mav;
	}
	
	@GetMapping("/crew/crewCreate")
	public String crewCreate() {
		return "crew/crewCreate";
	}

	@ResponseBody
	@GetMapping("/crew/details/{no}")
	public CrewVO crewDetail(@PathVariable int no) {

		CrewVO crew = service.crewViewSelect(no);

		return crew;
	}

	@CrossOrigin(origins = "http://localhost:9090")
	@PostMapping("/crew/crewCreateOk")
	@ResponseBody
	public String crewCreateOk(@RequestBody CrewVO vo) {
		// HttpSession session = request.getSession();
		// String userNo = (String)session.getAttribute("id");
		// vo.setUserid(userNo);

		/*
		CrewManageVO mvo = new CrewManageVO();
		mvo.setCrewNo = vo.no;
		mvo.setUserNo = userNo;
		mvo.setRole = "크루장";
		mvo.setStatus = "";
		*/

		log.info(vo.toString());

		return service.crewInsert(vo) + "";
	}

	@GetMapping("/crew/crewUpdate")
	public ModelAndView crewUpdate(int crew_no) {
		CrewVO vo = service.crewViewSelect(crew_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("/crew/crewUpdate");
		log.info(vo.toString());
		return mav;
	}

	@CrossOrigin(origins = "http://localhost:9090")
	@PostMapping("/crew/crewUpdateOk")
	@ResponseBody
	public String crewUpdateOk(@RequestBody CrewVO vo) {
		// HttpSession session = request.getSession();

		// vo.setUserid((String)session.getAttribute("logId"));

		log.info(vo.toString());

		return service.crewUpdate(vo) + "";
	}

	@GetMapping("/crew/crewDelete")
	public ModelAndView crewDelete(int crew_no) {
		ModelAndView mav = new ModelAndView();

		int result = service.crewDelete(crew_no);
		if (result > 0) {
			log.info("크루 삭제 성공");
		} else {
			log.info("크루 삭제 실패");
		}
		mav.setViewName("redirect:/");

		return mav;
	}

//	@PostMapping("/crew/crewJoin")
//	@ResponseBody
//	public String crewJoin(int crew_no, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//
//		String id = (String) session.getAttribute("id");
//		if (id == "" || id == null) {
//			return "redirect:/views/member/login";
//		}
//
//		CrewManageVO vo = new CrewManageVO();
//		vo.setCrewNo = crew_no;
//		vo.setUserNo = id;
//		vo.setRole = "크루원";
//		vo.setStatus = "승인대기";
//
//
//		return service.crewJoin(vo) + "";
//	}
}
