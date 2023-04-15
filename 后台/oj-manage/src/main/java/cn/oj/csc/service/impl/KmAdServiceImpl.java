package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmAdMapper;
import cn.oj.csc.domain.Ad;
import cn.oj.csc.service.IKmAdService;

/**
 * 广告管理Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-07
 */
@Service
public class KmAdServiceImpl implements IKmAdService 
{
    @Autowired
    private KmAdMapper kmAdMapper;

    /**
     * 查询广告管理
     * 
     * @param id 广告管理主键
     * @return 广告管理
     */
    @Override
    public Ad selectKmAdById(Long id)
    {
        return kmAdMapper.selectKmAdById(id);
    }

    /**
     * 查询广告管理列表
     * 
     * @param ad 广告管理
     * @return 广告管理
     */
    @Override
    public List<Ad> selectKmAdList(Ad ad)
    {
        return kmAdMapper.selectKmAdList(ad);
    }

    /**
     * 新增广告管理
     * 
     * @param ad 广告管理
     * @return 结果
     */
    @Override
    public int insertKmAd(Ad ad)
    {
        ad.setCreateTime(DateUtils.getNowDate());
        return kmAdMapper.insertKmAd(ad);
    }

    /**
     * 修改广告管理
     * 
     * @param ad 广告管理
     * @return 结果
     */
    @Override
    public int updateKmAd(Ad ad)
    {
        return kmAdMapper.updateKmAd(ad);
    }

    /**
     * 批量删除广告管理
     * 
     * @param ids 需要删除的广告管理主键
     * @return 结果
     */
    @Override
    public int deleteKmAdByIds(Long[] ids)
    {
        return kmAdMapper.deleteKmAdByIds(ids);
    }

    /**
     * 删除广告管理信息
     * 
     * @param id 广告管理主键
     * @return 结果
     */
    @Override
    public int deleteKmAdById(Long id)
    {
        return kmAdMapper.deleteKmAdById(id);
    }
}
