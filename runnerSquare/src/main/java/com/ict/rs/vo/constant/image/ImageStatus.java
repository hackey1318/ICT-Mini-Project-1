package com.ict.rs.vo.constant.image;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ImageStatus {

    ACTIVE("활성화"),
    DELETE("삭제");

    private final String description;
}
