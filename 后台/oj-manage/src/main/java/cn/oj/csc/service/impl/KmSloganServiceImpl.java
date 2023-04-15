package cn.oj.csc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmSloganMapper;
import cn.oj.csc.domain.Slogan;
import cn.oj.csc.service.IKmSloganService;

/**
 * 标语管理Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
@Service
public class KmSloganServiceImpl implements IKmSloganService 
{
    @Autowired
    private KmSloganMapper kmSloganMapper;

    /**
     * 查询标语管理
     * 
     * @param id 标语管理主键
     * @return 标语管理
     */
    @Override
    public Slogan selectKmSloganById(Long id)
    {
        return kmSloganMapper.selectKmSloganById(id);
    }

    /**
     * 查询标语管理列表
     * 
     * @param slogan 标语管理
     * @return 标语管理
     */
    @Override
    public List<Slogan> selectKmSloganList(Slogan slogan)
    {
        return kmSloganMapper.selectKmSloganList(slogan);
    }

    /**
     * 新增标语管理
     * 
     * @param slogan 标语管理
     * @return 结果
     */
    @Override
    public int insertKmSlogan(Slogan slogan)
    {
        return kmSloganMapper.insertKmSlogan(slogan);
    }

    /**
     * 修改标语管理
     * 
     * @param slogan 标语管理
     * @return 结果
     */
    @Override
    public int updateKmSlogan(Slogan slogan)
    {
        return kmSloganMapper.updateKmSlogan(slogan);
    }

    /**
     * 批量删除标语管理
     * 
     * @param ids 需要删除的标语管理主键
     * @return 结果
     */
    @Override
    public int deleteKmSloganByIds(Long[] ids)
    {
        return kmSloganMapper.deleteKmSloganByIds(ids);
    }

    /**
     * 删除标语管理信息
     * 
     * @param id 标语管理主键
     * @return 结果
     */
    @Override
    public int deleteKmSloganById(Long id)
    {
        return kmSloganMapper.deleteKmSloganById(id);
    }
}
