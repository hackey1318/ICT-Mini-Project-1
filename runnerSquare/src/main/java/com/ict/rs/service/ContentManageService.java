package com.ict.rs.service;

import com.ict.rs.vo.ContentVO;

import java.util.List;

public interface ContentManageService {

    public List<ContentVO> getAllContentList(String type);
}
