package cn.oj.web.controller.tool;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.oj.common.core.controller.BaseController;

/**
 * swagger 接口
 * 
 * @author zbz
 */
@Controller
@RequestMapping("/tool/swagger")
public class SwaggerController extends BaseController
{
    @PreAuthorize("@ss.hasPermi('tool:swagger:view')")
    @GetMapping()
    public String index()
    {
        return redirect("/swagger-ui.html");
    }
}
