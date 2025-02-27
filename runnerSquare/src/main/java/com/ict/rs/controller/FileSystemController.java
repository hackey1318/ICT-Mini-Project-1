package com.ict.rs.controller;

import com.ict.rs.controller.response.FileUploadResponse;
import com.ict.rs.service.FileSystemService;
import com.ict.rs.vo.ImagesVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/file-system")
public class FileSystemController {

    private final FileSystemService fileSystemService;

    @PostMapping("/upload")
    public List<FileUploadResponse> uploadFile(@RequestParam("files") List<MultipartFile> files, HttpSession session) throws IOException {

        // TODO ; session 정보에서 추출 가능한 상태가 되었을 때, 하드코딩 삭제 예정
        String userId = (String) session.getAttribute("userId");
        userId = "tester01";

        return fileSystemService.uploadFile(files, userId);
    }

    @GetMapping("/download/{imageId}")
    public void download(@PathVariable("imageId") String imageId, HttpServletResponse response) {

        ImagesVO imagesVO = fileSystemService.getImageInfo(imageId);
        Path filePath = Paths.get(imagesVO.getPath());

        if (!Files.exists(filePath)) {
            throw new RuntimeException("파일이 존재하지 않습니다.");
        }

        response.setContentType(getContentType(filePath));
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + URLEncoder.encode(imagesVO.getOriginName(), StandardCharsets.UTF_8) + "\"");

        try (InputStream inputStream = Files.newInputStream(filePath);
             OutputStream outputStream = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();

        } catch (IOException e) {
            throw new RuntimeException("파일 다운로드 중 오류 발생: " + imagesVO.getOriginName(), e);
        }
    }

    private String getContentType(Path path) {
        try {
            return Files.probeContentType(path);
        } catch (IOException e) {
            return "application/octet-stream";
        }
    }
}
