package com.ict.rs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.rs.service.CrewService;
import com.ict.rs.vo.CrewVO;
import com.ict.rs.vo.PagingVO;

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
	
	@PostMapping("/crew/crewCreateOk")
	public String crewCreateOk(CrewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		int result = service.crewInsert(vo);
		
		if (result == 1) {
			
		} else {
			
		}
		return "";
	}
	
}
