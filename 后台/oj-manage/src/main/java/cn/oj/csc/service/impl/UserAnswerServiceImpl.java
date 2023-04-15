package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.UserAnswerMapper;
import cn.oj.csc.domain.UserAnswer;
import cn.oj.csc.service.IUserAnswerService;

/**
 * 用户答题管理Service业务层处理
 * 
 * @author csc
 * @date 2023-03-30
 */
@Service
public class UserAnswerServiceImpl implements IUserAnswerService 
{
    @Autowired
    private UserAnswerMapper userAnswerMapper;

    /**
     * 查询用户答题管理
     * 
     * @param id 用户答题管理主键
     * @return 用户答题管理
     */
    @Override
    public UserAnswer selectUserAnswerById(Long id)
    {
        return userAnswerMapper.selectUserAnswerById(id);
    }

    /**
     * 查询用户答题管理列表
     * 
     * @param userAnswer 用户答题管理
     * @return 用户答题管理
     */
    @Override
    public List<UserAnswer> selectUserAnswerList(UserAnswer userAnswer)
    {
        return userAnswerMapper.selectUserAnswerList(userAnswer);
    }

    /**
     * 新增用户答题管理
     * 
     * @param userAnswer 用户答题管理
     * @return 结果
     */
    @Override
    public int insertUserAnswer(UserAnswer userAnswer)
    {
        userAnswer.setCreateTime(DateUtils.getNowDate());
        return userAnswerMapper.insertUserAnswer(userAnswer);
    }

    /**
     * 修改用户答题管理
     * 
     * @param userAnswer 用户答题管理
     * @return 结果
     */
    @Override
    public int updateUserAnswer(UserAnswer userAnswer)
    {
        userAnswer.setUpdateTime(DateUtils.getNowDate());
        return userAnswerMapper.updateUserAnswer(userAnswer);
    }

    /**
     * 批量删除用户答题管理
     * 
     * @param ids 需要删除的用户答题管理主键
     * @return 结果
     */
    @Override
    public int deleteUserAnswerByIds(Long[] ids)
    {
        return userAnswerMapper.deleteUserAnswerByIds(ids);
    }

    /**
     * 删除用户答题管理信息
     * 
     * @param id 用户答题管理主键
     * @return 结果
     */
    @Override
    public int deleteUserAnswerById(Long id)
    {
        return userAnswerMapper.deleteUserAnswerById(id);
    }
}
