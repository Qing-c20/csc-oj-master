package cn.oj.csc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 狂码banner对象 km_banner
 * 
 * @author 甲粒子
 * @date 2022-08-18
 */
public class Banner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 轮播图 */
    @Excel(name = "轮播图")
    private String img;

    /** 状态 0禁用 1正常 */
    @Excel(name = "状态 0禁用 1正常")
    private Long status;

    /** 说明 */
    @Excel(name = "说明")
    private String comment;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setComment(String comment) 
    {
        this.comment = comment;
    }

    public String getComment() 
    {
        return comment;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("img", getImg())
            .append("createTime", getCreateTime())
            .append("status", getStatus())
            .append("comment", getComment())
            .toString();
    }
}
