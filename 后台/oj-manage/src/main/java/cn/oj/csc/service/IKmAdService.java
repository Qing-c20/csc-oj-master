package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Ad;

/**
 * 广告管理Service接口
 * 
 * @author 翟彬州
 * @date 2022-07-07
 */
public interface IKmAdService 
{
    /**
     * 查询广告管理
     * 
     * @param id 广告管理主键
     * @return 广告管理
     */
    public Ad selectKmAdById(Long id);

    /**
     * 查询广告管理列表
     * 
     * @param ad 广告管理
     * @return 广告管理集合
     */
    public List<Ad> selectKmAdList(Ad ad);

    /**
     * 新增广告管理
     * 
     * @param ad 广告管理
     * @return 结果
     */
    public int insertKmAd(Ad ad);

    /**
     * 修改广告管理
     * 
     * @param ad 广告管理
     * @return 结果
     */
    public int updateKmAd(Ad ad);

    /**
     * 批量删除广告管理
     * 
     * @param ids 需要删除的广告管理主键集合
     * @return 结果
     */
    public int deleteKmAdByIds(Long[] ids);

    /**
     * 删除广告管理信息
     * 
     * @param id 广告管理主键
     * @return 结果
     */
    public int deleteKmAdById(Long id);
}
