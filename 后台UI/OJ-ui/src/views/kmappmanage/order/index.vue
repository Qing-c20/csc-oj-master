<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付金额" prop="payment">
        <el-input
          v-model="queryParams.payment"
          placeholder="请输入支付金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="颜色 0-橙色 1-绿色 -2红色 4-蓝色" prop="statusColor">
        <el-input
          v-model="queryParams.statusColor"
          placeholder="请输入颜色 0-橙色 1-绿色 -2红色 4-蓝色"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-input
          v-model="queryParams.createTime"
          placeholder="请输入创建时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付时间" prop="payTime">
        <el-input
          v-model="queryParams.payTime"
          placeholder="请输入支付时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="交易关闭时间" prop="closeTime">
        <el-input
          v-model="queryParams.closeTime"
          placeholder="请输入交易关闭时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="交易完成时间" prop="endTime">
        <el-input
          v-model="queryParams.endTime"
          placeholder="请输入交易完成时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付宝subject" prop="subject">
        <el-input
          v-model="queryParams.subject"
          placeholder="请输入支付宝subject"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付宝body" prop="body">
        <el-input
          v-model="queryParams.body"
          placeholder="请输入支付宝body"
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
          v-hasPermi="['kmappmanage:order:add']"
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
          v-hasPermi="['kmappmanage:order:edit']"
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
          v-hasPermi="['kmappmanage:order:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="订单号" align="center" prop="orderNo" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="支付金额" align="center" prop="payment" />
      <el-table-column label="支付类型 0-无 1-平台 2-支付宝" align="center" prop="paymentType" />
      <el-table-column label="支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭" align="center" prop="status" />
      <el-table-column label="颜色 0-橙色 1-绿色 -2红色 4-蓝色" align="center" prop="statusColor" />
      <el-table-column label="创建时间" align="center" prop="createTime" />
      <el-table-column label="支付时间" align="center" prop="payTime" />
      <el-table-column label="交易关闭时间" align="center" prop="closeTime" />
      <el-table-column label="交易完成时间" align="center" prop="endTime" />
      <el-table-column label="支付宝subject" align="center" prop="subject" />
      <el-table-column label="支付宝body" align="center" prop="body" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:order:remove']"
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

    <!-- 添加或修改应用订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单号" prop="orderNo">
          <el-input v-model="form.orderNo" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="支付金额" prop="payment">
          <el-input v-model="form.payment" placeholder="请输入支付金额" />
        </el-form-item>
        <el-form-item label="颜色 0-橙色 1-绿色 -2红色 4-蓝色" prop="statusColor">
          <el-input v-model="form.statusColor" placeholder="请输入颜色 0-橙色 1-绿色 -2红色 4-蓝色" />
        </el-form-item>
        <el-form-item label="支付时间" prop="payTime">
          <el-input v-model="form.payTime" placeholder="请输入支付时间" />
        </el-form-item>
        <el-form-item label="交易关闭时间" prop="closeTime">
          <el-input v-model="form.closeTime" placeholder="请输入交易关闭时间" />
        </el-form-item>
        <el-form-item label="交易完成时间" prop="endTime">
          <el-input v-model="form.endTime" placeholder="请输入交易完成时间" />
        </el-form-item>
        <el-form-item label="支付宝subject" prop="subject">
          <el-input v-model="form.subject" placeholder="请输入支付宝subject" />
        </el-form-item>
        <el-form-item label="支付宝body" prop="body">
          <el-input v-model="form.body" placeholder="请输入支付宝body" />
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
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/kmappmanage/order";

export default {
  name: "Order",
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
      // 应用订单表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNo: null,
        userId: null,
        payment: null,
        paymentType: null,
        status: null,
        statusColor: null,
        createTime: null,
        payTime: null,
        closeTime: null,
        endTime: null,
        subject: null,
        body: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        orderNo: [
          { required: true, message: "订单号不能为空", trigger: "blur" }
        ],
        userId: [
          { required: true, message: "用户id不能为空", trigger: "blur" }
        ],
        payment: [
          { required: true, message: "支付金额不能为空", trigger: "blur" }
        ],
        paymentType: [
          { required: true, message: "支付类型 0-无 1-平台 2-支付宝不能为空", trigger: "change" }
        ],
        status: [
          { required: true, message: "支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭不能为空", trigger: "change" }
        ],
        statusColor: [
          { required: true, message: "颜色 0-橙色 1-绿色 -2红色 4-蓝色不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询应用订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        orderNo: null,
        userId: null,
        payment: null,
        paymentType: null,
        status: null,
        statusColor: null,
        createTime: null,
        payTime: null,
        closeTime: null,
        endTime: null,
        subject: null,
        body: null
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
      this.title = "添加应用订单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改应用订单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除应用订单编号为"' + ids + '"的数据项？').then(function() {
        return delOrder(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
