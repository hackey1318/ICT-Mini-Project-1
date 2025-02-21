package com.ict.rs.controller;

import com.ict.rs.service.ContentService;
import com.ict.rs.vo.ContentVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/content")
public class ContentController {

    private final ContentService contentService;

    @GetMapping("/{type}")
    public List<ContentVO> getActiveContent(@PathVariable String type) {

        // 회원의 요청인지 확인

        return contentService.getActiveContentList(type);
    }
}
