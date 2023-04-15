package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Reply;

/**
 * 评论回复管理Service接口
 * 
 * @author csc
 * @date 2023-04-12
 */
public interface IReplyService 
{
    /**
     * 查询评论回复管理
     * 
     * @param replyId 评论回复管理主键
     * @return 评论回复管理
     */
    public Reply selectReplyByReplyId(Long replyId);

    /**
     * 查询评论回复管理列表
     * 
     * @param reply 评论回复管理
     * @return 评论回复管理集合
     */
    public List<Reply> selectReplyList(Reply reply);

    /**
     * 新增评论回复管理
     * 
     * @param reply 评论回复管理
     * @return 结果
     */
    public int insertReply(Reply reply);

    /**
     * 修改评论回复管理
     * 
     * @param reply 评论回复管理
     * @return 结果
     */
    public int updateReply(Reply reply);

    /**
     * 批量删除评论回复管理
     * 
     * @param replyIds 需要删除的评论回复管理主键集合
     * @return 结果
     */
    public int deleteReplyByReplyIds(Long[] replyIds);

    /**
     * 删除评论回复管理信息
     * 
     * @param replyId 评论回复管理主键
     * @return 结果
     */
    public int deleteReplyByReplyId(Long replyId);
}
