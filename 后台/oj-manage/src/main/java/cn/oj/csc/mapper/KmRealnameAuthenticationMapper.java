package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.RealnameAuthentication;

/**
 * 实名审核Mapper接口
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
public interface KmRealnameAuthenticationMapper 
{
    /**
     * 查询实名审核
     * 
     * @param id 实名审核主键
     * @return 实名审核
     */
    public RealnameAuthentication selectKmRealnameAuthenticationById(Long id);

    /**
     * 查询实名审核列表
     * 
     * @param realnameAuthentication 实名审核
     * @return 实名审核集合
     */
    public List<RealnameAuthentication> selectKmRealnameAuthenticationList(RealnameAuthentication realnameAuthentication);

    /**
     * 新增实名审核
     * 
     * @param realnameAuthentication 实名审核
     * @return 结果
     */
    public int insertKmRealnameAuthentication(RealnameAuthentication realnameAuthentication);

    /**
     * 修改实名审核
     * 
     * @param realnameAuthentication 实名审核
     * @return 结果
     */
    public int updateKmRealnameAuthentication(RealnameAuthentication realnameAuthentication);

    /**
     * 删除实名审核
     * 
     * @param id 实名审核主键
     * @return 结果
     */
    public int deleteKmRealnameAuthenticationById(Long id);

    /**
     * 批量删除实名审核
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmRealnameAuthenticationByIds(Long[] ids);
}
