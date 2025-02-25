package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrewPhotoVO {

    private int no;
    private int crewNo;
    private List<String> imageIdList;
    private String type;
    private String status;
    private String createdAt;
    private String updatedAt;
}
