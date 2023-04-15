package cn.oj.csc.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 用户管理对象 km_user
 * 
 * @author 翟彬州
 * @date 2022-07-02
 */
public class Users extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 用户ID */
    private String userId;

    /** 邮箱 */
    private String email;

    /** 手机号码 */
    private String phone;

    /** 性别 */
    private Long gender;

    /** 账号状态 */
    private Long status;

    /** 头像 */
    private String avatar;

    /** 昵称 */
    private String nickname;

    /** 账号密码 */
    private String password;

    /** 支付密码 */
    private String payPassword;

    /** 签名 */
    private String autograph;

    /** 平台认证 */
    private String authentication;

    /** 实名 */
    private String realname;

    /** 余额 */
    private Long balance;

    /** 邀请人数 */
    private Long invitationCount;

    /** 邀请人userId */
    private String invitationUserId;

    /** 学号 */
    private String studentno;

    /** 地址 */
    private String address;

    /** 封禁时间 */
    private Date banTime;

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
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setGender(Long gender) 
    {
        this.gender = gender;
    }

    public Long getGender() 
    {
        return gender;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setPayPassword(String payPassword) 
    {
        this.payPassword = payPassword;
    }

    public String getPayPassword() 
    {
        return payPassword;
    }
    public void setAutograph(String autograph) 
    {
        this.autograph = autograph;
    }

    public String getAutograph() 
    {
        return autograph;
    }
    public void setAuthentication(String authentication) 
    {
        this.authentication = authentication;
    }

    public String getAuthentication() 
    {
        return authentication;
    }
    public void setRealname(String realname) 
    {
        this.realname = realname;
    }

    public String getRealname() 
    {
        return realname;
    }
    public void setBalance(Long balance) 
    {
        this.balance = balance;
    }

    public Long getBalance() 
    {
        return balance;
    }
    public void setInvitationCount(Long invitationCount) 
    {
        this.invitationCount = invitationCount;
    }

    public Long getInvitationCount() 
    {
        return invitationCount;
    }
    public void setInvitationUserId(String invitationUserId) 
    {
        this.invitationUserId = invitationUserId;
    }

    public String getInvitationUserId() 
    {
        return invitationUserId;
    }
    public void setStudentno(String studentno) 
    {
        this.studentno = studentno;
    }

    public String getStudentno() 
    {
        return studentno;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setBanTime(Date banTime) 
    {
        this.banTime = banTime;
    }

    public Date getBanTime() 
    {
        return banTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("email", getEmail())
            .append("phone", getPhone())
            .append("gender", getGender())
            .append("status", getStatus())
            .append("avatar", getAvatar())
            .append("nickname", getNickname())
            .append("password", getPassword())
            .append("payPassword", getPayPassword())
            .append("autograph", getAutograph())
            .append("authentication", getAuthentication())
            .append("realname", getRealname())
            .append("balance", getBalance())
            .append("invitationCount", getInvitationCount())
            .append("invitationUserId", getInvitationUserId())
            .append("studentno", getStudentno())
            .append("address", getAddress())
            .append("createTime", getCreateTime())
            .append("banTime", getBanTime())
            .toString();
    }
}
