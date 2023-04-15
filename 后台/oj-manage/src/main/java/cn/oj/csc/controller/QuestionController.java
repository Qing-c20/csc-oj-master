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
import cn.oj.csc.domain.Question;
import cn.oj.csc.service.IQuestionService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 题目管理Controller
 * 
 * @author csc
 * @date 2023-04-13
 */
@RestController
@RequestMapping("/ojmanage/question")
public class QuestionController extends BaseController
{
    @Autowired
    private IQuestionService questionService;

    /**
     * 查询题目管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:list')")
    @GetMapping("/list")
    public TableDataInfo list(Question question)
    {
        startPage();
        List<Question> list = questionService.selectQuestionList(question);
        return getDataTable(list);
    }

    /**
     * 导出题目管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:export')")
    @Log(title = "题目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Question question)
    {
        List<Question> list = questionService.selectQuestionList(question);
        ExcelUtil<Question> util = new ExcelUtil<Question>(Question.class);
        util.exportExcel(response, list, "题目管理数据");
    }

    /**
     * 获取题目管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(questionService.selectQuestionById(id));
    }

    /**
     * 新增题目管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:add')")
    @Log(title = "题目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Question question)
    {
        return toAjax(questionService.insertQuestion(question));
    }

    /**
     * 修改题目管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:edit')")
    @Log(title = "题目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Question question)
    {
        return toAjax(questionService.updateQuestion(question));
    }

    /**
     * 删除题目管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:question:remove')")
    @Log(title = "题目管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(questionService.deleteQuestionByIds(ids));
    }
}
