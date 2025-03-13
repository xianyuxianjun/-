package com.chenxianyu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chenxianyu.entity.File;
import com.chenxianyu.mapper.FileMapper;
import com.chenxianyu.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * <p>
 * 文件表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-13
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

    @Value("${file.upload.path}")
    private String uploadPath;


    @Override
    public File saveFile(MultipartFile file, String relatedType, Long relatedId) throws Exception {
        // 获取项目根路径
        String projectRootPath = System.getProperty("user.dir");
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 生成文件保存路径
        String filePath = projectRootPath + java.io.File.separator + uploadPath + java.io.File.separator + UUID.randomUUID() + fileName;
        // 创建文件
        java.io.File dest = new java.io.File(filePath);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        // 保存文件
        file.transferTo(dest);
        // 保存文件信息
        File newFile = new File();
        newFile.setFileName(fileName);
        newFile.setFilePath(filePath);
        newFile.setRelatedType(relatedType);
        newFile.setRelatedId(relatedId);
        newFile.setCreatedAt(LocalDateTime.now());
        save(newFile);
        return newFile;
    }

    @Override
    public List<File> getFileListByRelatedId(Long relatedId) {
        return list(new QueryWrapper<File>().eq("related_id", relatedId));
    }

    @Override
    public List<String> getFileViewPathById(Long relatedId, String relatedType) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("related_id", relatedId);
        queryWrapper.eq(StringUtils.hasText(relatedType),"related_type", relatedType);
        List<File> fileList = list(queryWrapper);
        return fileList.stream().map(file -> file.getFilePath()).collect(Collectors.toList());
    }
}
