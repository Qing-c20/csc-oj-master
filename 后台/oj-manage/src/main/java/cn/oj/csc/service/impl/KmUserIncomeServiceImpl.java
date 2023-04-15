package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmUserIncomeMapper;
import cn.oj.csc.domain.UserIncome;
import cn.oj.csc.service.IKmUserIncomeService;

/**
 * 用户收入Service业务层处理
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
@Service
public class KmUserIncomeServiceImpl implements IKmUserIncomeService 
{
    @Autowired
    private KmUserIncomeMapper kmUserIncomeMapper;

    /**
     * 查询用户收入
     * 
     * @param id 用户收入主键
     * @return 用户收入
     */
    @Override
    public UserIncome selectKmUserIncomeById(Long id)
    {
        return kmUserIncomeMapper.selectKmUserIncomeById(id);
    }

    /**
     * 查询用户收入列表
     * 
     * @param userIncome 用户收入
     * @return 用户收入
     */
    @Override
    public List<UserIncome> selectKmUserIncomeList(UserIncome userIncome)
    {
        return kmUserIncomeMapper.selectKmUserIncomeList(userIncome);
    }

    /**
     * 新增用户收入
     * 
     * @param userIncome 用户收入
     * @return 结果
     */
    @Override
    public int insertKmUserIncome(UserIncome userIncome)
    {
        userIncome.setCreateTime(DateUtils.getNowDate());
        return kmUserIncomeMapper.insertKmUserIncome(userIncome);
    }

    /**
     * 修改用户收入
     * 
     * @param userIncome 用户收入
     * @return 结果
     */
    @Override
    public int updateKmUserIncome(UserIncome userIncome)
    {
        return kmUserIncomeMapper.updateKmUserIncome(userIncome);
    }

    /**
     * 批量删除用户收入
     * 
     * @param ids 需要删除的用户收入主键
     * @return 结果
     */
    @Override
    public int deleteKmUserIncomeByIds(Long[] ids)
    {
        return kmUserIncomeMapper.deleteKmUserIncomeByIds(ids);
    }

    /**
     * 删除用户收入信息
     * 
     * @param id 用户收入主键
     * @return 结果
     */
    @Override
    public int deleteKmUserIncomeById(Long id)
    {
        return kmUserIncomeMapper.deleteKmUserIncomeById(id);
    }
}
