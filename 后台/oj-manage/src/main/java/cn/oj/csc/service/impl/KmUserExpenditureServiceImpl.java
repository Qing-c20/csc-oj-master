package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmUserExpenditureMapper;
import cn.oj.csc.domain.UserExpenditure;
import cn.oj.csc.service.IKmUserExpenditureService;

/**
 * 用户支出Service业务层处理
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
@Service
public class KmUserExpenditureServiceImpl implements IKmUserExpenditureService 
{
    @Autowired
    private KmUserExpenditureMapper kmUserExpenditureMapper;

    /**
     * 查询用户支出
     * 
     * @param id 用户支出主键
     * @return 用户支出
     */
    @Override
    public UserExpenditure selectKmUserExpenditureById(Long id)
    {
        return kmUserExpenditureMapper.selectKmUserExpenditureById(id);
    }

    /**
     * 查询用户支出列表
     * 
     * @param userExpenditure 用户支出
     * @return 用户支出
     */
    @Override
    public List<UserExpenditure> selectKmUserExpenditureList(UserExpenditure userExpenditure)
    {
        return kmUserExpenditureMapper.selectKmUserExpenditureList(userExpenditure);
    }

    /**
     * 新增用户支出
     * 
     * @param userExpenditure 用户支出
     * @return 结果
     */
    @Override
    public int insertKmUserExpenditure(UserExpenditure userExpenditure)
    {
        userExpenditure.setCreateTime(DateUtils.getNowDate());
        return kmUserExpenditureMapper.insertKmUserExpenditure(userExpenditure);
    }

    /**
     * 修改用户支出
     * 
     * @param userExpenditure 用户支出
     * @return 结果
     */
    @Override
    public int updateKmUserExpenditure(UserExpenditure userExpenditure)
    {
        return kmUserExpenditureMapper.updateKmUserExpenditure(userExpenditure);
    }

    /**
     * 批量删除用户支出
     * 
     * @param ids 需要删除的用户支出主键
     * @return 结果
     */
    @Override
    public int deleteKmUserExpenditureByIds(Long[] ids)
    {
        return kmUserExpenditureMapper.deleteKmUserExpenditureByIds(ids);
    }

    /**
     * 删除用户支出信息
     * 
     * @param id 用户支出主键
     * @return 结果
     */
    @Override
    public int deleteKmUserExpenditureById(Long id)
    {
        return kmUserExpenditureMapper.deleteKmUserExpenditureById(id);
    }
}
