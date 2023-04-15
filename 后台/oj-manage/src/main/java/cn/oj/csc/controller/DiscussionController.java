package cn.oj.csc.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import cn.oj.csc.domain.Discussion;
import cn.oj.csc.service.IDiscussionService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 讨论区管理Controller
 * 
 * @author csc
 * @date 2023-04-12
 */
@RestController
@RequestMapping("/ojmanage/discussion")
public class DiscussionController extends BaseController
{
    @Autowired
    private IDiscussionService discussionService;

    /**
     * 查询讨论区管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:list')")
    @GetMapping("/list")
    public TableDataInfo list(Discussion discussion)
    {
        startPage();
        List<Discussion> list = discussionService.selectDiscussionList(discussion);
        return getDataTable(list);
    }

    /**
     * 导出讨论区管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:export')")
    @Log(title = "讨论区管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Discussion discussion)
    {
        List<Discussion> list = discussionService.selectDiscussionList(discussion);
        ExcelUtil<Discussion> util = new ExcelUtil<Discussion>(Discussion.class);
        util.exportExcel(response, list, "讨论区管理数据");
    }

    /**
     * 获取讨论区管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:query')")
    @GetMapping(value = "/{discussionId}")
    public AjaxResult getInfo(@PathVariable("discussionId") Long discussionId)
    {
        return AjaxResult.success(discussionService.selectDiscussionByDiscussionId(discussionId));
    }

    /**
     * 新增讨论区管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:add')")
    @Log(title = "讨论区管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Discussion discussion)
    {
        return toAjax(discussionService.insertDiscussion(discussion));
    }

    /**
     * 修改讨论区管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:edit')")
    @Log(title = "讨论区管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Discussion discussion)
    {
        return toAjax(discussionService.updateDiscussion(discussion));
    }

    /**
     * 删除讨论区管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:discussion:remove')")
    @Log(title = "讨论区管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{discussionIds}")
    public AjaxResult remove(@PathVariable Long[] discussionIds)
    {
        return toAjax(discussionService.deleteDiscussionByDiscussionIds(discussionIds));
    }
}
