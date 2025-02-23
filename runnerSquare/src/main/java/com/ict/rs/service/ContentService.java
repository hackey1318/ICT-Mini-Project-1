package com.ict.rs.service;

import com.ict.rs.vo.ContentVO;

import java.util.List;

public interface ContentService {

    public List<ContentVO> getActiveContentList(String type);
}
