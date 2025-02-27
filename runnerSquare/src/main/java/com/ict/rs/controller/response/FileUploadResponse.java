package com.ict.rs.controller.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadResponse {

    private int no;

    private String imageId;

    private String originName;

    private String filePath;

    private String status;

    private String createdAt;

    private String updatedAt;
}
