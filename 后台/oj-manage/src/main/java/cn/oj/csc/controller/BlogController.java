package cn.oj.csc.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.oj.common.core.domain.entity.SysUser;
import cn.oj.common.core.domain.model.LoginUser;
import cn.oj.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.oj.common.annotation.Log;
import cn.oj.common.core.controller.BaseController;
import cn.oj.common.core.domain.AjaxResult;
import cn.oj.common.enums.BusinessType;
import cn.oj.csc.domain.Blog;
import cn.oj.csc.service.IKmBlogService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 博客管理Controller
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
@RestController
@RequestMapping("/kmappmanage/blog")
public class BlogController extends BaseController
{
    @Autowired
    private IKmBlogService kmBlogService;

    /**
     * 查询博客管理列表
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:list')")
    @GetMapping("/list")
    public TableDataInfo list(Blog blog)
    {
        startPage();
        List<Blog> list = kmBlogService.selectKmBlogList(blog);
        return getDataTable(list);
    }

    /**
     * 导出博客管理列表
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:export')")
    @Log(title = "博客管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Blog blog)
    {
        List<Blog> list = kmBlogService.selectKmBlogList(blog);
        ExcelUtil<Blog> util = new ExcelUtil<Blog>(Blog.class);
        util.exportExcel(response, list, "博客管理数据");
    }

    /**
     * 获取博客管理详细信息
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmBlogService.selectKmBlogById(id));
    }

    /**
     * 新增博客管理
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:add')")
    @Log(title = "博客管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Blog blog)
    {
        // 获取当前的用户名称
        LoginUser loginUser = SecurityUtils.getLoginUser();
        SysUser user = loginUser.getUser();
/*        System.out.println(user.getUserId());
        System.out.println(user.getUserName());
        System.out.println(user.getNickName());*/
        blog.setAuthor(user.getNickName());
        blog.setAuthorId(user.getUserName());
        System.out.println(blog.getAuthorId());
        return toAjax(kmBlogService.insertKmBlog(blog));
    }

    /**
     * 修改博客管理
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:edit')")
    @Log(title = "博客管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Blog blog)
    {
        return toAjax(kmBlogService.updateKmBlog(blog));
    }

    /**
     * 删除博客管理
     */
    //@PreAuthorize("@ss.hasPermi('kmappmanage:blog:remove')")
    @Log(title = "博客管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmBlogService.deleteKmBlogByIds(ids));
    }
}
