package cn.oj.csc.domain;

import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 个人收藏管理对象 collections
 * 
 * @author csc
 * @date 2023-04-13
 */
public class Collections extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 问题id */
    @Excel(name = "问题id")
    private Long questionId;

    /** 问题的题目 */
    @Excel(name = "问题的题目")
    private String questionTopic;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setQuestionId(Long questionId) 
    {
        this.questionId = questionId;
    }

    public Long getQuestionId() 
    {
        return questionId;
    }
    public void setQuestionTopic(String questionTopic) 
    {
        this.questionTopic = questionTopic;
    }

    public String getQuestionTopic() 
    {
        return questionTopic;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionId", getQuestionId())
            .append("questionTopic", getQuestionTopic())
            .append("userId", getUserId())
            .toString();
    }
}
