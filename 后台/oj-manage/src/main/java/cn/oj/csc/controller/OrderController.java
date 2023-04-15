package cn.oj.csc.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.oj.csc.domain.Orders;
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
import cn.oj.csc.service.IKmOrderService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 应用订单Controller
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
@RestController
@RequestMapping("/kmappmanage/order")
public class OrderController extends BaseController
{
    @Autowired
    private IKmOrderService kmOrderService;

    /**
     * 查询应用订单列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(Orders orders)
    {
        startPage();
        List<Orders> list = kmOrderService.selectKmOrderList(orders);
        return getDataTable(list);
    }

    /**
     * 导出应用订单列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:export')")
    @Log(title = "应用订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orders orders)
    {
        List<Orders> list = kmOrderService.selectKmOrderList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "应用订单数据");
    }

    /**
     * 获取应用订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmOrderService.selectKmOrderById(id));
    }

    /**
     * 新增应用订单
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:add')")
    @Log(title = "应用订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orders orders)
    {
        return toAjax(kmOrderService.insertKmOrder(orders));
    }

    /**
     * 修改应用订单
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:edit')")
    @Log(title = "应用订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orders orders)
    {
        return toAjax(kmOrderService.updateKmOrder(orders));
    }

    /**
     * 删除应用订单
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:order:remove')")
    @Log(title = "应用订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmOrderService.deleteKmOrderByIds(ids));
    }
}
