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
import cn.oj.csc.domain.UserIncome;
import cn.oj.csc.service.IKmUserIncomeService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 用户收入Controller
 * 
 * @author 甲粒子
 * @date 2022-08-02
 */
@RestController
@RequestMapping("/kmappmanage/income")
public class UserIncomeController extends BaseController
{
    @Autowired
    private IKmUserIncomeService kmUserIncomeService;

    /**
     * 查询用户收入列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserIncome userIncome)
    {
        startPage();
        List<UserIncome> list = kmUserIncomeService.selectKmUserIncomeList(userIncome);
        return getDataTable(list);
    }

    /**
     * 导出用户收入列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:export')")
    @Log(title = "用户收入", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserIncome userIncome)
    {
        List<UserIncome> list = kmUserIncomeService.selectKmUserIncomeList(userIncome);
        ExcelUtil<UserIncome> util = new ExcelUtil<UserIncome>(UserIncome.class);
        util.exportExcel(response, list, "用户收入数据");
    }

    /**
     * 获取用户收入详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmUserIncomeService.selectKmUserIncomeById(id));
    }

    /**
     * 新增用户收入
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:add')")
    @Log(title = "用户收入", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserIncome userIncome)
    {
        return toAjax(kmUserIncomeService.insertKmUserIncome(userIncome));
    }

    /**
     * 修改用户收入
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:edit')")
    @Log(title = "用户收入", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserIncome userIncome)
    {
        return toAjax(kmUserIncomeService.updateKmUserIncome(userIncome));
    }

    /**
     * 删除用户收入
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:income:remove')")
    @Log(title = "用户收入", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmUserIncomeService.deleteKmUserIncomeByIds(ids));
    }
}
