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
import cn.oj.csc.domain.Banner;
import cn.oj.csc.service.IKmBannerService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 狂码bannerController
 * 
 * @author 甲粒子
 * @date 2022-08-18
 */
@RestController
@RequestMapping("/kmappmanage/kmbanner")
public class BannerController extends BaseController
{
    @Autowired
    private IKmBannerService kmBannerService;

    /**
     * 查询狂码banner列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:list')")
    @GetMapping("/list")
    public TableDataInfo list(Banner banner)
    {
        startPage();
        List<Banner> list = kmBannerService.selectKmBannerList(banner);
        return getDataTable(list);
    }

    /**
     * 导出狂码banner列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:export')")
    @Log(title = "狂码banner", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Banner banner)
    {
        List<Banner> list = kmBannerService.selectKmBannerList(banner);
        ExcelUtil<Banner> util = new ExcelUtil<Banner>(Banner.class);
        util.exportExcel(response, list, "狂码banner数据");
    }

    /**
     * 获取狂码banner详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmBannerService.selectKmBannerById(id));
    }

    /**
     * 新增狂码banner
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:add')")
    @Log(title = "狂码banner", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Banner banner)
    {
        return toAjax(kmBannerService.insertKmBanner(banner));
    }

    /**
     * 修改狂码banner
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:edit')")
    @Log(title = "狂码banner", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Banner banner)
    {
        return toAjax(kmBannerService.updateKmBanner(banner));
    }

    /**
     * 删除狂码banner
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:kmbanner:remove')")
    @Log(title = "狂码banner", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmBannerService.deleteKmBannerByIds(ids));
    }
}
