package com.ict.rs.controller;

import com.ict.rs.service.MemberService;
import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class MemberContoller {

    private final MemberService memberService;

    @PostMapping
    public int registerMember(@Valid @RequestBody MemberVO vo) {

        return memberService.registerMember(vo);
    }
}
