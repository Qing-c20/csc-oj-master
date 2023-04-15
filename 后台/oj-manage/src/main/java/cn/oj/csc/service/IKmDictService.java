package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Dict;

/**
 * 字典管理Service接口
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
public interface IKmDictService 
{
    /**
     * 查询字典管理
     * 
     * @param id 字典管理主键
     * @return 字典管理
     */
    public Dict selectKmDictById(Long id);

    /**
     * 查询字典管理列表
     * 
     * @param dict 字典管理
     * @return 字典管理集合
     */
    public List<Dict> selectKmDictList(Dict dict);

    /**
     * 新增字典管理
     * 
     * @param dict 字典管理
     * @return 结果
     */
    public int insertKmDict(Dict dict);

    /**
     * 修改字典管理
     * 
     * @param dict 字典管理
     * @return 结果
     */
    public int updateKmDict(Dict dict);

    /**
     * 批量删除字典管理
     * 
     * @param ids 需要删除的字典管理主键集合
     * @return 结果
     */
    public int deleteKmDictByIds(Long[] ids);

    /**
     * 删除字典管理信息
     * 
     * @param id 字典管理主键
     * @return 结果
     */
    public int deleteKmDictById(Long id);
}
