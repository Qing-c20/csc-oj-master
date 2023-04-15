package cn.oj.csc.domain;

import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户答题管理对象 user_answer
 * 
 * @author csc
 * @date 2023-03-30
 */
public class UserAnswer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** question的id */
    @Excel(name = "question的id")
    private Long uid;

    /** user的id */
    @Excel(name = "user的id")
    private Long qid;

    /** 代码 */
    @Excel(name = "代码")
    private String code;

    /** 状态：0未通过 1已通过 2编译出错 3表示运行出错 */
    @Excel(name = "状态：0未通过 1已通过 2编译出错 3表示运行出错")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setQid(Long qid) 
    {
        this.qid = qid;
    }

    public Long getQid() 
    {
        return qid;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public UserAnswer(Long uid, Long qid, String code, String status) {
        this.uid = uid;
        this.qid = qid;
        this.code = code;
        this.status = status;
    }

    public UserAnswer() {
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("uid", getUid())
            .append("qid", getQid())
            .append("code", getCode())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
