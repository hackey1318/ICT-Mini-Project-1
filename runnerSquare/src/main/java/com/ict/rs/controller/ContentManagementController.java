package com.ict.rs.controller;

import com.ict.rs.service.ContentManageService;
import com.ict.rs.vo.ContentVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/content-management")
public class ContentManagementController {

    private final ContentManageService contentManageService;

    @GetMapping("/{type}")
    public List<ContentVO> getAllContent(@PathVariable String type) {

        // 회원의 요청인지 확인

        return contentManageService.getAllContentList(type);
    }
}
