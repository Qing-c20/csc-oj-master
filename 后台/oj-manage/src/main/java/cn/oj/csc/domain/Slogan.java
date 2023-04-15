package cn.oj.csc.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 标语管理对象 km_slogan
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
public class Slogan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 宣传短语 */
    @Excel(name = "宣传短语")
    private String sloganId;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifyTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSloganId(String sloganId) 
    {
        this.sloganId = sloganId;
    }

    public String getSloganId() 
    {
        return sloganId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setModifyTime(Date modifyTime) 
    {
        this.modifyTime = modifyTime;
    }

    public Date getModifyTime() 
    {
        return modifyTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sloganId", getSloganId())
            .append("content", getContent())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
