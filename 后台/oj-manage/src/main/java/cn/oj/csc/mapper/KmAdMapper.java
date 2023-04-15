package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.Ad;

/**
 * 广告管理Mapper接口
 * 
 * @author 翟彬州
 * @date 2022-07-07
 */
public interface KmAdMapper 
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
     * 删除广告管理
     * 
     * @param id 广告管理主键
     * @return 结果
     */
    public int deleteKmAdById(Long id);

    /**
     * 批量删除广告管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmAdByIds(Long[] ids);
}
