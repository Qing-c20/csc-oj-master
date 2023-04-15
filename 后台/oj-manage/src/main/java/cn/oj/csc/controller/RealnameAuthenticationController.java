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
import cn.oj.csc.domain.RealnameAuthentication;
import cn.oj.csc.service.IKmRealnameAuthenticationService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 实名审核Controller
 * 
 * @author 翟彬州
 * @date 2022-07-04
 */
@RestController
@RequestMapping("/kmappmanage/realname")
public class RealnameAuthenticationController extends BaseController
{
    @Autowired
    private IKmRealnameAuthenticationService kmRealnameAuthenticationService;

    /**
     * 查询实名审核列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:list')")
    @GetMapping("/list")
    public TableDataInfo list(RealnameAuthentication realnameAuthentication)
    {
        startPage();
        List<RealnameAuthentication> list = kmRealnameAuthenticationService.selectKmRealnameAuthenticationList(realnameAuthentication);
        return getDataTable(list);
    }

    /**
     * 导出实名审核列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:export')")
    @Log(title = "实名审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RealnameAuthentication realnameAuthentication)
    {
        List<RealnameAuthentication> list = kmRealnameAuthenticationService.selectKmRealnameAuthenticationList(realnameAuthentication);
        ExcelUtil<RealnameAuthentication> util = new ExcelUtil<RealnameAuthentication>(RealnameAuthentication.class);
        util.exportExcel(response, list, "实名审核数据");
    }

    /**
     * 获取实名审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmRealnameAuthenticationService.selectKmRealnameAuthenticationById(id));
    }

    /**
     * 新增实名审核
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:add')")
    @Log(title = "实名审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RealnameAuthentication realnameAuthentication)
    {
        return toAjax(kmRealnameAuthenticationService.insertKmRealnameAuthentication(realnameAuthentication));
    }

    /**
     * 修改实名审核
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:edit')")
    @Log(title = "实名审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RealnameAuthentication realnameAuthentication)
    {
        return toAjax(kmRealnameAuthenticationService.updateKmRealnameAuthentication(realnameAuthentication));
    }

    /**
     * 删除实名审核
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:realname:remove')")
    @Log(title = "实名审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmRealnameAuthenticationService.deleteKmRealnameAuthenticationByIds(ids));
    }
}
