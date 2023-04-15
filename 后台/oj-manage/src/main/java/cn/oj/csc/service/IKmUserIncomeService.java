package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.UserIncome;

/**
 * 用户收入Service接口
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
public interface IKmUserIncomeService 
{
    /**
     * 查询用户收入
     * 
     * @param id 用户收入主键
     * @return 用户收入
     */
    public UserIncome selectKmUserIncomeById(Long id);

    /**
     * 查询用户收入列表
     * 
     * @param userIncome 用户收入
     * @return 用户收入集合
     */
    public List<UserIncome> selectKmUserIncomeList(UserIncome userIncome);

    /**
     * 新增用户收入
     * 
     * @param userIncome 用户收入
     * @return 结果
     */
    public int insertKmUserIncome(UserIncome userIncome);

    /**
     * 修改用户收入
     * 
     * @param userIncome 用户收入
     * @return 结果
     */
    public int updateKmUserIncome(UserIncome userIncome);

    /**
     * 批量删除用户收入
     * 
     * @param ids 需要删除的用户收入主键集合
     * @return 结果
     */
    public int deleteKmUserIncomeByIds(Long[] ids);

    /**
     * 删除用户收入信息
     * 
     * @param id 用户收入主键
     * @return 结果
     */
    public int deleteKmUserIncomeById(Long id);
}
