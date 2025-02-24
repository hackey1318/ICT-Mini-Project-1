package com.ict.rs.controller;

import com.ict.rs.service.MemberService;

import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class MemberController {

    private final MemberService memberService;

    @PostMapping
    public int registerMember(@Valid @RequestBody MemberVO vo) {

        return memberService.registerMember(vo);
    }
    
    @PostMapping("/loginOk")
    public MemberVO loginOk(@RequestParam String id, @RequestParam String pw, HttpSession session ) {
    	MemberVO vo = memberService.loginOk(id, pw);
    	
    	if(vo != null) {
    		session.setAttribute("logId", vo.getId());
    		session.setAttribute("logName", vo.getName());
    		session.setAttribute("logStatus", "Y");
    		
    	}
    	return vo;
    }
}
    
