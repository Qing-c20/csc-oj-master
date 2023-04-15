package cn.oj.csc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 博客管理对象 km_blog
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
public class Blog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 作者 */
    @Excel(name = "作者")
    private String author;

    /** 作者ID */
    @Excel(name = "作者ID")
    private String authorId;

    /** 博客名 */
    @Excel(name = "博客名")
    private String title;

    /** 博客内容 */
    @Excel(name = "博客内容")
    private String content;

    /** 评分 */
    @Excel(name = "评分")
    private Long score;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private Long status;

    /** 拒绝原因 */
    @Excel(name = "拒绝原因")
    private String rejectReason;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setAuthorId(String authorId) 
    {
        this.authorId = authorId;
    }

    public String getAuthorId() 
    {
        return authorId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setRejectReason(String rejectReason) 
    {
        this.rejectReason = rejectReason;
    }

    public String getRejectReason() 
    {
        return rejectReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("author", getAuthor())
            .append("authorId", getAuthorId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("createTime", getCreateTime())
            .append("score", getScore())
            .append("status", getStatus())
            .append("rejectReason", getRejectReason())
            .toString();
    }
}
