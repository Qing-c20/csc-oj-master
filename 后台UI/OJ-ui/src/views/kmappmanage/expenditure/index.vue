<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户Id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户Id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支出金额" prop="amount">
        <el-input
          v-model="queryParams.amount"
          placeholder="请输入支出金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="说明" prop="comment">
        <el-input
          v-model="queryParams.comment"
          placeholder="请输入说明"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="金额显示颜色" prop="color">
        <el-input
          v-model="queryParams.color"
          placeholder="请输入金额显示颜色"
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
          v-hasPermi="['kmappmanage:expenditure:add']"
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
          v-hasPermi="['kmappmanage:expenditure:edit']"
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
          v-hasPermi="['kmappmanage:expenditure:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:expenditure:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="expenditureList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="用户Id" align="center" prop="userId" />
      <el-table-column label="支出金额" align="center" prop="amount" />
      <el-table-column label="说明" align="center" prop="comment" />
      <el-table-column label="金额显示颜色" align="center" prop="color" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:expenditure:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:expenditure:remove']"
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

    <!-- 添加或修改用户支出对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户Id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户Id" />
        </el-form-item>
        <el-form-item label="支出金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入支出金额" />
        </el-form-item>
        <el-form-item label="说明" prop="comment">
          <el-input v-model="form.comment" placeholder="请输入说明" />
        </el-form-item>
        <el-form-item label="金额显示颜色" prop="color">
          <el-input v-model="form.color" placeholder="请输入金额显示颜色" />
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
import { listExpenditure, getExpenditure, delExpenditure, addExpenditure, updateExpenditure } from "@/api/kmappmanage/expenditure";

export default {
  name: "Expenditure",
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
      // 用户支出表格数据
      expenditureList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        amount: null,
        comment: null,
        color: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户Id不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "支出金额不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户支出列表 */
    getList() {
      this.loading = true;
      listExpenditure(this.queryParams).then(response => {
        this.expenditureList = response.rows;
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
        amount: null,
        comment: null,
        createTime: null,
        color: null
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
      this.title = "添加用户支出";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getExpenditure(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户支出";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateExpenditure(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addExpenditure(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除用户支出编号为"' + ids + '"的数据项？').then(function() {
        return delExpenditure(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/expenditure/export', {
        ...this.queryParams
      }, `expenditure_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
