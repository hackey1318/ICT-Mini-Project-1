package com.ict.rs.vo.constant.member;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MemberRole {

    ADMIN("관리자"),
    USER("일반 사용자");

    private final String description;
}
