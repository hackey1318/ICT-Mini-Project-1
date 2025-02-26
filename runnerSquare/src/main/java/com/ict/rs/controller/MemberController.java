package com.ict.rs.controller;

import com.ict.rs.service.MemberService;
import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    public MemberVO loginOk(@RequestParam String id, @RequestParam String pw, HttpSession session) {
        MemberVO vo = memberService.loginOk(id, pw);

        if (vo != null) {
            session.setAttribute("userNo", vo.getNo());
            session.setAttribute("userId", vo.getId());
            session.setAttribute("userNickName", vo.getNickName());
            session.setAttribute("userRole", vo.getRole());
            session.setAttribute("logStatus", "Y");
        }
        return vo;
    }

    @PostMapping("/logout")
    public void logout(HttpSession session) {
        session.invalidate();
    }

    @GetMapping("/checkId")
    public int duplicateId(@RequestParam String userId) {
        return memberService.idDuplicate(userId);
    }
    
    @GetMapping("/myPageEdit")
    public ModelAndView selectMember(@RequestParam int no) {
        MemberVO vo = memberService.selectMember(no);
        
        String[] telParts = vo.getTel().split("-");
        vo.setTel1(telParts[0]);
        vo.setTel2(telParts[1]);
        vo.setTel3(telParts[2]);
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("vo", vo);
        mav.setViewName("/users/myPageEdit");
        
        return mav;
    }
    
    @PostMapping("/myPageEditOk")
    public String updateMember(@RequestBody MemberVO vo) {
        memberService.updateMember(vo);
        
        return "redirect:/rs/users/myPageEdit?no=" + vo.getNo();
    }
    
    
    @GetMapping("/checkLogStatus")
    @ResponseBody
    public ResponseEntity<Map<String, String>> getUserNo(HttpSession session) {
    	String logStatus = (String) session.getAttribute("logStatus");
    	Map<String, String> response = new HashMap<>();
    	
        if ("Y".equals(logStatus)) {
        	String userNo = session.getAttribute("userNo").toString();
            response.put("userNo", userNo);
        }
        return ResponseEntity.ok(response);  // JSON 형태로 반환
    }
}
