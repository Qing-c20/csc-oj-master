package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.Users;

/**
 * 用户管理Mapper接口
 * 
 * @author 翟彬州
 * @date 2022-07-02
 */
public interface KmUserMapper 
{
    /**
     * 查询用户管理
     * 
     * @param id 用户管理主键
     * @return 用户管理
     */
    public Users selectKmUserById(Long id);

    /**
     * 查询用户管理
     *
     * @param userId 用户管理主键
     * @return 用户管理
     */
    public Users selectKmUserByUserId(String userId);

    /**
     * 查询用户管理列表
     * 
     * @param users 用户管理
     * @return 用户管理集合
     */
    public List<Users> selectKmUserList(Users users);

    /**
     * 新增用户管理
     * 
     * @param users 用户管理
     * @return 结果
     */
    public int insertKmUser(Users users);

    /**
     * 修改用户管理
     * 
     * @param users 用户管理
     * @return 结果
     */
    public int updateKmUser(Users users);

    /**
     * 删除用户管理
     * 
     * @param id 用户管理主键
     * @return 结果
     */
    public int deleteKmUserById(Long id);

    /**
     * 批量删除用户管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmUserByIds(Long[] ids);
}
