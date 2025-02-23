package com.ict.rs.service;

import com.ict.rs.controller.response.FileUploadResponse;
import com.ict.rs.dao.FileSystemDAO;
import com.ict.rs.vo.ImagesVO;
import com.ict.rs.vo.constant.image.ImageStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileSystemServiceImpl implements FileSystemService {

    private final FileSystemDAO fileSystemDAO;

    private final ServletContext servletContext;

    @Override
    public List<FileUploadResponse> uploadFile(List<MultipartFile> files, String userId) throws IOException {

    	Path uploadPath = Paths.get(servletContext.getRealPath("/img")); // 실제 서버 파일 시스템 경로

        List<String> imageIdList = new ArrayList<>();
        List<ImagesVO> imagesVOList = new ArrayList<>();
        for (MultipartFile file : files) {

            String fileId = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
            imageIdList.add(fileId);
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
        int insertImagesCount = fileSystemDAO.insertImages(imagesVOList);
        if (imagesVOList.size() != insertImagesCount) {
            log.info("업로드가 모두 완료 되지 않았습니다.");
        }
        List<ImagesVO> saveList = fileSystemDAO.getImage(imageIdList);

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

    public ImagesVO getImageInfo(String imageId) {

        List<ImagesVO> imagesVO = fileSystemDAO.getImage(List.of(imageId));

        if (imagesVO.isEmpty()) {
            throw new RuntimeException("요청한 파일을 찾을 수 없습니다.");
        }
        return imagesVO.get(0);
    }
}
