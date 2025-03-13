package com.chenxianyu.service;

import com.chenxianyu.entity.File;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 文件表 服务类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-13
 */
public interface IFileService extends IService<File> {

    /**
     * 保存文件
     * @param file 文件
     * @param relatedType 关联类型
     * @param relatedId 关联ID
     * @return 文件信息
     * @throws Exception 异常
     */
    File saveFile(MultipartFile file, String relatedType, Long relatedId) throws Exception;

    /**
     * 根据关联ID获取文件列表
     * @param relatedId 关联ID
     * @return 文件列表
     */
    List<File> getFileListByRelatedId(Long relatedId);

    /**
     * 根据关联ID获取文件访问路径
     * @param relatedId 关联ID
     * @param relatedType 关联类型
     * @return 文件路径
     */
    List<String> getFileViewPathById(Long relatedId, String relatedType);
}
