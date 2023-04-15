package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.QuestionMapper;
import cn.oj.csc.domain.Question;
import cn.oj.csc.service.IQuestionService;

/**
 * 题目管理Service业务层处理
 * 
 * @author csc
 * @date 2023-04-13
 */
@Service
public class QuestionServiceImpl implements IQuestionService 
{
    @Autowired
    private QuestionMapper questionMapper;

    /**
     * 查询题目管理
     * 
     * @param id 题目管理主键
     * @return 题目管理
     */
    @Override
    public Question selectQuestionById(Long id)
    {
        return questionMapper.selectQuestionById(id);
    }

    /**
     * 查询题目管理列表
     * 
     * @param question 题目管理
     * @return 题目管理
     */
    @Override
    public List<Question> selectQuestionList(Question question)
    {
        return questionMapper.selectQuestionList(question);
    }

    /**
     * 新增题目管理
     * 
     * @param question 题目管理
     * @return 结果
     */
    @Override
    public int insertQuestion(Question question)
    {
        question.setCreateTime(DateUtils.getNowDate());
        return questionMapper.insertQuestion(question);
    }

    /**
     * 修改题目管理
     * 
     * @param question 题目管理
     * @return 结果
     */
    @Override
    public int updateQuestion(Question question)
    {
        return questionMapper.updateQuestion(question);
    }

    /**
     * 批量删除题目管理
     * 
     * @param ids 需要删除的题目管理主键
     * @return 结果
     */
    @Override
    public int deleteQuestionByIds(Long[] ids)
    {
        return questionMapper.deleteQuestionByIds(ids);
    }

    /**
     * 删除题目管理信息
     * 
     * @param id 题目管理主键
     * @return 结果
     */
    @Override
    public int deleteQuestionById(Long id)
    {
        return questionMapper.deleteQuestionById(id);
    }
}
