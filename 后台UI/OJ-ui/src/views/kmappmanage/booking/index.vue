<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="预定号" prop="bookingNo">
        <el-input
          v-model="queryParams.bookingNo"
          placeholder="请输入预定号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接单枪手ID" prop="gunmanId">
        <el-input
          v-model="queryParams.gunmanId"
          placeholder="请输入接单枪手ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户ID-预约请求者" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID-预约请求者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开始预约的时间" prop="bookingTime">
        <el-date-picker clearable
          v-model="queryParams.bookingTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择开始预约的时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="状态前端颜色 0-橙色 1-绿色 2-红色 3-其他" prop="statusColor">
        <el-input
          v-model="queryParams.statusColor"
          placeholder="请输入状态前端颜色 0-橙色 1-绿色 2-红色 3-其他"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约费用" prop="cost">
        <el-input
          v-model="queryParams.cost"
          placeholder="请输入预约费用"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目名" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="请输入项目名"
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
          v-hasPermi="['kmappmanage:booking:add']"
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
          v-hasPermi="['kmappmanage:booking:edit']"
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
          v-hasPermi="['kmappmanage:booking:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:booking:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bookingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="预定号" align="center" prop="bookingNo" />
      <el-table-column label="接单枪手ID" align="center" prop="gunmanId" />
      <el-table-column label="用户ID-预约请求者" align="center" prop="userId" />
      <el-table-column label="开始预约的时间" align="center" prop="bookingTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bookingTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约状态 0-已预约 1-已开始 2-已完成 3-超时完成 4-未完成 5-拒绝接单 6-接单 " align="center" prop="status" />
      <el-table-column label="状态前端颜色 0-橙色 1-绿色 2-红色 3-其他" align="center" prop="statusColor" />
      <el-table-column label="预约费用" align="center" prop="cost" />
      <el-table-column label="项目简介" align="center" prop="projectIntroduction" />
      <el-table-column label="项目名" align="center" prop="projectName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:booking:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:booking:remove']"
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

    <!-- 添加或修改枪手预定对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="预定号" prop="bookingNo">
          <el-input v-model="form.bookingNo" placeholder="请输入预定号" />
        </el-form-item>
        <el-form-item label="接单枪手ID" prop="gunmanId">
          <el-input v-model="form.gunmanId" placeholder="请输入接单枪手ID" />
        </el-form-item>
        <el-form-item label="用户ID-预约请求者" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户ID-预约请求者" />
        </el-form-item>
        <el-form-item label="开始预约的时间" prop="bookingTime">
          <el-date-picker clearable
            v-model="form.bookingTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择开始预约的时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="状态前端颜色 0-橙色 1-绿色 2-红色 3-其他" prop="statusColor">
          <el-input v-model="form.statusColor" placeholder="请输入状态前端颜色 0-橙色 1-绿色 2-红色 3-其他" />
        </el-form-item>
        <el-form-item label="预约费用" prop="cost">
          <el-input v-model="form.cost" placeholder="请输入预约费用" />
        </el-form-item>
        <el-form-item label="项目简介" prop="projectIntroduction">
          <el-input v-model="form.projectIntroduction" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="项目名" prop="projectName">
          <el-input v-model="form.projectName" placeholder="请输入项目名" />
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
import { listBooking, getBooking, delBooking, addBooking, updateBooking } from "@/api/kmappmanage/booking";

export default {
  name: "Booking",
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
      // 枪手预定表格数据
      bookingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bookingNo: null,
        gunmanId: null,
        userId: null,
        bookingTime: null,
        endTime: null,
        status: null,
        statusColor: null,
        cost: null,
        projectIntroduction: null,
        projectName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        bookingNo: [
          { required: true, message: "预定号不能为空", trigger: "blur" }
        ],
        gunmanId: [
          { required: true, message: "接单枪手ID不能为空", trigger: "blur" }
        ],
        userId: [
          { required: true, message: "用户ID-预约请求者不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "预约状态 0-已预约 1-已开始 2-已完成 3-超时完成 4-未完成 5-拒绝接单 6-接单 不能为空", trigger: "change" }
        ],
        statusColor: [
          { required: true, message: "状态前端颜色 0-橙色 1-绿色 2-红色 3-其他不能为空", trigger: "blur" }
        ],
        cost: [
          { required: true, message: "预约费用不能为空", trigger: "blur" }
        ],
        projectIntroduction: [
          { required: true, message: "项目简介不能为空", trigger: "blur" }
        ],
        projectName: [
          { required: true, message: "项目名不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询枪手预定列表 */
    getList() {
      this.loading = true;
      listBooking(this.queryParams).then(response => {
        this.bookingList = response.rows;
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
        bookingNo: null,
        gunmanId: null,
        userId: null,
        bookingTime: null,
        endTime: null,
        status: null,
        statusColor: null,
        cost: null,
        projectIntroduction: null,
        projectName: null
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
      this.title = "添加枪手预定";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getBooking(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改枪手预定";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBooking(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBooking(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除枪手预定编号为"' + ids + '"的数据项？').then(function() {
        return delBooking(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/booking/export', {
        ...this.queryParams
      }, `booking_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
