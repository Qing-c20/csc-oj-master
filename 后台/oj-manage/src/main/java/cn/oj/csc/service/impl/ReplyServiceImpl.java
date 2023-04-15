package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.ReplyMapper;
import cn.oj.csc.domain.Reply;
import cn.oj.csc.service.IReplyService;

/**
 * 评论回复管理Service业务层处理
 * 
 * @author csc
 * @date 2023-04-12
 */
@Service
public class ReplyServiceImpl implements IReplyService 
{
    @Autowired
    private ReplyMapper replyMapper;

    /**
     * 查询评论回复管理
     * 
     * @param replyId 评论回复管理主键
     * @return 评论回复管理
     */
    @Override
    public Reply selectReplyByReplyId(Long replyId)
    {
        return replyMapper.selectReplyByReplyId(replyId);
    }

    /**
     * 查询评论回复管理列表
     * 
     * @param reply 评论回复管理
     * @return 评论回复管理
     */
    @Override
    public List<Reply> selectReplyList(Reply reply)
    {
        return replyMapper.selectReplyList(reply);
    }

    /**
     * 新增评论回复管理
     * 
     * @param reply 评论回复管理
     * @return 结果
     */
    @Override
    public int insertReply(Reply reply)
    {
        reply.setCreateTime(DateUtils.getNowDate());
        return replyMapper.insertReply(reply);
    }

    /**
     * 修改评论回复管理
     * 
     * @param reply 评论回复管理
     * @return 结果
     */
    @Override
    public int updateReply(Reply reply)
    {
        return replyMapper.updateReply(reply);
    }

    /**
     * 批量删除评论回复管理
     * 
     * @param replyIds 需要删除的评论回复管理主键
     * @return 结果
     */
    @Override
    public int deleteReplyByReplyIds(Long[] replyIds)
    {
        return replyMapper.deleteReplyByReplyIds(replyIds);
    }

    /**
     * 删除评论回复管理信息
     * 
     * @param replyId 评论回复管理主键
     * @return 结果
     */
    @Override
    public int deleteReplyByReplyId(Long replyId)
    {
        return replyMapper.deleteReplyByReplyId(replyId);
    }
}
