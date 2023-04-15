<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="输入格式" prop="inputFormat">
        <el-input
          v-model="queryParams.inputFormat"
          placeholder="请输入输入格式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="输出格式" prop="outputFormat">
        <el-input
          v-model="queryParams.outputFormat"
          placeholder="请输入输出格式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数据范围" prop="dataField">
        <el-input
          v-model="queryParams.dataField"
          placeholder="请输入数据范围"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="样例输入" prop="sampleInput">
        <el-input
          v-model="queryParams.sampleInput"
          placeholder="请输入样例输入"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="样例输出" prop="sampleOutput">
        <el-input
          v-model="queryParams.sampleOutput"
          placeholder="请输入样例输出"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="修改时间" prop="modificationTime">
        <el-date-picker clearable
          v-model="queryParams.modificationTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择修改时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="难度" prop="difficulty">
        <el-input
          v-model="queryParams.difficulty"
          placeholder="请输入难度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="时空限制" prop="limitation">
        <el-input
          v-model="queryParams.limitation"
          placeholder="请输入时空限制"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总通过数" prop="passSum">
        <el-input
          v-model="queryParams.passSum"
          placeholder="请输入总通过数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总尝试数" prop="trySum">
        <el-input
          v-model="queryParams.trySum"
          placeholder="请输入总尝试数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="来源" prop="source">
        <el-input
          v-model="queryParams.source"
          placeholder="请输入来源"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签" prop="label">
        <el-input
          v-model="queryParams.label"
          placeholder="请输入标签"
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
          v-hasPermi="['ojmanage:question:add']"
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
          v-hasPermi="['ojmanage:question:edit']"
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
          v-hasPermi="['ojmanage:question:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ojmanage:question:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="questionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="题目内容" align="center" prop="topic" />
      <el-table-column label="输入格式" align="center" prop="inputFormat" />
      <el-table-column label="输出格式" align="center" prop="outputFormat" />
      <el-table-column label="数据范围" align="center" prop="dataField" />
      <el-table-column label="样例输入" align="center" prop="sampleInput" />
      <el-table-column label="样例输出" align="center" prop="sampleOutput" />
      <el-table-column label="标准输入-用于检验用户提交的代码" align="center" prop="standardInput" />
      <el-table-column label="标准输出-用于检验用户提交的代码" align="center" prop="standardOutput" />
      <el-table-column label="修改时间" align="center" prop="modificationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.modificationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="难度" align="center" prop="difficulty" />
      <el-table-column label="时空限制" align="center" prop="limitation" />
      <el-table-column label="总通过数" align="center" prop="passSum" />
      <el-table-column label="总尝试数" align="center" prop="trySum" />
      <el-table-column label="来源" align="center" prop="source" />
      <el-table-column label="标签" align="center" prop="label" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ojmanage:question:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ojmanage:question:remove']"
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

    <!-- 添加或修改题目管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="题目内容" prop="topic">
          <el-input v-model="form.topic" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="输入格式" prop="inputFormat">
          <el-input v-model="form.inputFormat" placeholder="请输入输入格式" />
        </el-form-item>
        <el-form-item label="输出格式" prop="outputFormat">
          <el-input v-model="form.outputFormat" placeholder="请输入输出格式" />
        </el-form-item>
        <el-form-item label="数据范围" prop="dataField">
          <el-input v-model="form.dataField" placeholder="请输入数据范围" />
        </el-form-item>
        <el-form-item label="样例输入" prop="sampleInput">
          <el-input v-model="form.sampleInput" placeholder="请输入样例输入" />
        </el-form-item>
        <el-form-item label="样例输出" prop="sampleOutput">
          <el-input v-model="form.sampleOutput" placeholder="请输入样例输出" />
        </el-form-item>
        <el-form-item label="标准输入-用于检验用户提交的代码" prop="standardInput">
          <el-input v-model="form.standardInput" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="标准输出-用于检验用户提交的代码" prop="standardOutput">
          <el-input v-model="form.standardOutput" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="修改时间" prop="modificationTime">
          <el-date-picker clearable
            v-model="form.modificationTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择修改时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="难度" prop="difficulty">
          <el-input v-model="form.difficulty" placeholder="请输入难度" />
        </el-form-item>
        <el-form-item label="时空限制" prop="limitation">
          <el-input v-model="form.limitation" placeholder="请输入时空限制" />
        </el-form-item>
        <el-form-item label="总通过数" prop="passSum">
          <el-input v-model="form.passSum" placeholder="请输入总通过数" />
        </el-form-item>
        <el-form-item label="总尝试数" prop="trySum">
          <el-input v-model="form.trySum" placeholder="请输入总尝试数" />
        </el-form-item>
        <el-form-item label="来源" prop="source">
          <el-input v-model="form.source" placeholder="请输入来源" />
        </el-form-item>
        <el-form-item label="标签" prop="label">
          <el-input v-model="form.label" placeholder="请输入标签" />
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
import { listQuestion, getQuestion, delQuestion, addQuestion, updateQuestion } from "@/api/ojmanage/question";

export default {
  name: "Question",
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
      // 题目管理表格数据
      questionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        topic: null,
        inputFormat: null,
        outputFormat: null,
        dataField: null,
        sampleInput: null,
        sampleOutput: null,
        standardInput: null,
        standardOutput: null,
        modificationTime: null,
        difficulty: null,
        limitation: null,
        passSum: null,
        trySum: null,
        source: null,
        label: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        topic: [
          { required: true, message: "题目内容不能为空", trigger: "blur" }
        ],
        inputFormat: [
          { required: true, message: "输入格式不能为空", trigger: "blur" }
        ],
        outputFormat: [
          { required: true, message: "输出格式不能为空", trigger: "blur" }
        ],
        dataField: [
          { required: true, message: "数据范围不能为空", trigger: "blur" }
        ],
        sampleInput: [
          { required: true, message: "样例输入不能为空", trigger: "blur" }
        ],
        sampleOutput: [
          { required: true, message: "样例输出不能为空", trigger: "blur" }
        ],
        standardInput: [
          { required: true, message: "标准输入-用于检验用户提交的代码不能为空", trigger: "blur" }
        ],
        standardOutput: [
          { required: true, message: "标准输出-用于检验用户提交的代码不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询题目管理列表 */
    getList() {
      this.loading = true;
      listQuestion(this.queryParams).then(response => {
        this.questionList = response.rows;
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
        topic: null,
        inputFormat: null,
        outputFormat: null,
        dataField: null,
        sampleInput: null,
        sampleOutput: null,
        standardInput: null,
        standardOutput: null,
        createTime: null,
        modificationTime: null,
        difficulty: null,
        limitation: null,
        passSum: null,
        trySum: null,
        source: null,
        label: null
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
      this.title = "添加题目管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getQuestion(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改题目管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateQuestion(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addQuestion(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除题目管理编号为"' + ids + '"的数据项？').then(function() {
        return delQuestion(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ojmanage/question/export', {
        ...this.queryParams
      }, `question_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
