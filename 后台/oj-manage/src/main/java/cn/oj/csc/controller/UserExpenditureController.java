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
import cn.oj.csc.domain.UserExpenditure;
import cn.oj.csc.service.IKmUserExpenditureService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 用户支出Controller
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
@RestController
@RequestMapping("/kmappmanage/expenditure")
public class UserExpenditureController extends BaseController
{
    @Autowired
    private IKmUserExpenditureService kmUserExpenditureService;

    /**
     * 查询用户支出列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserExpenditure userExpenditure)
    {
        startPage();
        List<UserExpenditure> list = kmUserExpenditureService.selectKmUserExpenditureList(userExpenditure);
        return getDataTable(list);
    }

    /**
     * 导出用户支出列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:export')")
    @Log(title = "用户支出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserExpenditure userExpenditure)
    {
        List<UserExpenditure> list = kmUserExpenditureService.selectKmUserExpenditureList(userExpenditure);
        ExcelUtil<UserExpenditure> util = new ExcelUtil<UserExpenditure>(UserExpenditure.class);
        util.exportExcel(response, list, "用户支出数据");
    }

    /**
     * 获取用户支出详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmUserExpenditureService.selectKmUserExpenditureById(id));
    }

    /**
     * 新增用户支出
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:add')")
    @Log(title = "用户支出", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserExpenditure userExpenditure)
    {
        return toAjax(kmUserExpenditureService.insertKmUserExpenditure(userExpenditure));
    }

    /**
     * 修改用户支出
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:edit')")
    @Log(title = "用户支出", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserExpenditure userExpenditure)
    {
        return toAjax(kmUserExpenditureService.updateKmUserExpenditure(userExpenditure));
    }

    /**
     * 删除用户支出
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:expenditure:remove')")
    @Log(title = "用户支出", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmUserExpenditureService.deleteKmUserExpenditureByIds(ids));
    }
}
