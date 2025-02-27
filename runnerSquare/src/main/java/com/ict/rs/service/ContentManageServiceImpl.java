package com.ict.rs.service;

import com.ict.rs.dao.ContentDAO;
import com.ict.rs.vo.ContentVO;
import com.ict.rs.vo.constant.content.ContentStatus;
import com.ict.rs.vo.constant.content.ContentType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ContentManageServiceImpl implements ContentManageService {

    private final ContentDAO contentDAO;

    public List<ContentVO> getAllContentList(String type) {

        if (!ContentType.isValidContentType(type)) {
            throw new RuntimeException("요청한 Type이 존재하지 않습니다.");
        }
        return contentDAO.getContentList(type, null);
    }
}
