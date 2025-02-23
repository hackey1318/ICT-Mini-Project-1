package com.ict.rs.vo.constant.content;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ContentStatus {

    ACTIVE("활성화"),
    DEACTIVE("비활성화"),
    DELETE("삭제");

    private final String description;
}
