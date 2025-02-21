package com.ict.rs.service;

import com.ict.rs.controller.response.FileUploadResponse;
import com.ict.rs.dao.FileSystemDAO;
import com.ict.rs.vo.ImagesVO;
import com.ict.rs.vo.constant.image.ImagePath;
import com.ict.rs.vo.constant.image.ImageStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FileSystemServiceImpl implements FileSystemService {

    private final FileSystemDAO fileSystemDAO;

    private final String UPLOAD_DIR = ImagePath.LOCAL.getPath();

    @Override
    public List<FileUploadResponse> uploadFile(List<MultipartFile> files, String userId) throws IOException {

        Path uploadPath = Paths.get(UPLOAD_DIR);

        List<ImagesVO> imagesVOList = new ArrayList<>();
        for (MultipartFile file : files) {

            String fileId = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
            String fileName = file.getOriginalFilename();

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filePath = uploadPath.resolve(fileName);

            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            ImagesVO imagesVO = ImagesVO.builder()
                    .id(fileId)
                    .originName(fileName)
                    .path(filePath.toString())
                    .userNo(1)
                    .status(ImageStatus.ACTIVE.name())
                    .build();
            imagesVOList.add(imagesVO);
        }
        List<ImagesVO> saveList = fileSystemDAO.insertImages(imagesVOList);

        return saveList.stream()
                .map(img -> FileUploadResponse.builder()
                        .no(img.getNo())
                        .imageId(img.getId())
                        .originName(img.getOriginName())
                        .filePath(img.getPath())
                        .status(img.getStatus())
                        .createdAt(img.getCreatedAt())
                        .updatedAt(img.getUpdatedAt()).build()).collect(Collectors.toList());
    }
}
