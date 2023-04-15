package cn.oj.csc.service.impl;

import java.util.List;

import cn.oj.csc.domain.Users;
import cn.oj.csc.mapper.KmUserMapper;
import cn.oj.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmRealnameAuthenticationMapper;
import cn.oj.csc.domain.RealnameAuthentication;
import cn.oj.csc.service.IKmRealnameAuthenticationService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 实名审核Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
@Service
public class KmRealnameAuthenticationServiceImpl implements IKmRealnameAuthenticationService 
{
    @Autowired
    private KmRealnameAuthenticationMapper kmRealnameAuthenticationMapper;
    @Autowired
    private KmUserMapper userMapper;

    /**
     * 查询实名审核
     * 
     * @param id 实名审核主键
     * @return 实名审核
     */
    @Override
    public RealnameAuthentication selectKmRealnameAuthenticationById(Long id)
    {
        return kmRealnameAuthenticationMapper.selectKmRealnameAuthenticationById(id);
    }

    /**
     * 查询实名审核列表
     * 
     * @param realnameAuthentication 实名审核
     * @return 实名审核
     */
    @Override
    public List<RealnameAuthentication> selectKmRealnameAuthenticationList(RealnameAuthentication realnameAuthentication)
    {
        return kmRealnameAuthenticationMapper.selectKmRealnameAuthenticationList(realnameAuthentication);
    }

    /**
     * 新增实名审核
     * 
     * @param realnameAuthentication 实名审核
     * @return 结果
     */
    @Override
    public int insertKmRealnameAuthentication(RealnameAuthentication realnameAuthentication)
    {
        return kmRealnameAuthenticationMapper.insertKmRealnameAuthentication(realnameAuthentication);
    }

    /**
     * 修改实名审核
     * 
     * @param realnameAuthentication 实名审核
     * @return 结果
     */
    @Override
    @Transactional
    public int updateKmRealnameAuthentication(RealnameAuthentication realnameAuthentication)
    {
        if (realnameAuthentication.getStatus() == 1) {
            String userId = realnameAuthentication.getUserId();
            Users users = userMapper.selectKmUserByUserId(userId);
            users.setRealname(realnameAuthentication.getRealname());
            String authentication = StringUtils.isEmpty(users.getAuthentication()) ? "" : users.getAuthentication();
            users.setAuthentication(authentication+1+"|");
            String studentno = StringUtils.nvl(realnameAuthentication.getStudentno(),"");
            users.setStudentno(studentno);
            userMapper.updateKmUser(users);
        }
        return kmRealnameAuthenticationMapper.updateKmRealnameAuthentication(realnameAuthentication);
    }

    /**
     * 批量删除实名审核
     * 
     * @param ids 需要删除的实名审核主键
     * @return 结果
     */
    @Override
    public int deleteKmRealnameAuthenticationByIds(Long[] ids)
    {
        return kmRealnameAuthenticationMapper.deleteKmRealnameAuthenticationByIds(ids);
    }

    /**
     * 删除实名审核信息
     * 
     * @param id 实名审核主键
     * @return 结果
     */
    @Override
    public int deleteKmRealnameAuthenticationById(Long id)
    {
        return kmRealnameAuthenticationMapper.deleteKmRealnameAuthenticationById(id);
    }
}
