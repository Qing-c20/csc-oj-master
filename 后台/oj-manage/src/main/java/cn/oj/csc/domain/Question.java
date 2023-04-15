package cn.oj.csc.domain;

import java.util.Date;

import cn.oj.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import cn.oj.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 题目管理对象 question
 * 
 * @author csc
 * @date 2023-04-13
 */
public class Question extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 题目内容 */
    @Excel(name = "题目内容")
    private String topic;

    /** 输入格式 */
    @Excel(name = "输入格式")
    private String inputFormat;

    /** 输出格式 */
    @Excel(name = "输出格式")
    private String outputFormat;

    /** 数据范围 */
    @Excel(name = "数据范围")
    private String dataField;

    /** 样例输入 */
    @Excel(name = "样例输入")
    private String sampleInput;

    /** 样例输出 */
    @Excel(name = "样例输出")
    private String sampleOutput;

    /** 标准输入-用于检验用户提交的代码 */
    @Excel(name = "标准输入-用于检验用户提交的代码")
    private String standardInput;

    /** 标准输出-用于检验用户提交的代码 */
    @Excel(name = "标准输出-用于检验用户提交的代码")
    private String standardOutput;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modificationTime;

    /** 难度 */
    @Excel(name = "难度")
    private String difficulty;

    /** 时空限制 */
    @Excel(name = "时空限制")
    private String limitation;

    /** 总通过数 */
    @Excel(name = "总通过数")
    private Long passSum;

    /** 总尝试数 */
    @Excel(name = "总尝试数")
    private Long trySum;

    /** 来源 */
    @Excel(name = "来源")
    private String source;

    /** 标签 */
    @Excel(name = "标签")
    private String label;

    /** 创建人 */
    @Excel(name = "创建人")
    private String founder;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTopic(String topic) 
    {
        this.topic = topic;
    }

    public String getTopic() 
    {
        return topic;
    }
    public void setInputFormat(String inputFormat) 
    {
        this.inputFormat = inputFormat;
    }

    public String getInputFormat() 
    {
        return inputFormat;
    }
    public void setOutputFormat(String outputFormat) 
    {
        this.outputFormat = outputFormat;
    }

    public String getOutputFormat() 
    {
        return outputFormat;
    }
    public void setDataField(String dataField) 
    {
        this.dataField = dataField;
    }

    public String getDataField() 
    {
        return dataField;
    }
    public void setSampleInput(String sampleInput) 
    {
        this.sampleInput = sampleInput;
    }

    public String getSampleInput() 
    {
        return sampleInput;
    }
    public void setSampleOutput(String sampleOutput) 
    {
        this.sampleOutput = sampleOutput;
    }

    public String getSampleOutput() 
    {
        return sampleOutput;
    }
    public void setStandardInput(String standardInput) 
    {
        this.standardInput = standardInput;
    }

    public String getStandardInput() 
    {
        return standardInput;
    }
    public void setStandardOutput(String standardOutput) 
    {
        this.standardOutput = standardOutput;
    }

    public String getStandardOutput() 
    {
        return standardOutput;
    }
    public void setModificationTime(Date modificationTime) 
    {
        this.modificationTime = modificationTime;
    }

    public Date getModificationTime() 
    {
        return modificationTime;
    }
    public void setDifficulty(String difficulty) 
    {
        this.difficulty = difficulty;
    }

    public String getDifficulty() 
    {
        return difficulty;
    }
    public void setLimitation(String limitation) 
    {
        this.limitation = limitation;
    }

    public String getLimitation() 
    {
        return limitation;
    }
    public void setPassSum(Long passSum) 
    {
        this.passSum = passSum;
    }

    public Long getPassSum() 
    {
        return passSum;
    }
    public void setTrySum(Long trySum) 
    {
        this.trySum = trySum;
    }

    public Long getTrySum() 
    {
        return trySum;
    }
    public void setSource(String source) 
    {
        this.source = source;
    }

    public String getSource() 
    {
        return source;
    }
    public void setLabel(String label) 
    {
        this.label = label;
    }

    public String getLabel() 
    {
        return label;
    }
    public void setFounder(String founder) 
    {
        this.founder = founder;
    }

    public String getFounder() 
    {
        return founder;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("topic", getTopic())
            .append("inputFormat", getInputFormat())
            .append("outputFormat", getOutputFormat())
            .append("dataField", getDataField())
            .append("sampleInput", getSampleInput())
            .append("sampleOutput", getSampleOutput())
            .append("standardInput", getStandardInput())
            .append("standardOutput", getStandardOutput())
            .append("createTime", getCreateTime())
            .append("modificationTime", getModificationTime())
            .append("difficulty", getDifficulty())
            .append("limitation", getLimitation())
            .append("passSum", getPassSum())
            .append("trySum", getTrySum())
            .append("source", getSource())
            .append("label", getLabel())
            .append("founder", getFounder())
            .toString();
    }
}
