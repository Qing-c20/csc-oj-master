package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.Banner;

/**
 * 狂码bannerMapper接口
 * 
 * @author 甲粒子
 * @date 2022-08-18
 */
public interface KmBannerMapper 
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
     * 删除狂码banner
     * 
     * @param id 狂码banner主键
     * @return 结果
     */
    public int deleteKmBannerById(Long id);

    /**
     * 批量删除狂码banner
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmBannerByIds(Long[] ids);
}
