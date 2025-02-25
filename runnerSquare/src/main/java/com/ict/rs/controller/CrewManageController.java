package com.ict.rs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.rs.service.CrewManageService;
import com.ict.rs.service.CrewService;
import com.ict.rs.vo.CrewManageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CrewManageController {
	@Inject
	CrewManageService service;

	@RequestMapping("/crew/crewManage")
	public String crewManage(Model model) {


		return "crew/crewManage";
	}

	@ResponseBody
	@GetMapping("/crew/crewManage/list")
	public List<CrewManageVO> crewNameList(@RequestParam Integer userNo) {

		List<CrewManageVO> res = service.crewNameList(userNo);

		return res;
	}

	@ResponseBody
	@GetMapping("/crew/crewManage/memberList")
	public List<CrewManageVO> crewMemberList(@RequestParam Integer userNo){
		List<CrewManageVO> result = service.crewMemberList(userNo);
		return result;
	}
	@ResponseBody
	@PostMapping("/crew/crewManage/updateMemberStatus")
	public String updateMemberStatus(@RequestParam int userNo, @RequestParam int crewNo, @RequestParam String status) {
		CrewManageVO vo = new CrewManageVO();
		vo.setUserNo(userNo);
		vo.setCrewNo(crewNo);
		vo.setStatus(status);

		int updateCount = service.updateCrewStatus(vo);

		if(updateCount > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

}
