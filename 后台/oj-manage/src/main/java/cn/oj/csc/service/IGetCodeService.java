package cn.oj.csc.service;

import cn.oj.csc.domain.UserAnswer;

public interface IGetCodeService {
    /**
     * 添加用户答题信息
     *
     * @param uid 用户id qid 题目id
     *        code 代码 status 答题状态
     * @return 用户答题管理
     */
    public UserAnswer setUserAnswerById(long uid, long qid, String code, String status);
}
