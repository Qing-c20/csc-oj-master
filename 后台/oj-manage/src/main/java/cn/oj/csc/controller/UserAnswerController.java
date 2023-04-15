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
import cn.oj.csc.domain.UserAnswer;
import cn.oj.csc.service.IUserAnswerService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 用户答题管理Controller
 * 
 * @author csc
 * @date 2023-03-30
 */
@RestController
@RequestMapping("/ojmanage/answer")
public class UserAnswerController extends BaseController
{
    @Autowired
    private IUserAnswerService userAnswerService;

    /**
     * 查询用户答题管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserAnswer userAnswer)
    {
        startPage();
        List<UserAnswer> list = userAnswerService.selectUserAnswerList(userAnswer);
        return getDataTable(list);
    }

    /**
     * 导出用户答题管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:export')")
    @Log(title = "用户答题管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserAnswer userAnswer)
    {
        List<UserAnswer> list = userAnswerService.selectUserAnswerList(userAnswer);
        ExcelUtil<UserAnswer> util = new ExcelUtil<UserAnswer>(UserAnswer.class);
        util.exportExcel(response, list, "用户答题管理数据");
    }

    /**
     * 获取用户答题管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(userAnswerService.selectUserAnswerById(id));
    }

    /**
     * 新增用户答题管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:add')")
    @Log(title = "用户答题管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserAnswer userAnswer)
    {
        return toAjax(userAnswerService.insertUserAnswer(userAnswer));
    }

    /**
     * 修改用户答题管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:edit')")
    @Log(title = "用户答题管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserAnswer userAnswer)
    {
        return toAjax(userAnswerService.updateUserAnswer(userAnswer));
    }

    /**
     * 删除用户答题管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:answer:remove')")
    @Log(title = "用户答题管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userAnswerService.deleteUserAnswerByIds(ids));
    }
}
