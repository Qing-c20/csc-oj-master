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
import cn.oj.csc.domain.Slogan;
import cn.oj.csc.service.IKmSloganService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 标语管理Controller
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
@RestController
@RequestMapping("/kmappmanage/slogan")
public class SloganController extends BaseController
{
    @Autowired
    private IKmSloganService kmSloganService;

    /**
     * 查询标语管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:list')")
    @GetMapping("/list")
    public TableDataInfo list(Slogan slogan)
    {
        startPage();
        List<Slogan> list = kmSloganService.selectKmSloganList(slogan);
        return getDataTable(list);
    }

    /**
     * 导出标语管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:export')")
    @Log(title = "标语管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Slogan slogan)
    {
        List<Slogan> list = kmSloganService.selectKmSloganList(slogan);
        ExcelUtil<Slogan> util = new ExcelUtil<Slogan>(Slogan.class);
        util.exportExcel(response, list, "标语管理数据");
    }

    /**
     * 获取标语管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmSloganService.selectKmSloganById(id));
    }

    /**
     * 新增标语管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:add')")
    @Log(title = "标语管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Slogan slogan)
    {
        return toAjax(kmSloganService.insertKmSlogan(slogan));
    }

    /**
     * 修改标语管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:edit')")
    @Log(title = "标语管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Slogan slogan)
    {
        return toAjax(kmSloganService.updateKmSlogan(slogan));
    }

    /**
     * 删除标语管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:slogan:remove')")
    @Log(title = "标语管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmSloganService.deleteKmSloganByIds(ids));
    }
}
