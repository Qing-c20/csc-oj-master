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
import cn.oj.csc.domain.Dict;
import cn.oj.csc.service.IKmDictService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 字典管理Controller
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
@RestController
@RequestMapping("/kmappmanage/dict")
public class DictController extends BaseController
{
    @Autowired
    private IKmDictService kmDictService;

    /**
     * 查询字典管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:list')")
    @GetMapping("/list")
    public TableDataInfo list(Dict dict)
    {
        startPage();
        List<Dict> list = kmDictService.selectKmDictList(dict);
        return getDataTable(list);
    }

    /**
     * 导出字典管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:export')")
    @Log(title = "字典管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Dict dict)
    {
        List<Dict> list = kmDictService.selectKmDictList(dict);
        ExcelUtil<Dict> util = new ExcelUtil<Dict>(Dict.class);
        util.exportExcel(response, list, "字典管理数据");
    }

    /**
     * 获取字典管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmDictService.selectKmDictById(id));
    }

    /**
     * 新增字典管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:add')")
    @Log(title = "字典管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Dict dict)
    {
        return toAjax(kmDictService.insertKmDict(dict));
    }

    /**
     * 修改字典管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:edit')")
    @Log(title = "字典管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Dict dict)
    {
        return toAjax(kmDictService.updateKmDict(dict));
    }

    /**
     * 删除字典管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:dict:remove')")
    @Log(title = "字典管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmDictService.deleteKmDictByIds(ids));
    }
}
