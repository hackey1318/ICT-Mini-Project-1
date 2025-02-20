package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationVO {

    private int no;

    private Long userNo;

    private String content;

    private String status;

    private String createdAt;

    private String updatedAt;
}
