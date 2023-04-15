package cn.oj.csc.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;

import cn.oj.common.core.domain.entity.SysUser;
import cn.oj.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
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
import cn.oj.csc.domain.News;
import cn.oj.csc.service.IKmNewsService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 狂码新闻Controller
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
@RestController
@RequestMapping("/kmappmanage/news")
public class NewsController extends BaseController
{
    @Autowired
    private IKmNewsService kmNewsService;

    /**
     * 查询狂码新闻列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:list')")
    @GetMapping("/list")
    public TableDataInfo list(News news)
    {
        startPage();
        List<News> list = kmNewsService.selectKmNewsList(news);
        return getDataTable(list);
    }

    /**
     * 导出狂码新闻列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:export')")
    @Log(title = "狂码新闻", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, News news)
    {
        List<News> list = kmNewsService.selectKmNewsList(news);
        ExcelUtil<News> util = new ExcelUtil<News>(News.class);
        util.exportExcel(response, list, "狂码新闻数据");
    }

    /**
     * 获取狂码新闻详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmNewsService.selectKmNewsById(id));
    }

    /**
     * 新增狂码新闻
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:add')")
    @Log(title = "狂码新闻", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody News news)
    {
        news.setBlogId(UUID.randomUUID().toString());
        news.setStatus(1L);
        news.setCreateTime(new Date());
        SysUser user = SecurityUtils.getLoginUser().getUser();
        news.setAuthor(user.getNickName());
        return toAjax(kmNewsService.insertKmNews(news));
    }

    /**
     * 修改狂码新闻
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:edit')")
    @Log(title = "狂码新闻", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody News news)
    {
        return toAjax(kmNewsService.updateKmNews(news));
    }

    /**
     * 删除狂码新闻
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:news:remove')")
    @Log(title = "狂码新闻", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmNewsService.deleteKmNewsByIds(ids));
    }
}
