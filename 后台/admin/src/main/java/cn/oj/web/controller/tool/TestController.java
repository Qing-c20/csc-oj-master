package cn.oj.web.controller.tool;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.oj.common.core.domain.AjaxResult;
import cn.oj.csc.controller.CollectionsController;
import cn.oj.csc.domain.Answer;
import cn.oj.csc.domain.UserAnswer;
import cn.oj.csc.core.Task;
import cn.oj.csc.service.ICollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.oj.common.core.controller.BaseController;
import cn.oj.common.core.domain.R;
import cn.oj.common.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;

/**
 * swagger 用户测试方法
 * 
 * @author zbz
 */
@Api("用户信息管理")
@RestController
@RequestMapping("/test/user")
public class TestController extends BaseController
{
    @Autowired
    private ICollectionsService collectionsService;

    private final static Map<Integer, UserEntity> users = new LinkedHashMap<Integer, UserEntity>();
    {
        users.put(1, new UserEntity(1, "admin", "admin123", "15888888888"));
        users.put(2, new UserEntity(2, "ry", "admin123", "15666666666"));
    }

    @GetMapping("/123")
    public AjaxResult test1() throws IOException, InterruptedException {
        UserAnswer useranswer = new UserAnswer();
        useranswer.setQid(2L);
        useranswer.setCode(
              " import java.util.Scanner;\n" +
                      "class Solution {\n" +
                      "    public static void main(String[] args) {\n" +
                      "        // 读取二维数组\n" +
                      "        // 二维数组的列数：\n" +
                      "        Scanner scan=new Scanner(System.in);\n" +
                      "        int r=scan.nextInt();\n" +
                      "        int c=scan.nextInt();\n" +
                      "        int[][]matrix=new int[r][c];\n" +
                      "        scan.nextLine();//用来跳过行列后的回车符\n" +
                      "        for(int i=0;i<r;i++){\n" +
                      "            for(int j=0;j<c;j++){\n" +
                      "                matrix[i][j]=scan.nextInt();\n" +
                      "            }\n" +
                      "        }\n" +
                      "        int target = scan.nextInt();\n" +
                      "        System.out.println(searchArray(matrix, target));\n" +
                      "    }\n" +
                      "    public static boolean searchArray(int[][] array, int target) {\n" +
                      "\n" +
                      "        //判断矩阵为空的情况\n" +
                      "        if(array == null || array.length == 0 || array[0].length == 0){\n" +
                      "            return false;\n" +
                      "        }\n" +
                      "\n" +
                      "        //表示矩阵右上角的位置（突破口）i行j列\n" +
                      "        //右上角的同行左边小于等于它，同列下面大于等于它\n" +
                      "        int i=0,j=array[0].length-1;\n" +
                      "\n" +
                      "        while(i <= array.length -1 && j >= 0){\n" +
                      "            int x = array[i][j];\n" +
                      "            if(x == target){\n" +
                      "                return true;\n" +
                      "            }else if(x > target){\n" +
                      "                //列左移\n" +
                      "                j--;\n" +
                      "            }else{\n" +
                      "                //行下移\n" +
                      "                i++;\n" +
                      "            }\n" +
                      "        }\n" +
                      "        return false;\n" +
                      "    }\n" +
                      "}"
                      );


        Task task = new Task();
        Answer answer = task.compileAndRun(useranswer);
        System.out.println(answer);
        return AjaxResult.success("success");
    }
    @GetMapping("/collections")
    public AjaxResult test2(){
        Long user_id = 1L;
        System.out.println(collectionsService.selectCollectionsByUserId(user_id));
        return AjaxResult.success("success");
    }
    @ApiOperation("获取用户列表")
    @GetMapping("/list")
    public R<List<UserEntity>> userList()
    {
        List<UserEntity> userList = new ArrayList<UserEntity>(users.values());
        return R.ok(userList);
    }

    @ApiOperation("获取用户详细")
    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "int", paramType = "path", dataTypeClass = Integer.class)
    @GetMapping("/{userId}")
    public R<UserEntity> getUser(@PathVariable Integer userId)
    {
        if (!users.isEmpty() && users.containsKey(userId))
        {
            return R.ok(users.get(userId));
        }
        else
        {
            return R.fail("用户不存在");
        }
    }

    @ApiOperation("新增用户")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "userId", value = "用户id", dataType = "Integer", dataTypeClass = Integer.class),
        @ApiImplicitParam(name = "username", value = "用户名称", dataType = "String", dataTypeClass = String.class),
        @ApiImplicitParam(name = "password", value = "用户密码", dataType = "String", dataTypeClass = String.class),
        @ApiImplicitParam(name = "mobile", value = "用户手机", dataType = "String", dataTypeClass = String.class)
    })
    @PostMapping("/save")
    public R<String> save(UserEntity user)
    {
        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId()))
        {
            return R.fail("用户ID不能为空");
        }
        users.put(user.getUserId(), user);
        return R.ok();
    }

    @ApiOperation("更新用户")
    @PutMapping("/update")
    public R<String> update(@RequestBody UserEntity user)
    {
        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId()))
        {
            return R.fail("用户ID不能为空");
        }
        if (users.isEmpty() || !users.containsKey(user.getUserId()))
        {
            return R.fail("用户不存在");
        }
        users.remove(user.getUserId());
        users.put(user.getUserId(), user);
        return R.ok();
    }

    @ApiOperation("删除用户信息")
    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "int", paramType = "path", dataTypeClass = Integer.class)
    @DeleteMapping("/{userId}")
    public R<String> delete(@PathVariable Integer userId)
    {
        if (!users.isEmpty() && users.containsKey(userId))
        {
            users.remove(userId);
            return R.ok();
        }
        else
        {
            return R.fail("用户不存在");
        }
    }
}

@ApiModel(value = "UserEntity", description = "用户实体")
class UserEntity
{
    @ApiModelProperty("用户ID")
    private Integer userId;

    @ApiModelProperty("用户名称")
    private String username;

    @ApiModelProperty("用户密码")
    private String password;

    @ApiModelProperty("用户手机")
    private String mobile;

    public UserEntity()
    {

    }

    public UserEntity(Integer userId, String username, String password, String mobile)
    {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.mobile = mobile;
    }

    public Integer getUserId()
    {
        return userId;
    }

    public void setUserId(Integer userId)
    {
        this.userId = userId;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getMobile()
    {
        return mobile;
    }

    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }
}
