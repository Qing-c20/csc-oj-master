package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.UserExpenditure;

/**
 * 用户支出Service接口
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
public interface IKmUserExpenditureService 
{
    /**
     * 查询用户支出
     * 
     * @param id 用户支出主键
     * @return 用户支出
     */
    public UserExpenditure selectKmUserExpenditureById(Long id);

    /**
     * 查询用户支出列表
     * 
     * @param userExpenditure 用户支出
     * @return 用户支出集合
     */
    public List<UserExpenditure> selectKmUserExpenditureList(UserExpenditure userExpenditure);

    /**
     * 新增用户支出
     * 
     * @param userExpenditure 用户支出
     * @return 结果
     */
    public int insertKmUserExpenditure(UserExpenditure userExpenditure);

    /**
     * 修改用户支出
     * 
     * @param userExpenditure 用户支出
     * @return 结果
     */
    public int updateKmUserExpenditure(UserExpenditure userExpenditure);

    /**
     * 批量删除用户支出
     * 
     * @param ids 需要删除的用户支出主键集合
     * @return 结果
     */
    public int deleteKmUserExpenditureByIds(Long[] ids);

    /**
     * 删除用户支出信息
     * 
     * @param id 用户支出主键
     * @return 结果
     */
    public int deleteKmUserExpenditureById(Long id);
}
