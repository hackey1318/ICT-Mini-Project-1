package com.ict.rs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.rs.dao.myPageDAO;
import com.ict.rs.service.myPageService;

@Controller
public class myPageController {

	@Inject
	myPageService myPageService; 
	
	@GetMapping("/users/myPage")
	
	public String myPage() {
		return "/users/myPage";
	}
	@PostMapping("/users/myPage/pwdChk")
	@ResponseBody
	public int pwdChk(String userId, String pwd) {
		System.out.println("pwd"+ pwd); 
	     return myPageService.pwdChk(userId,pwd);
	    }
	
	@GetMapping("/users/myPageEdit")
	public String myPageEdit() {
		return "/users/myPageEdit";
	}


}