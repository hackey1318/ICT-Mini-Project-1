package com.ict.rs.service;

import com.ict.rs.vo.ContentVO;

import java.util.List;

public interface ContentManageService {

    List<ContentVO> getAllContentList(String type);

    ContentVO registerContent(ContentVO vo);
}
