<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="广告标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入广告标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="广告商名字" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入广告商名字"
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
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="链接地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入链接地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本号" prop="version">
        <el-input
          v-model="queryParams.version"
          placeholder="请输入版本号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签" prop="tag">
        <el-input
          v-model="queryParams.tag"
          placeholder="请输入标签"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评分" prop="rate">
        <el-input
          v-model="queryParams.rate"
          placeholder="请输入评分"
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
          v-hasPermi="['kmappmanage:ad:add']"
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
          v-hasPermi="['kmappmanage:ad:edit']"
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
          v-hasPermi="['kmappmanage:ad:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['kmappmanage:ad:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="adList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增ID" align="center" prop="id" />
      <el-table-column label="广告标题" align="center" prop="title" />
      <el-table-column label="广告图" align="center" prop="img" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.img" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="广告商名字" align="center" prop="username" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="链接地址" align="center" prop="address" />
      <el-table-column label="广告位状态" align="center" prop="status" />
      <el-table-column label="版本号" align="center" prop="version" />
      <el-table-column label="标签" align="center" prop="tag" />
      <el-table-column label="评分" align="center" prop="rate" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['kmappmanage:ad:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['kmappmanage:ad:remove']"
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

    <!-- 添加或修改广告管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="广告标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入广告标题" />
        </el-form-item>
        <el-form-item label="广告图">
          <image-upload v-model="form.img"/>
        </el-form-item>
        <el-form-item label="广告商名字" prop="username">
          <el-input v-model="form.username" placeholder="请输入广告商名字" />
        </el-form-item>
        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="链接地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入链接地址" />
        </el-form-item>
        <el-form-item label="版本号" prop="version">
          <el-input v-model="form.version" placeholder="请输入版本号" />
        </el-form-item>
        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签" />
        </el-form-item>
        <el-form-item label="评分" prop="rate">
          <el-rate v-model="form.rate"></el-rate>
        </el-form-item>
        <el-form-item label="广告内容">
          <editor v-model="form.content" :min-height="192"/>
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
import { listAd, getAd, delAd, addAd, updateAd } from "@/api/kmappmanage/ad";

export default {
  name: "Ad",
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
      // 广告管理表格数据
      adList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        img: null,
        username: null,
        createTime: null,
        endTime: null,
        address: null,
        status: null,
        version: null,
        tag: null,
        rate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "广告标题不能为空", trigger: "blur" }
        ],
        img: [
          { required: true, message: "广告图不能为空", trigger: "blur" }
        ],
        username: [
          { required: true, message: "广告商名字不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        endTime: [
          { required: true, message: "结束时间不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "广告位状态不能为空", trigger: "change" }
        ],
        version: [
          { required: true, message: "版本号不能为空", trigger: "blur" }
        ],
        tag: [
          { required: true, message: "标签不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询广告管理列表 */
    getList() {
      this.loading = true;
      listAd(this.queryParams).then(response => {
        this.adList = response.rows;
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
        title: null,
        img: null,
        username: null,
        createTime: null,
        endTime: null,
        address: null,
        status: null,
        version: null,
        tag: null,
        rate: null
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
      this.title = "添加广告管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAd(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改广告管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAd(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAd(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除广告管理编号为"' + ids + '"的数据项？').then(function() {
        return delAd(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('kmappmanage/ad/export', {
        ...this.queryParams
      }, `ad_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
