package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.Slogan;

/**
 * 标语管理Mapper接口
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
public interface KmSloganMapper 
{
    /**
     * 查询标语管理
     * 
     * @param id 标语管理主键
     * @return 标语管理
     */
    public Slogan selectKmSloganById(Long id);

    /**
     * 查询标语管理列表
     * 
     * @param slogan 标语管理
     * @return 标语管理集合
     */
    public List<Slogan> selectKmSloganList(Slogan slogan);

    /**
     * 新增标语管理
     * 
     * @param slogan 标语管理
     * @return 结果
     */
    public int insertKmSlogan(Slogan slogan);

    /**
     * 修改标语管理
     * 
     * @param slogan 标语管理
     * @return 结果
     */
    public int updateKmSlogan(Slogan slogan);

    /**
     * 删除标语管理
     * 
     * @param id 标语管理主键
     * @return 结果
     */
    public int deleteKmSloganById(Long id);

    /**
     * 批量删除标语管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmSloganByIds(Long[] ids);
}
