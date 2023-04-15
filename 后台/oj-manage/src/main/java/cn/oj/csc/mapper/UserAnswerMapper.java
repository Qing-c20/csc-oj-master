package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.UserAnswer;

/**
 * 用户答题管理Mapper接口
 * 
 * @author csc
 * @date 2023-03-30
 */
public interface UserAnswerMapper 
{
    /**
     * 查询用户答题管理
     * 
     * @param id 用户答题管理主键
     * @return 用户答题管理
     */
    public UserAnswer selectUserAnswerById(Long id);

    /**
     * 查询用户答题管理列表
     * 
     * @param userAnswer 用户答题管理
     * @return 用户答题管理集合
     */
    public List<UserAnswer> selectUserAnswerList(UserAnswer userAnswer);

    /**
     * 新增用户答题管理
     * 
     * @param userAnswer 用户答题管理
     * @return 结果
     */
    public int insertUserAnswer(UserAnswer userAnswer);

    /**
     * 修改用户答题管理
     * 
     * @param userAnswer 用户答题管理
     * @return 结果
     */
    public int updateUserAnswer(UserAnswer userAnswer);

    /**
     * 删除用户答题管理
     * 
     * @param id 用户答题管理主键
     * @return 结果
     */
    public int deleteUserAnswerById(Long id);

    /**
     * 批量删除用户答题管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserAnswerByIds(Long[] ids);
}
