package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmAppVersionMapper;
import cn.oj.csc.domain.AppVersion;
import cn.oj.csc.service.IKmAppVersionService;

/**
 * 应用版本Service业务层处理
 * 
 * @author 甲粒子
 * @date 2022-08-11
 */
@Service
public class KmAppVersionServiceImpl implements IKmAppVersionService 
{
    @Autowired
    private KmAppVersionMapper kmAppVersionMapper;

    /**
     * 查询应用版本
     * 
     * @param id 应用版本主键
     * @return 应用版本
     */
    @Override
    public AppVersion selectKmAppVersionById(Long id)
    {
        return kmAppVersionMapper.selectKmAppVersionById(id);
    }

    /**
     * 查询应用版本列表
     * 
     * @param appVersion 应用版本
     * @return 应用版本
     */
    @Override
    public List<AppVersion> selectKmAppVersionList(AppVersion appVersion)
    {
        return kmAppVersionMapper.selectKmAppVersionList(appVersion);
    }

    /**
     * 新增应用版本
     * 
     * @param appVersion 应用版本
     * @return 结果
     */
    @Override
    public int insertKmAppVersion(AppVersion appVersion)
    {
        appVersion.setCreateTime(DateUtils.getNowDate());
        return kmAppVersionMapper.insertKmAppVersion(appVersion);
    }

    /**
     * 修改应用版本
     * 
     * @param appVersion 应用版本
     * @return 结果
     */
    @Override
    public int updateKmAppVersion(AppVersion appVersion)
    {
        return kmAppVersionMapper.updateKmAppVersion(appVersion);
    }

    /**
     * 批量删除应用版本
     * 
     * @param ids 需要删除的应用版本主键
     * @return 结果
     */
    @Override
    public int deleteKmAppVersionByIds(Long[] ids)
    {
        return kmAppVersionMapper.deleteKmAppVersionByIds(ids);
    }

    /**
     * 删除应用版本信息
     * 
     * @param id 应用版本主键
     * @return 结果
     */
    @Override
    public int deleteKmAppVersionById(Long id)
    {
        return kmAppVersionMapper.deleteKmAppVersionById(id);
    }
}
