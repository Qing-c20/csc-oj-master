package cn.oj.csc.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 用户支出对象 km_user_expenditure
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
public class UserExpenditure extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 用户Id */
    @Excel(name = "用户Id")
    private String userId;

    /** 支出金额 */
    @Excel(name = "支出金额")
    private BigDecimal amount;

    /** 说明 */
    @Excel(name = "说明")
    private String comment;

    /** 金额显示颜色 */
    @Excel(name = "金额显示颜色")
    private String color;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setComment(String comment) 
    {
        this.comment = comment;
    }

    public String getComment() 
    {
        return comment;
    }
    public void setColor(String color) 
    {
        this.color = color;
    }

    public String getColor() 
    {
        return color;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("amount", getAmount())
            .append("comment", getComment())
            .append("createTime", getCreateTime())
            .append("color", getColor())
            .toString();
    }
}
