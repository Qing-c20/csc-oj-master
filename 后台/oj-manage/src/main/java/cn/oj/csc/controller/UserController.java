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
import cn.oj.csc.domain.Users;
import cn.oj.csc.service.IKmUserService;
import cn.oj.common.utils.poi.ExcelUtil;
import cn.oj.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 * 
 * @author 翟彬州
 * @date 2022-07-02
 */
@RestController
@RequestMapping("/kmappmanage/usermanage")
public class UserController extends BaseController
{
    @Autowired
    private IKmUserService kmUserService;

    /**
     * 查询用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:list')")
    @GetMapping("/list")
    public TableDataInfo list(Users users)
    {
        startPage();
        List<Users> list = kmUserService.selectKmUserList(users);
        return getDataTable(list);
    }

    /**
     * 导出用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:export')")
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Users users)
    {
        List<Users> list = kmUserService.selectKmUserList(users);
        ExcelUtil<Users> util = new ExcelUtil<Users>(Users.class);
        util.exportExcel(response, list, "用户管理数据");
    }

    /**
     * 获取用户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(kmUserService.selectKmUserById(id));
    }

    /**
     * 新增用户管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Users users)
    {
        return toAjax(kmUserService.insertKmUser(users));
    }

    /**
     * 修改用户管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Users users)
    {
        return toAjax(kmUserService.updateKmUser(users));
    }

    /**
     * 删除用户管理
     */
    @PreAuthorize("@ss.hasPermi('kmappmanage:usermanage:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(kmUserService.deleteKmUserByIds(ids));
    }
}
