package cn.oj.csc.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 应用订单对象 km_order
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
public class Orders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderNo;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private BigDecimal payment;

    /** 支付类型 0-无 1-平台 2-支付宝 */
    @Excel(name = "支付类型 0-无 1-平台 2-支付宝")
    private Long paymentType;

    /** 支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭 */
    @Excel(name = "支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭")
    private Long status;

    /** 颜色 0-橙色 1-绿色 -2红色 4-蓝色 */
    @Excel(name = "颜色 0-橙色 1-绿色 -2红色 4-蓝色")
    private String statusColor;

    /** 支付时间 */
    @Excel(name = "支付时间")
    private String payTime;

    /** 交易关闭时间 */
    @Excel(name = "交易关闭时间")
    private String closeTime;

    /** 交易完成时间 */
    @Excel(name = "交易完成时间")
    private String endTime;

    /** 支付宝subject */
    @Excel(name = "支付宝subject")
    private String subject;

    /** 支付宝body */
    @Excel(name = "支付宝body")
    private String body;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderNo(String orderNo) 
    {
        this.orderNo = orderNo;
    }

    public String getOrderNo() 
    {
        return orderNo;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setPayment(BigDecimal payment) 
    {
        this.payment = payment;
    }

    public BigDecimal getPayment() 
    {
        return payment;
    }
    public void setPaymentType(Long paymentType) 
    {
        this.paymentType = paymentType;
    }

    public Long getPaymentType() 
    {
        return paymentType;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setStatusColor(String statusColor)
    {
        this.statusColor = statusColor;
    }

    public String getStatusColor()
    {
        return statusColor;
    }
    public void setPayTime(String payTime) 
    {
        this.payTime = payTime;
    }

    public String getPayTime() 
    {
        return payTime;
    }
    public void setCloseTime(String closeTime) 
    {
        this.closeTime = closeTime;
    }

    public String getCloseTime() 
    {
        return closeTime;
    }
    public void setEndTime(String endTime) 
    {
        this.endTime = endTime;
    }

    public String getEndTime() 
    {
        return endTime;
    }
    public void setSubject(String subject) 
    {
        this.subject = subject;
    }

    public String getSubject() 
    {
        return subject;
    }
    public void setBody(String body) 
    {
        this.body = body;
    }

    public String getBody() 
    {
        return body;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderNo", getOrderNo())
            .append("userId", getUserId())
            .append("payment", getPayment())
            .append("paymentType", getPaymentType())
            .append("status", getStatus())
            .append("statusColor", getStatusColor())
            .append("createTime", getCreateTime())
            .append("payTime", getPayTime())
            .append("closeTime", getCloseTime())
            .append("endTime", getEndTime())
            .append("subject", getSubject())
            .append("body", getBody())
            .toString();
    }
}
