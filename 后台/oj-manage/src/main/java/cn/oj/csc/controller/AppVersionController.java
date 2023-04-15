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
import cn.oj.csc.domain.AppVersion;
import cn.oj.csc.service.IKmAppVersionService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 应用版本Controller
 * 
 * @author 甲粒子
 * @date 2022-08-11
 */
@RestController
@RequestMapping("/kmappmanage/appversion")
public class AppVersionController extends BaseController
{
    @Autowired
    private IKmAppVersionService kmAppVersionService;

    /**
     * 查询应用版本列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppVersion appVersion)
    {
        startPage();
        List<AppVersion> list = kmAppVersionService.selectKmAppVersionList(appVersion);
        return getDataTable(list);
    }

    /**
     * 导出应用版本列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:export')")
    @Log(title = "应用版本", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppVersion appVersion)
    {
        List<AppVersion> list = kmAppVersionService.selectKmAppVersionList(appVersion);
        ExcelUtil<AppVersion> util = new ExcelUtil<AppVersion>(AppVersion.class);
        util.exportExcel(response, list, "应用版本数据");
    }

    /**
     * 获取应用版本详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmAppVersionService.selectKmAppVersionById(id));
    }

    /**
     * 新增应用版本
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:add')")
    @Log(title = "应用版本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppVersion appVersion)
    {
        return toAjax(kmAppVersionService.insertKmAppVersion(appVersion));
    }

    /**
     * 修改应用版本
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:edit')")
    @Log(title = "应用版本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppVersion appVersion)
    {
        return toAjax(kmAppVersionService.updateKmAppVersion(appVersion));
    }

    /**
     * 删除应用版本
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:appversion:remove')")
    @Log(title = "应用版本", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmAppVersionService.deleteKmAppVersionByIds(ids));
    }
}
