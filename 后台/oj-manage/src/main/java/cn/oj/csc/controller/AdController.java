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
import cn.oj.csc.domain.Ad;
import cn.oj.csc.service.IKmAdService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 广告管理Controller
 * 
 * @author 翟彬州
 * @date 2022-07-07
 */
@RestController
@RequestMapping("/kmappmanage/ad")
public class AdController extends BaseController
{
    @Autowired
    private IKmAdService kmAdService;

    /**
     * 查询广告管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:list')")
    @GetMapping("/list")
    public TableDataInfo list(Ad ad)
    {
        startPage();
        List<Ad> list = kmAdService.selectKmAdList(ad);
        return getDataTable(list);
    }

    /**
     * 导出广告管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:export')")
    @Log(title = "广告管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Ad ad)
    {
        List<Ad> list = kmAdService.selectKmAdList(ad);
        ExcelUtil<Ad> util = new ExcelUtil<Ad>(Ad.class);
        util.exportExcel(response, list, "广告管理数据");
    }

    /**
     * 获取广告管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmAdService.selectKmAdById(id));
    }

    /**
     * 新增广告管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:add')")
    @Log(title = "广告管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Ad ad)
    {
        return toAjax(kmAdService.insertKmAd(ad));
    }

    /**
     * 修改广告管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:edit')")
    @Log(title = "广告管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Ad ad)
    {
        return toAjax(kmAdService.updateKmAd(ad));
    }

    /**
     * 删除广告管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:ad:remove')")
    @Log(title = "广告管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmAdService.deleteKmAdByIds(ids));
    }
}
