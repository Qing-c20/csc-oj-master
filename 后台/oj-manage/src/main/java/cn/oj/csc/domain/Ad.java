package cn.oj.csc.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 广告管理对象 km_ad
 * 
 * @author 翟彬州
 * @date 2022-07-07
 */
public class Ad extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 广告标题 */
    @Excel(name = "广告标题")
    private String title;

    /** 广告图 */
    @Excel(name = "广告图")
    private String img;

    /** 广告商名字 */
    @Excel(name = "广告商名字")
    private String username;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 链接地址 */
    @Excel(name = "链接地址")
    private String address;

    /** 广告位状态 */
    @Excel(name = "广告位状态")
    private Long status;

    /** 版本号 */
    @Excel(name = "版本号")
    private Long version;

    /** 标签 */
    @Excel(name = "标签")
    private String tag;

    /** 评分 */
    @Excel(name = "评分")
    private Long rate;

    /** 广告富文本(内容) */
    @Excel(name = "广告富文本(内容)")
    private String content;

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setVersion(Long version) 
    {
        this.version = version;
    }

    public Long getVersion() 
    {
        return version;
    }
    public void setTag(String tag) 
    {
        this.tag = tag;
    }

    public String getTag() 
    {
        return tag;
    }
    public void setRate(Long rate) 
    {
        this.rate = rate;
    }

    public Long getRate() 
    {
        return rate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("img", getImg())
            .append("username", getUsername())
            .append("createTime", getCreateTime())
            .append("endTime", getEndTime())
            .append("address", getAddress())
            .append("status", getStatus())
            .append("version", getVersion())
            .append("tag", getTag())
            .append("rate", getRate())
            .toString();
    }
}
