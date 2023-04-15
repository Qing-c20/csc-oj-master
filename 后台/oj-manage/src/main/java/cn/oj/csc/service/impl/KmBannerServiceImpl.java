package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmBannerMapper;
import cn.oj.csc.domain.Banner;
import cn.oj.csc.service.IKmBannerService;

/**
 * 狂码bannerService业务层处理
 * 
 * @author 甲粒子
 * @date 2022-08-18
 */
@Service
public class KmBannerServiceImpl implements IKmBannerService 
{
    @Autowired
    private KmBannerMapper kmBannerMapper;

    /**
     * 查询狂码banner
     * 
     * @param id 狂码banner主键
     * @return 狂码banner
     */
    @Override
    public Banner selectKmBannerById(Long id)
    {
        return kmBannerMapper.selectKmBannerById(id);
    }

    /**
     * 查询狂码banner列表
     * 
     * @param banner 狂码banner
     * @return 狂码banner
     */
    @Override
    public List<Banner> selectKmBannerList(Banner banner)
    {
        return kmBannerMapper.selectKmBannerList(banner);
    }

    /**
     * 新增狂码banner
     * 
     * @param banner 狂码banner
     * @return 结果
     */
    @Override
    public int insertKmBanner(Banner banner)
    {
        banner.setCreateTime(DateUtils.getNowDate());
        return kmBannerMapper.insertKmBanner(banner);
    }

    /**
     * 修改狂码banner
     * 
     * @param banner 狂码banner
     * @return 结果
     */
    @Override
    public int updateKmBanner(Banner banner)
    {
        return kmBannerMapper.updateKmBanner(banner);
    }

    /**
     * 批量删除狂码banner
     * 
     * @param ids 需要删除的狂码banner主键
     * @return 结果
     */
    @Override
    public int deleteKmBannerByIds(Long[] ids)
    {
        return kmBannerMapper.deleteKmBannerByIds(ids);
    }

    /**
     * 删除狂码banner信息
     * 
     * @param id 狂码banner主键
     * @return 结果
     */
    @Override
    public int deleteKmBannerById(Long id)
    {
        return kmBannerMapper.deleteKmBannerById(id);
    }
}
