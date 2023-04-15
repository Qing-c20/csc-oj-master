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
      <el-form-item label="学号" prop="studentno">
        <el-input
          v-model="queryParams.studentno"
          placeholder="请输入学号"
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
      <el-form-item label="身份证号码" prop="cardId">
        <el-input
          v-model="queryParams.cardId"
          placeholder="请输入身份证号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="通过时间" prop="passTime">
        <el-date-picker clearable
          v-model="queryParams.passTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择通过时间">
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
          v-hasPermi="['kmappmanage:realname:edit']"
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
          v-hasPermi="['kmappmanage:realname:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:realname:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="realnameList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="学号" align="center" prop="studentno" :show-overflow-tooltip="true" />
      <el-table-column label="认证照片" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="实名" align="center" prop="realname" />
      <el-table-column label="身份证号码" align="center" prop="cardId" :show-overflow-tooltip="true" />
      <el-table-column label="审核状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" type="success">审核通过</el-tag>
          <el-tag v-if="scope.row.status === 0" type="warning">待审核</el-tag>
          <el-tag v-if="scope.row.status === 2" type="danger">审核失败</el-tag>
        </template>
      </el-table-column>  
      <el-table-column label="未通过原因" align="center" prop="rejectReason" :show-overflow-tooltip="true" />
      <el-table-column label="通过时间" align="center" prop="passTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.passTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:realname:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:realname:remove']"
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

    <!-- 添加或修改实名审核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="状态" prop="status">
           <el-select v-model="form.status" placeholder="请选择">
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
            </el-select>
        </el-form-item>


        <el-form-item label="未通过原因" prop="rejectReason">
          <el-input v-model="RejectReason" type="textarea" placeholder="请输入内容"  />
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
import { listRealname, getRealname, delRealname, addRealname, updateRealname } from "@/api/kmappmanage/realname";

export default {
  name: "Realname",
  data() {
    return {
      options: [{
          value: 0,
          label: '审核中'
        }, {
          value: 1,
          label: '审核通过'
        }, {
          value: 2,
          label: '审核失败'
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
      // 实名审核表格数据
      realnameList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        studentno: null,
        image: null,
        realname: null,
        cardId: null,
        status: null,
        rejectReason: null,
        passTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" }
        ],
        studentno: [
          { required: true, message: "学号不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "认证照片不能为空", trigger: "blur" }
        ],
        realname: [
          { required: true, message: "实名不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "审核状态不能为空", trigger: "change" }
        ],
        rejectReason: [
          { required: true, message: "未通过原因不能为空", trigger: "blur" }
        ],
        passTime: [
          { required: true, message: "通过时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  computed: {
    RejectReason: {
      get(){        
         return (this.form.rejectReason === null || this.form.rejectReason === '') ? "不合格" : this.form.rejectReason;
      },
      set(newValue){
        this.form.rejectReason = newValue
      }
    }
  },
  methods: {
    /** 查询实名审核列表 */
    getList() {
      this.loading = true;
      listRealname(this.queryParams).then(response => {
        this.realnameList = response.rows;
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
        studentno: null,
        image: null,
        realname: null,
        cardId: null,
        status: null,
        rejectReason: null,
        passTime: null
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
      this.title = "实名审核";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.$notify({
          title: '提示',
          message: '审核失败时请填写原因!',
          type: 'warning'
        });
      this.reset();
      const id = row.id || this.ids
      getRealname(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "实名审核";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRealname(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRealname(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除实名审核编号为"' + ids + '"的数据项？').then(function() {
        return delRealname(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/realname/export', {
        ...this.queryParams
      }, `realname_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
