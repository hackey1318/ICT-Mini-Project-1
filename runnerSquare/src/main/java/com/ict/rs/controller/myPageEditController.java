package com.ict.rs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ict.rs.service.CrewService;

@Controller
public class myPageEditController {

	@GetMapping("/crew/myPageEnter")
	public String myPageEnter() {
		return "/crew/myPageEnter";
	}

}