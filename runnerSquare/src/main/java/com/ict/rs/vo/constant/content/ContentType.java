package com.ict.rs.vo.constant.content;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ContentType {

    BANNER("배너"),
    NOTICE("공지"),
    EVENT("이벤트");

    private final String description;

    public static boolean isValidContentType(String type) {
        for (ContentType contentType : ContentType.values()) {
            if (contentType.name().equalsIgnoreCase(type)) {
                return true;
            }
        }
        return false;
    }
}
