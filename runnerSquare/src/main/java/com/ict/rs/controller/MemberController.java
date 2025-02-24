package com.ict.rs.controller;

import com.ict.rs.service.MemberService;
import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
            session.setAttribute("userName", vo.getName());
            session.setAttribute("logStatus", "Y");
        }
        return vo;
    }

    @PostMapping("/logout")
    public void logout(HttpSession session) {
        session.invalidate();
    }
}
