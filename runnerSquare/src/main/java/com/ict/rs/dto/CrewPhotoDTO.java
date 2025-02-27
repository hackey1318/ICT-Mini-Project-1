package com.ict.rs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrewPhotoDTO {

    private int no;
    private int crewNo;
    private String imageId;
    private String type;
    private String status;
    private String createdAt;
    private String updatedAt;
}
