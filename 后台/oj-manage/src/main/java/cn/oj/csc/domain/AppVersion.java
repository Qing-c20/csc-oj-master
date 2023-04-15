package cn.oj.csc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import cn.oj.common.annotation.Excel;
import cn.oj.common.core.domain.BaseEntity;

/**
 * 应用版本对象 km_app_version
 * 
 * @author 甲粒子
 * @date 2022-08-11
 */
public class AppVersion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增ID */
    private Long id;

    /** 应用名称 */
    @Excel(name = "应用名称")
    private String name;

    /** 上一个版本 */
    @Excel(name = "上一个版本")
    private String preVersion;

    /** 版本号 eg:1.0.1 */
    @Excel(name = "版本号 eg:1.0.1")
    private String version;

    /** 是否有新版本 1-有 0-木有 */
    @Excel(name = "是否有新版本 1-有 0-木有")
    private Long isUpdated;

    /** 版本说明 */
    @Excel(name = "版本说明")
    private String comment;

    /** 包下载地址 */
    @Excel(name = "包下载地址")
    private String downUrl;

    /** 上传人姓名 */
    @Excel(name = "上传人姓名")
    private String username;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPreVersion(String preVersion) 
    {
        this.preVersion = preVersion;
    }

    public String getPreVersion() 
    {
        return preVersion;
    }
    public void setVersion(String version) 
    {
        this.version = version;
    }

    public String getVersion() 
    {
        return version;
    }
    public void setIsUpdated(Long isUpdated) 
    {
        this.isUpdated = isUpdated;
    }

    public Long getIsUpdated() 
    {
        return isUpdated;
    }
    public void setComment(String comment) 
    {
        this.comment = comment;
    }

    public String getComment() 
    {
        return comment;
    }
    public void setDownUrl(String downUrl) 
    {
        this.downUrl = downUrl;
    }

    public String getDownUrl() 
    {
        return downUrl;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("preVersion", getPreVersion())
            .append("version", getVersion())
            .append("isUpdated", getIsUpdated())
            .append("comment", getComment())
            .append("downUrl", getDownUrl())
            .append("createTime", getCreateTime())
            .append("username", getUsername())
            .toString();
    }
}
