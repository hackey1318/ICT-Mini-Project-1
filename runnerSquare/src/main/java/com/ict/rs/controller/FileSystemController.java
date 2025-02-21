package com.ict.rs.controller;

import com.ict.rs.controller.response.FileUploadResponse;
import com.ict.rs.service.FileSystemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/file-system")
public class FileSystemController {

    private final FileSystemService fileSystemService;

    @PostMapping("/upload")
    public List<FileUploadResponse> uploadFile(@RequestParam("files") List<MultipartFile> files, HttpSession session) throws IOException {

        String userId = (String) session.getAttribute("userId");

        return fileSystemService.uploadFile(files, userId);
    }
}
