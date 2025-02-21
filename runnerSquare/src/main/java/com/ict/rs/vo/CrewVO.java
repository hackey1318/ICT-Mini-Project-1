package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CrewVO {
    private int no;
    private String userid;
    private String name;
    private String description;
    private String city;
    private String district;
    private String runningDay;
    private String status;
    private String createdAt;
    private String updatedAt;
}
