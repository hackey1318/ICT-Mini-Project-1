package com.ict.rs.controller;

import com.ict.rs.service.ContentManageService;
import com.ict.rs.vo.ContentVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/content-management")
public class ContentManagementController {

    private final ContentManageService contentManageService;

    @GetMapping("/{type}")
    public List<ContentVO> getAllContent(@PathVariable String type) {

        // 관리자의 요청인지 확인

        return contentManageService.getAllContentList(type);
    }

    @PostMapping("/{type}")
    public ContentVO generateContent(@PathVariable String type, ContentVO vo) {

        vo.setType(type);
        return contentManageService.registerContent(vo);
    }

}
