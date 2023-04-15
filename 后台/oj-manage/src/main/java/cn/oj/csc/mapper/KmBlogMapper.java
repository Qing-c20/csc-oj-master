package cn.oj.csc.mapper;

import java.util.List;
import cn.oj.csc.domain.Blog;

/**
 * 博客管理Mapper接口
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
public interface KmBlogMapper 
{
    /**
     * 查询博客管理
     * 
     * @param id 博客管理主键
     * @return 博客管理
     */
    public Blog selectKmBlogById(Long id);

    /**
     * 查询博客管理列表
     * 
     * @param blog 博客管理
     * @return 博客管理集合
     */
    public List<Blog> selectKmBlogList(Blog blog);

    /**
     * 新增博客管理
     * 
     * @param blog 博客管理
     * @return 结果
     */
    public int insertKmBlog(Blog blog);

    /**
     * 修改博客管理
     * 
     * @param blog 博客管理
     * @return 结果
     */
    public int updateKmBlog(Blog blog);

    /**
     * 删除博客管理
     * 
     * @param id 博客管理主键
     * @return 结果
     */
    public int deleteKmBlogById(Long id);

    /**
     * 批量删除博客管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKmBlogByIds(Long[] ids);
}
