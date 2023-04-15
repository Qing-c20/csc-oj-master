package cn.oj.csc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 字典管理对象 km_dict
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
public class Dict extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 键 */
    @Excel(name = "键")
    private String k;

    /** 值 */
    @Excel(name = "值")
    private String v;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setK(String k) 
    {
        this.k = k;
    }

    public String getK() 
    {
        return k;
    }
    public void setV(String v) 
    {
        this.v = v;
    }

    public String getV() 
    {
        return v;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("k", getK())
            .append("v", getV())
            .toString();
    }
}
