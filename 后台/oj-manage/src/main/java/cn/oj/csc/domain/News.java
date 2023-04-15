package cn.oj.csc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 狂码新闻对象 km_news
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
public class News extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 文章ID */
    @Excel(name = "文章ID")
    private String blogId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 作者 */
    @Excel(name = "作者")
    private String author;

    /** 富文本(内容) */
    @Excel(name = "富文本(内容)")
    private String content;

    /** 版本号 */
    @Excel(name = "版本号")
    private Long version;

    /** 发布状态 */
    @Excel(name = "发布状态")
    private Long status;

    /** 发布状态 */
    @Excel(name = "封面图片")
    private String image;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBlogId(String blogId) 
    {
        this.blogId = blogId;
    }

    public String getBlogId() 
    {
        return blogId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setVersion(Long version) 
    {
        this.version = version;
    }

    public Long getVersion() 
    {
        return version;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImage()
    {
        return image;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("blogId", getBlogId())
            .append("title", getTitle())
            .append("author", getAuthor())
            .append("createTime", getCreateTime())
            .append("content", getContent())
            .append("version", getVersion())
            .append("status", getStatus())
            .append("image", getImage())
            .toString();
    }
}
