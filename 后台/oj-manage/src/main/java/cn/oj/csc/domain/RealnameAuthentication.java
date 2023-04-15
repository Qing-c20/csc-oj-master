package cn.oj.csc.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 实名审核对象 km_realname_authentication
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
public class RealnameAuthentication extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private String userId;

    /** 学号 */
    @Excel(name = "学号")
    private String studentno;

    /** 认证照片 */
    @Excel(name = "认证照片")
    private String image;

    /** 实名 */
    @Excel(name = "实名")
    private String realname;

    /** 身份证号码 */
    @Excel(name = "身份证号码")
    private String cardId;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private Integer status;

    /** 未通过原因 */
    @Excel(name = "未通过原因")
    private String rejectReason;

    /** 通过时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "通过时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date passTime;

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
    public void setStudentno(String studentno) 
    {
        this.studentno = studentno;
    }

    public String getStudentno() 
    {
        return studentno;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setRealname(String realname) 
    {
        this.realname = realname;
    }

    public String getRealname() 
    {
        return realname;
    }
    public void setCardId(String cardId) 
    {
        this.cardId = cardId;
    }

    public String getCardId() 
    {
        return cardId;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
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
    public void setPassTime(Date passTime) 
    {
        this.passTime = passTime;
    }

    public Date getPassTime() 
    {
        return passTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("studentno", getStudentno())
            .append("image", getImage())
            .append("realname", getRealname())
            .append("cardId", getCardId())
            .append("status", getStatus())
            .append("rejectReason", getRejectReason())
            .append("passTime", getPassTime())
            .toString();
    }
}
