package cn.oj.csc.domain;

import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 讨论区管理对象 discussion
 * 
 * @author csc
 * @date 2023-04-12
 */

public class Discussion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long discussionId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 讨论的题目 */
    @Excel(name = "讨论的题目")
    private String discussionTopic;

    /** 讨论的内容 */
    @Excel(name = "讨论的内容")
    private String discussionContent;

    /** 问题的状态（0 关闭 1打开） */
    @Excel(name = "问题的状态", readConverterExp = "0=,关=闭,1=打开")
    private Long state;

    public void setDiscussionId(Long discussionId) 
    {
        this.discussionId = discussionId;
    }

    public Long getDiscussionId() 
    {
        return discussionId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setDiscussionTopic(String discussionTopic) 
    {
        this.discussionTopic = discussionTopic;
    }

    public String getDiscussionTopic() 
    {
        return discussionTopic;
    }
    public void setDiscussionContent(String discussionContent) 
    {
        this.discussionContent = discussionContent;
    }

    public String getDiscussionContent() 
    {
        return discussionContent;
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
            .append("discussionId", getDiscussionId())
            .append("userId", getUserId())
            .append("discussionTopic", getDiscussionTopic())
            .append("discussionContent", getDiscussionContent())
            .append("createTime", getCreateTime())
            .append("state", getState())
            .toString();
    }
}
