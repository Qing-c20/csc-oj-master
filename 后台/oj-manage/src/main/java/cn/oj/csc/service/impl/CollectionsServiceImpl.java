package cn.oj.csc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.CollectionsMapper;
import cn.oj.csc.domain.Collections;
import cn.oj.csc.service.ICollectionsService;

/**
 * 个人收藏管理Service业务层处理
 * 
 * @author csc
 * @date 2023-04-13
 */
@Service
public class CollectionsServiceImpl implements ICollectionsService 
{
    @Autowired
    private CollectionsMapper collectionsMapper;

    /**
     * 查询个人收藏管理
     * 
     * @param id 个人收藏管理主键
     * @return 个人收藏管理
     */
    @Override
    public List<Collections> selectCollectionsByUserId(Long user_id)
    {
//        return collectionsMapper.selectCollectionsById(id);
        return collectionsMapper.selectCollectionsByUserId(user_id);
    }

    /**
     * 查询个人收藏管理列表
     * 
     * @param collections 个人收藏管理
     * @return 个人收藏管理
     */
    @Override
    public List<Collections> selectCollectionsList(Collections collections)
    {
        return collectionsMapper.selectCollectionsList(collections);
    }

    /**
     * 新增个人收藏管理
     * 
     * @param collections 个人收藏管理
     * @return 结果
     */
    @Override
    public int insertCollections(Collections collections)
    {
        return collectionsMapper.insertCollections(collections);
    }

    /**
     * 修改个人收藏管理
     * 
     * @param collections 个人收藏管理
     * @return 结果
     */
    @Override
    public int updateCollections(Collections collections)
    {
        return collectionsMapper.updateCollections(collections);
    }

    /**
     * 批量删除个人收藏管理
     * 
     * @param ids 需要删除的个人收藏管理主键
     * @return 结果
     */
    @Override
    public int deleteCollectionsByIds(Long[] ids)
    {
        return collectionsMapper.deleteCollectionsByIds(ids);
    }

    /**
     * 删除个人收藏管理信息
     * 
     * @param id 个人收藏管理主键
     * @return 结果
     */
    @Override
    public int deleteCollectionsById(Long id)
    {
        return collectionsMapper.deleteCollectionsById(id);
    }
}
