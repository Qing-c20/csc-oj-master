package cn.oj.csc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmDictMapper;
import cn.oj.csc.domain.Dict;
import cn.oj.csc.service.IKmDictService;

/**
 * 字典管理Service业务层处理
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
@Service
public class KmDictServiceImpl implements IKmDictService 
{
    @Autowired
    private KmDictMapper kmDictMapper;

    /**
     * 查询字典管理
     * 
     * @param id 字典管理主键
     * @return 字典管理
     */
    @Override
    public Dict selectKmDictById(Long id)
    {
        return kmDictMapper.selectKmDictById(id);
    }

    /**
     * 查询字典管理列表
     * 
     * @param dict 字典管理
     * @return 字典管理
     */
    @Override
    public List<Dict> selectKmDictList(Dict dict)
    {
        return kmDictMapper.selectKmDictList(dict);
    }

    /**
     * 新增字典管理
     * 
     * @param dict 字典管理
     * @return 结果
     */
    @Override
    public int insertKmDict(Dict dict)
    {
        return kmDictMapper.insertKmDict(dict);
    }

    /**
     * 修改字典管理
     * 
     * @param dict 字典管理
     * @return 结果
     */
    @Override
    public int updateKmDict(Dict dict)
    {
        return kmDictMapper.updateKmDict(dict);
    }

    /**
     * 批量删除字典管理
     * 
     * @param ids 需要删除的字典管理主键
     * @return 结果
     */
    @Override
    public int deleteKmDictByIds(Long[] ids)
    {
        return kmDictMapper.deleteKmDictByIds(ids);
    }

    /**
     * 删除字典管理信息
     * 
     * @param id 字典管理主键
     * @return 结果
     */
    @Override
    public int deleteKmDictById(Long id)
    {
        return kmDictMapper.deleteKmDictById(id);
    }
}
