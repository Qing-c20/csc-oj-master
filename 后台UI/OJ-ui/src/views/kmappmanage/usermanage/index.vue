<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入手机号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="平台认证" prop="authentication">
        <el-input
          v-model="queryParams.authentication"
          placeholder="请输入平台认证"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="实名" prop="realname">
        <el-input
          v-model="queryParams.realname"
          placeholder="请输入实名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="余额" prop="balance">
        <el-input
          v-model="queryParams.balance"
          placeholder="请输入余额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邀请人数" prop="invitationCount">
        <el-input
          v-model="queryParams.invitationCount"
          placeholder="请输入邀请人数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邀请人ID" prop="invitationUserId">
        <el-input
          v-model="queryParams.invitationUserId"
          placeholder="请输入邀请人userId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学号" prop="studentno">
        <el-input
          v-model="queryParams.studentno"
          placeholder="请输入学号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker clearable
          v-model="queryParams.createTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="封禁时间" prop="banTime">
        <el-date-picker clearable
          v-model="queryParams.banTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择封禁时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['kmappmanage:usermanage:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['kmappmanage:usermanage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:usermanage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="usermanageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增主键" align="center" prop="id" />
      <el-table-column label="用户ID" align="center" prop="userId" :show-overflow-tooltip="true" />
      <el-table-column label="邮箱" align="center" prop="email" :show-overflow-tooltip="true" />
      <el-table-column label="手机号码" align="center" prop="phone" :show-overflow-tooltip="true" />
      <el-table-column label="性别" align="center" prop="gender"  >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.gender === 1">男</el-tag>
          <el-tag v-if="scope.row.gender === 0" type="info">未知</el-tag>
          <el-tag v-if="scope.row.gender === 2" type="warning">女</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="账号状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" type="success">正常</el-tag>
          <el-tag v-if="scope.row.status === 0" type="danger">禁用</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="头像" align="center" prop="avatar" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.avatar" :width="50" :height="50"/>
        </template>
      </el-table-column>

      <el-table-column label="昵称" align="center" prop="nickname" :show-overflow-tooltip="true" />
      <el-table-column label="签名" align="center" prop="autograph" :show-overflow-tooltip="true" />
      <el-table-column label="平台认证" align="center" prop="authentication" :show-overflow-tooltip="true" />
      <el-table-column label="实名" align="center" prop="realname" />
      <el-table-column label="余额" align="center" prop="balance" :show-overflow-tooltip="true" />
      <el-table-column label="邀请人数" align="center" prop="invitationCount" :show-overflow-tooltip="true" />
      <el-table-column label="邀请人ID" align="center" prop="invitationUserId" :show-overflow-tooltip="true" />
      <el-table-column label="学号" align="center" prop="studentno" :show-overflow-tooltip="true" />
      <el-table-column label="地址" align="center" prop="address" :show-overflow-tooltip="true" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180" :show-overflow-tooltip="true" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="封禁时间" align="center" prop="banTime" width="180" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.banTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:usermanage:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:usermanage:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="头像">
          <image-upload v-model="form.avatar"/>
        </el-form-item>
        <el-form-item label="状态">
           <el-select v-model="form.status" placeholder="请选择">
              <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
           </el-select>
        </el-form-item>
        <el-form-item label="昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入昵称" />
        </el-form-item>
        <el-form-item label="签名" prop="autograph">
          <el-input v-model="form.autograph" placeholder="请输入签名" />
        </el-form-item>
        <el-form-item label="平台认证" prop="authentication">
          <el-input v-model="form.authentication" placeholder="请输入平台认证" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listUsermanage, getUsermanage, delUsermanage, addUsermanage, updateUsermanage } from "@/api/kmappmanage/usermanage";

export default {
  name: "Usermanage",
  data() {
    return {
      options: [{
          value: 0,
          label: '禁用'
        }, {
          value: 1,
          label: '正常'
        }, {
          value: 2,
          label: '其他'
        }],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户管理表格数据
      usermanageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        email: null,
        phone: null,
        gender: null,
        status: null,
        authentication: null,
        realname: null,
        balance: null,
        invitationCount: null,
        invitationUserId: null,
        studentno: null,
        address: null,
        createTime: null,
        banTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户管理列表 */
    getList() {
      this.loading = true;
      listUsermanage(this.queryParams).then(response => {
        this.usermanageList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        email: null,
        phone: null,
        gender: null,
        status: null,
        avatar: null,
        nickname: null,
        password: null,
        payPassword: null,
        autograph: null,
        authentication: null,
        realname: null,
        balance: null,
        invitationCount: null,
        invitationUserId: null,
        studentno: null,
        address: null,
        createTime: null,
        banTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getUsermanage(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateUsermanage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addUsermanage(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除用户管理编号为"' + ids + '"的数据项？').then(function() {
        return delUsermanage(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/usermanage/export', {
        ...this.queryParams
      }, `usermanage_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
