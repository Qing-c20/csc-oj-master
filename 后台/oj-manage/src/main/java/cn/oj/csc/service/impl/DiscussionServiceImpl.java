package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.DiscussionMapper;
import cn.oj.csc.domain.Discussion;
import cn.oj.csc.service.IDiscussionService;

/**
 * 讨论区管理Service业务层处理
 * 
 * @author csc
 * @date 2023-04-12
 */
@Service
public class DiscussionServiceImpl implements IDiscussionService 
{
    @Autowired
    private DiscussionMapper discussionMapper;

    /**
     * 查询讨论区管理
     * 
     * @param discussionId 讨论区管理主键
     * @return 讨论区管理
     */
    @Override
    public Discussion selectDiscussionByDiscussionId(Long discussionId)
    {
        return discussionMapper.selectDiscussionByDiscussionId(discussionId);
    }

    /**
     * 查询讨论区管理列表
     * 
     * @param discussion 讨论区管理
     * @return 讨论区管理
     */
    @Override
    public List<Discussion> selectDiscussionList(Discussion discussion)
    {
        return discussionMapper.selectDiscussionList(discussion);
    }

    /**
     * 新增讨论区管理
     * 
     * @param discussion 讨论区管理
     * @return 结果
     */
    @Override
    public int insertDiscussion(Discussion discussion)
    {
        discussion.setCreateTime(DateUtils.getNowDate());
        return discussionMapper.insertDiscussion(discussion);
    }

    /**
     * 修改讨论区管理
     * 
     * @param discussion 讨论区管理
     * @return 结果
     */
    @Override
    public int updateDiscussion(Discussion discussion)
    {
        return discussionMapper.updateDiscussion(discussion);
    }

    /**
     * 批量删除讨论区管理
     * 
     * @param discussionIds 需要删除的讨论区管理主键
     * @return 结果
     */
    @Override
    public int deleteDiscussionByDiscussionIds(Long[] discussionIds)
    {
        return discussionMapper.deleteDiscussionByDiscussionIds(discussionIds);
    }

    /**
     * 删除讨论区管理信息
     * 
     * @param discussionId 讨论区管理主键
     * @return 结果
     */
    @Override
    public int deleteDiscussionByDiscussionId(Long discussionId)
    {
        return discussionMapper.deleteDiscussionByDiscussionId(discussionId);
    }
}
