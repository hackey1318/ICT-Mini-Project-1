package com.ict.rs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ict.rs.service.CrewService;

@Controller
public class CrewController {
	@Inject
	CrewService service;
	
	@GetMapping("/crew/crewSearch")
	public String crewSearch() {
		return "crew/crewSearch";
	}
	
}
