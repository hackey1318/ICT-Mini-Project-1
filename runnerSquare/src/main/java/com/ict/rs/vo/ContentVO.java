package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentVO {

    private int no;

    private String title;

    private String imageId;

    private String type;

    private String movePath;

    private String status;

    private String startDate;

    private String endDate;

    private String createdAt;

    private String updatedAt;
}
