package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Collections;

/**
 * 个人收藏管理Service接口
 * 
 * @author csc
 * @date 2023-04-13
 */
public interface ICollectionsService 
{
    /**
     * 查询个人收藏管理
     * 
     * @param id 个人收藏管理主键
     * @return 个人收藏管理
     */
//    public Collections selectCollectionsById(Long id);
    public List<Collections> selectCollectionsByUserId(Long user_id);

    /**
     * 查询个人收藏管理列表
     * 
     * @param collections 个人收藏管理
     * @return 个人收藏管理集合
     */
    public List<Collections> selectCollectionsList(Collections collections);

    /**
     * 新增个人收藏管理
     * 
     * @param collections 个人收藏管理
     * @return 结果
     */
    public int insertCollections(Collections collections);

    /**
     * 修改个人收藏管理
     * 
     * @param collections 个人收藏管理
     * @return 结果
     */
    public int updateCollections(Collections collections);

    /**
     * 批量删除个人收藏管理
     * 
     * @param ids 需要删除的个人收藏管理主键集合
     * @return 结果
     */
    public int deleteCollectionsByIds(Long[] ids);

    /**
     * 删除个人收藏管理信息
     * 
     * @param id 个人收藏管理主键
     * @return 结果
     */
    public int deleteCollectionsById(Long id);
}
