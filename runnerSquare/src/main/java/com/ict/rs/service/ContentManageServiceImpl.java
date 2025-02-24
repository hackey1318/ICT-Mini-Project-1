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

    public ContentVO registerContent(ContentVO vo) {
        vo.setStatus(ContentStatus.ACTIVE.name());

        int res = contentDAO.registerContent(vo);
        if (res < 1) {
            throw new RuntimeException("[" + vo.getType() + "] 컨텐츠 등록에 실패하였습니다.");
        }
        return contentDAO.getContent(vo.getNo());
    }
}
