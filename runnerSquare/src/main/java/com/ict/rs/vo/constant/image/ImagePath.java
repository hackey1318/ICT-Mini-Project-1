package com.ict.rs.vo.constant.image;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ImagePath {

    LOCAL("/img");

    private final String path;
}
