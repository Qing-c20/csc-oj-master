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
import cn.oj.csc.domain.Collections;
import cn.oj.csc.service.ICollectionsService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 个人收藏管理Controller
 * 
 * @author csc
 * @date 2023-04-13
 */
@RestController
@RequestMapping("/ojmanage/collections")
public class CollectionsController extends BaseController
{
    @Autowired
    private ICollectionsService collectionsService;

    /**
     * 查询个人收藏管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:list')")
    @GetMapping("/list")
    public TableDataInfo list(Collections collections)
    {
        startPage();
        List<Collections> list = collectionsService.selectCollectionsList(collections);
        return getDataTable(list);
    }

    /**
     * 导出个人收藏管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:export')")
    @Log(title = "个人收藏管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Collections collections)
    {
        List<Collections> list = collectionsService.selectCollectionsList(collections);
        ExcelUtil<Collections> util = new ExcelUtil<Collections>(Collections.class);
        util.exportExcel(response, list, "个人收藏管理数据");
    }

    /**
     * 获取个人收藏管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:query')")
    @GetMapping(value = "/{user_id}")
    public AjaxResult getInfo(@PathVariable("user_id") Long user_id)
    {
//        return AjaxResult.success(collectionsService.selectCollectionsById(id));
        return AjaxResult.success(collectionsService.selectCollectionsByUserId(user_id));

    }

    /**
     * 新增个人收藏管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:add')")
    @Log(title = "个人收藏管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Collections collections)
    {
        return toAjax(collectionsService.insertCollections(collections));
    }

    /**
     * 修改个人收藏管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:edit')")
    @Log(title = "个人收藏管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Collections collections)
    {
        return toAjax(collectionsService.updateCollections(collections));
    }

    /**
     * 删除个人收藏管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:collections:remove')")
    @Log(title = "个人收藏管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(collectionsService.deleteCollectionsByIds(ids));
    }
}
