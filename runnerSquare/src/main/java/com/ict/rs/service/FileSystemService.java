package com.ict.rs.service;

import com.ict.rs.controller.response.FileUploadResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FileSystemService {

    List<FileUploadResponse> uploadFile(List<MultipartFile> files, String userId) throws IOException;
}
