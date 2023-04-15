package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmBlogMapper;
import cn.oj.csc.domain.Blog;
import cn.oj.csc.service.IKmBlogService;

/**
 * 博客管理Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
@Service
public class KmBlogServiceImpl implements IKmBlogService 
{
    @Autowired
    private KmBlogMapper kmBlogMapper;

    /**
     * 查询博客管理
     * 
     * @param id 博客管理主键
     * @return 博客管理
     */
    @Override
    public Blog selectKmBlogById(Long id)
    {
        return kmBlogMapper.selectKmBlogById(id);
    }

    /**
     * 查询博客管理列表
     * 
     * @param blog 博客管理
     * @return 博客管理
     */
    @Override
    public List<Blog> selectKmBlogList(Blog blog)
    {
        return kmBlogMapper.selectKmBlogList(blog);
    }

    /**
     * 新增博客管理
     * 
     * @param blog 博客管理
     * @return 结果
     */
    @Override
    public int insertKmBlog(Blog blog)
    {
        blog.setCreateTime(DateUtils.getNowDate());
        return kmBlogMapper.insertKmBlog(blog);
    }

    /**
     * 修改博客管理
     * 
     * @param blog 博客管理
     * @return 结果
     */
    @Override
    public int updateKmBlog(Blog blog)
    {
        return kmBlogMapper.updateKmBlog(blog);
    }

    /**
     * 批量删除博客管理
     * 
     * @param ids 需要删除的博客管理主键
     * @return 结果
     */
    @Override
    public int deleteKmBlogByIds(Long[] ids)
    {
        return kmBlogMapper.deleteKmBlogByIds(ids);
    }

    /**
     * 删除博客管理信息
     * 
     * @param id 博客管理主键
     * @return 结果
     */
    @Override
    public int deleteKmBlogById(Long id)
    {
        return kmBlogMapper.deleteKmBlogById(id);
    }
}
