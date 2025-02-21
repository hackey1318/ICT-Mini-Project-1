package com.ict.rs.vo;

import com.ict.rs.vo.constant.image.ImagePath;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImagesVO {

    private int no;

    private String id;

    private String originName;

    private String path = ImagePath.LOCAL.getPath();

    private int userNo;

    private String status;

    private String createdAt;

    private String updatedAt;
}
