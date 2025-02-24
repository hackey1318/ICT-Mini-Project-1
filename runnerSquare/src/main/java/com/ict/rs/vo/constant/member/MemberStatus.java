package com.ict.rs.vo.constant.member;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MemberStatus {
    
    ACTIVE("활성화"),
    DEACTIVE("비활성화 > 3개월 패스워드 미 변경"),
    DELETE("탈퇴");

    private final String description;
}
