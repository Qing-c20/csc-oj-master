package cn.oj.csc.domain;

import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 评论回复管理对象 reply
 * 
 * @author csc
 * @date 2023-04-12
 */
public class Reply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long replyId;

    /** 问题id */
    @Excel(name = "问题id")
    private Long discussionId;

    /** 问题的标题 */
    @Excel(name = "问题的标题")
    private String discussionTopic;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 回复的内容 */
    @Excel(name = "回复的内容")
    private String replyContent;

    /** 上级评论的id */
    @Excel(name = "上级评论的id")
    private Long parentId;

    /** 状态（0 关闭 1打开） */
    @Excel(name = "状态", readConverterExp = "0=,关=闭,1=打开")
    private Long state;

    public void setReplyId(Long replyId) 
    {
        this.replyId = replyId;
    }

    public Long getReplyId() 
    {
        return replyId;
    }
    public void setDiscussionId(Long discussionId) 
    {
        this.discussionId = discussionId;
    }

    public Long getDiscussionId() 
    {
        return discussionId;
    }
    public void setDiscussionTopic(String discussionTopic) 
    {
        this.discussionTopic = discussionTopic;
    }

    public String getDiscussionTopic() 
    {
        return discussionTopic;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setReplyContent(String replyContent) 
    {
        this.replyContent = replyContent;
    }

    public String getReplyContent() 
    {
        return replyContent;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setState(Long state) 
    {
        this.state = state;
    }

    public Long getState() 
    {
        return state;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("replyId", getReplyId())
            .append("discussionId", getDiscussionId())
            .append("discussionTopic", getDiscussionTopic())
            .append("userId", getUserId())
            .append("replyContent", getReplyContent())
            .append("parentId", getParentId())
            .append("createTime", getCreateTime())
            .append("state", getState())
            .toString();
    }
}
