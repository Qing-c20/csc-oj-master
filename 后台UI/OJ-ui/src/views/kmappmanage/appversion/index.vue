<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="应用名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入应用名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本号 eg:1.0.1" prop="version">
        <el-input
          v-model="queryParams.version"
          placeholder="请输入版本号 eg:1.0.1"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本说明" prop="comment">
        <el-input
          v-model="queryParams.comment"
          placeholder="请输入版本说明"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传人姓名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入上传人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['kmappmanage:appversion:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['kmappmanage:appversion:edit']"
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
          v-hasPermi="['kmappmanage:appversion:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:appversion:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="appversionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="应用名称" align="center" prop="name" />
      <el-table-column label="上一个版本" align="center" prop="preVersion" />
      <el-table-column label="版本号 eg:1.0.1" align="center" prop="version" />
      <el-table-column label="是否有新版本 1-有 0-木有" align="center" prop="isUpdated" />
      <el-table-column label="版本说明" align="center" prop="comment" />
      <el-table-column label="包下载地址" align="center" prop="downUrl" />
      <el-table-column label="上传人姓名" align="center" prop="username" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:appversion:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:appversion:remove']"
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

    <!-- 添加或修改应用版本对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="应用名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入应用名称" />
        </el-form-item>
        <el-form-item label="版本号 eg:1.0.1" prop="version">
          <el-input v-model="form.version" placeholder="请输入版本号 eg:1.0.1" />
        </el-form-item>
        <el-form-item label="版本说明" prop="comment">
          <el-input v-model="form.comment" placeholder="请输入版本说明" />
        </el-form-item>
        <el-form-item label="包下载地址">
          <file-upload v-model="form.downUrl"/>
        </el-form-item>
        <el-form-item label="上传人姓名" prop="username">
          <el-input v-model="form.username" placeholder="请输入上传人姓名" />
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
import { listAppversion, getAppversion, delAppversion, addAppversion, updateAppversion } from "@/api/kmappmanage/appversion";

export default {
  name: "Appversion",
  data() {
    return {
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
      // 应用版本表格数据
      appversionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        preVersion: null,
        version: null,
        isUpdated: null,
        comment: null,
        downUrl: null,
        username: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "应用名称不能为空", trigger: "blur" }
        ],
        version: [
          { required: true, message: "版本号 eg:1.0.1不能为空", trigger: "blur" }
        ],
        isUpdated: [
          { required: true, message: "是否有新版本 1-有 0-木有不能为空", trigger: "change" }
        ],
        comment: [
          { required: true, message: "版本说明不能为空", trigger: "blur" }
        ],
        downUrl: [
          { required: true, message: "包下载地址不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询应用版本列表 */
    getList() {
      this.loading = true;
      listAppversion(this.queryParams).then(response => {
        this.appversionList = response.rows;
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
        name: null,
        preVersion: null,
        version: null,
        isUpdated: null,
        comment: null,
        downUrl: null,
        createTime: null,
        username: null
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
      this.title = "添加应用版本";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAppversion(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改应用版本";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAppversion(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAppversion(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除应用版本编号为"' + ids + '"的数据项？').then(function() {
        return delAppversion(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/appversion/export', {
        ...this.queryParams
      }, `appversion_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
