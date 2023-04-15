package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.AppVersion;

/**
 * 应用版本Service接口
 * 
 * @author 甲粒子
 * @date 2022-08-11
 */
public interface IKmAppVersionService 
{
    /**
     * 查询应用版本
     * 
     * @param id 应用版本主键
     * @return 应用版本
     */
    public AppVersion selectKmAppVersionById(Long id);

    /**
     * 查询应用版本列表
     * 
     * @param appVersion 应用版本
     * @return 应用版本集合
     */
    public List<AppVersion> selectKmAppVersionList(AppVersion appVersion);

    /**
     * 新增应用版本
     * 
     * @param appVersion 应用版本
     * @return 结果
     */
    public int insertKmAppVersion(AppVersion appVersion);

    /**
     * 修改应用版本
     * 
     * @param appVersion 应用版本
     * @return 结果
     */
    public int updateKmAppVersion(AppVersion appVersion);

    /**
     * 批量删除应用版本
     * 
     * @param ids 需要删除的应用版本主键集合
     * @return 结果
     */
    public int deleteKmAppVersionByIds(Long[] ids);

    /**
     * 删除应用版本信息
     * 
     * @param id 应用版本主键
     * @return 结果
     */
    public int deleteKmAppVersionById(Long id);
}
