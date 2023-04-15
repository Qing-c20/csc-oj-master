package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Discussion;

/**
 * 讨论区管理Service接口
 * 
 * @author csc
 * @date 2023-04-12
 */
public interface IDiscussionService 
{
    /**
     * 查询讨论区管理
     * 
     * @param discussionId 讨论区管理主键
     * @return 讨论区管理
     */
    public Discussion selectDiscussionByDiscussionId(Long discussionId);

    /**
     * 查询讨论区管理列表
     * 
     * @param discussion 讨论区管理
     * @return 讨论区管理集合
     */
    public List<Discussion> selectDiscussionList(Discussion discussion);

    /**
     * 新增讨论区管理
     * 
     * @param discussion 讨论区管理
     * @return 结果
     */
    public int insertDiscussion(Discussion discussion);

    /**
     * 修改讨论区管理
     * 
     * @param discussion 讨论区管理
     * @return 结果
     */
    public int updateDiscussion(Discussion discussion);

    /**
     * 批量删除讨论区管理
     * 
     * @param discussionIds 需要删除的讨论区管理主键集合
     * @return 结果
     */
    public int deleteDiscussionByDiscussionIds(Long[] discussionIds);

    /**
     * 删除讨论区管理信息
     * 
     * @param discussionId 讨论区管理主键
     * @return 结果
     */
    public int deleteDiscussionByDiscussionId(Long discussionId);
}
