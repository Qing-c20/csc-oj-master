package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmUserMapper;
import cn.oj.csc.domain.Users;
import cn.oj.csc.service.IKmUserService;

/**
 * 用户管理Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-02
 */
@Service
public class KmUserServiceImpl implements IKmUserService 
{
    @Autowired
    private KmUserMapper kmUserMapper;

    /**
     * 查询用户管理
     * 
     * @param id 用户管理主键
     * @return 用户管理
     */
    @Override
    public Users selectKmUserById(Long id)
    {
        return kmUserMapper.selectKmUserById(id);
    }

    /**
     * 查询用户管理列表
     * 
     * @param users 用户管理
     * @return 用户管理
     */
    @Override
    public List<Users> selectKmUserList(Users users)
    {
        return kmUserMapper.selectKmUserList(users);
    }

    /**
     * 新增用户管理
     * 
     * @param users 用户管理
     * @return 结果
     */
    @Override
    public int insertKmUser(Users users)
    {
        users.setCreateTime(DateUtils.getNowDate());
        return kmUserMapper.insertKmUser(users);
    }

    /**
     * 修改用户管理
     * 
     * @param users 用户管理
     * @return 结果
     */
    @Override
    public int updateKmUser(Users users)
    {
        return kmUserMapper.updateKmUser(users);
    }

    /**
     * 批量删除用户管理
     * 
     * @param ids 需要删除的用户管理主键
     * @return 结果
     */
    @Override
    public int deleteKmUserByIds(Long[] ids)
    {
        return kmUserMapper.deleteKmUserByIds(ids);
    }

    /**
     * 删除用户管理信息
     * 
     * @param id 用户管理主键
     * @return 结果
     */
    @Override
    public int deleteKmUserById(Long id)
    {
        return kmUserMapper.deleteKmUserById(id);
    }
}
