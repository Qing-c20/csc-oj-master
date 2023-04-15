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
import cn.oj.csc.domain.Reply;
import cn.oj.csc.service.IReplyService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 评论回复管理Controller
 * 
 * @author csc
 * @date 2023-04-12
 */
@RestController
@RequestMapping("/ojmanage/reply")
public class ReplyController extends BaseController
{
    @Autowired
    private IReplyService replyService;

    /**
     * 查询评论回复管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:list')")
    @GetMapping("/list")
    public TableDataInfo list(Reply reply)
    {
        startPage();
        List<Reply> list = replyService.selectReplyList(reply);
        return getDataTable(list);
    }

    /**
     * 导出评论回复管理列表
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:export')")
    @Log(title = "评论回复管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Reply reply)
    {
        List<Reply> list = replyService.selectReplyList(reply);
        ExcelUtil<Reply> util = new ExcelUtil<Reply>(Reply.class);
        util.exportExcel(response, list, "评论回复管理数据");
    }

    /**
     * 获取评论回复管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:query')")
    @GetMapping(value = "/{replyId}")
    public AjaxResult getInfo(@PathVariable("replyId") Long replyId)
    {
        return AjaxResult.success(replyService.selectReplyByReplyId(replyId));
    }

    /**
     * 新增评论回复管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:add')")
    @Log(title = "评论回复管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Reply reply)
    {
        return toAjax(replyService.insertReply(reply));
    }

    /**
     * 修改评论回复管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:edit')")
    @Log(title = "评论回复管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Reply reply)
    {
        return toAjax(replyService.updateReply(reply));
    }

    /**
     * 删除评论回复管理
     */
    @PreAuthorize("@ss.hasPermi('ojmanage:reply:remove')")
    @Log(title = "评论回复管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{replyIds}")
    public AjaxResult remove(@PathVariable Long[] replyIds)
    {
        return toAjax(replyService.deleteReplyByReplyIds(replyIds));
    }
}
