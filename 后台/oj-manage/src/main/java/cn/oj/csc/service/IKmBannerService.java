package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Banner;

/**
 * 狂码bannerService接口
 * 
 * @author 甲粒子
 * @date 2022-08-18
 */
public interface IKmBannerService 
{
    /**
     * 查询狂码banner
     * 
     * @param id 狂码banner主键
     * @return 狂码banner
     */
    public Banner selectKmBannerById(Long id);

    /**
     * 查询狂码banner列表
     * 
     * @param banner 狂码banner
     * @return 狂码banner集合
     */
    public List<Banner> selectKmBannerList(Banner banner);

    /**
     * 新增狂码banner
     * 
     * @param banner 狂码banner
     * @return 结果
     */
    public int insertKmBanner(Banner banner);

    /**
     * 修改狂码banner
     * 
     * @param banner 狂码banner
     * @return 结果
     */
    public int updateKmBanner(Banner banner);

    /**
     * 批量删除狂码banner
     * 
     * @param ids 需要删除的狂码banner主键集合
     * @return 结果
     */
    public int deleteKmBannerByIds(Long[] ids);

    /**
     * 删除狂码banner信息
     * 
     * @param id 狂码banner主键
     * @return 结果
     */
    public int deleteKmBannerById(Long id);
}
