package com.ict.rs.vo.constant.notification;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum NotificationStatus {

    READABLE("읽지 않음"),
    READ("읽음");

    private final String description;
}
