<template>
  <el-container class="container">
    <el-main class="main">
      <div>
        <div style="padding-bottom: 20px">
          <el-button type="warning" @click.native="showAll" round icon="el-icon-view">全部</el-button>
          <el-button type="success" @click.native="addPerson" round icon="el-icon-circle-plus-outline">新增</el-button>
          <div style="float: right">
            <el-input
                style="width: 300px;padding-right: 20px"
                placeholder="请输入搜索内容"
                prefix-icon="el-icon-search"
                v-model="searchContent">
            </el-input>
            <el-button style="margin-right: 15px" @click="search" type="primary" round icon="el-icon-search">搜索</el-button>
          </div>
        </div>
        <el-table :data="tableData">
          <!--            <el-table-column prop="personName" label="姓名" sortable>-->
          <!--            </el-table-column>-->
          <el-table-column
              label="姓名">
            <template slot-scope="scope">
              <el-popover trigger="hover" placement="top">
                <p>姓名： {{ scope.row.personName }}</p>
                <p>住址： {{ scope.row.personAddress }}</p>
                <p>阳寿： {{ scope.row.personRemainLife }}天</p>
                <div slot="reference" class="name-wrapper">
                  <el-tag size="medium">{{ scope.row.personName }}</el-tag>
                </div>
              </el-popover>
            </template>
          </el-table-column>

          <el-table-column prop="personGender" label="性别" width="80" :formatter="sexFormatter">
          </el-table-column>
          <!--            <el-table-column prop="personBirth" label="出生日期" sortable :formatter="dateFormatter">-->
          <!--            </el-table-column>-->
          <el-table-column
              label="出生日期" sortable>
            <template slot-scope="scope">
              <i class="el-icon-time"></i>
              <span style="margin-left: 10px">{{ new Date(scope.row.personBirth).toLocaleDateString() }}</span>
            </template>
          </el-table-column>
          <!--            <el-table-column prop="personDeath" label="死亡日期" sortable :formatter="dateFormatter">-->
          <!--            </el-table-column>-->
          <el-table-column
              label="死亡日期" sortable>
            <template slot-scope="scope">
              <i class="el-icon-time"></i>
              <span style="margin-left: 10px">{{ new Date(scope.row.personDeath).toLocaleDateString() }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="personRemainLife" label="阳寿" sortable>
          </el-table-column>
          <el-table-column prop="personIsDead" label="是否死亡" :formatter="deathFormatter">
          </el-table-column>
          <el-table-column prop="personDeadReason" label="死因">
          </el-table-column>
          <el-table-column prop="personHobby" label="生前爱好">
          </el-table-column>
          <el-table-column prop="personAddress" label="当前住址">
          </el-table-column>
          <el-table-column label="操作" width="200">
            <template slot-scope="scope">
              <el-button
                  size="mini"
                  @click="handleEditDialog(scope.$index, scope.row)">编辑</el-button>
<!--                  @click="handleEdit(scope.$index, scope.row)">编辑</el-button>-->
              <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(tableData, scope.$index)">删除</el-button>
              <!--                    @click="handleDelete(scope.$index, scope.row)">删除</el-button>-->
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div>
        <el-dialog title="编辑信息" :visible.sync="dialogFormVisible" center>
          <div style="width: 300px;margin: 0 auto">
            <el-form status-icon :model="DialogData" ref="ruleForm" :rules="rules" label-width="80px">
              <el-form-item label="姓名" prop="personName">
                <el-input v-model="DialogData.personName" placeholder="请输入姓名"></el-input>
              </el-form-item>
              <el-form-item label="性别" prop="personGender">
                <el-radio v-model="DialogData.personGender" :label="1">男</el-radio>
                <el-radio v-model="DialogData.personGender" :label="0">女</el-radio>
              </el-form-item>
              <el-form-item label="出生日期" prop="personBirth">
                <el-date-picker
                    v-model="DialogData.personBirth"
                    align="right"
                    type="date"
                    placeholder="请选择出生日期"
                    :picker-options="pickerOptions">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="死亡日期" prop="personDeath">
                <el-date-picker
                    v-model="DialogData.personDeath"
                    align="right"
                    type="date"
                    placeholder="请选择死亡日期"
                    :picker-options="pickerOptions">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="死亡原因"  prop="personDeadReason">
                <el-input v-model="DialogData.personDeadReason" placeholder="请输入死因"></el-input>
              </el-form-item>
              <el-form-item label="生前爱好"  prop="personHobby">
                <el-input v-model="DialogData.personHobby" placeholder="请输入生前爱好"></el-input>
              </el-form-item>
              <el-form-item label="当前住址"  prop="personAddress">
                <el-input v-model="DialogData.personAddress" placeholder="请输入当前住址"></el-input>
              </el-form-item>
            </el-form>
          </div>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="handleEdit('ruleForm')">更 改</el-button>
            <el-button @click="dialogFormVisible = false">取 消</el-button>
          </div>
        </el-dialog>
      </div>
    </el-main>
    <el-footer class="footer">
      <el-pagination
          background
          layout="prev, pager, next"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="total"
          @current-change="page">
      </el-pagination>
    </el-footer>
  </el-container>
</template>

<script>
export default {
name: "ListPerson",
  data() {
    let validateDeath = (rule, value, callback) => {
      if (value === ''){
        callback(new Error('请选择死亡日期'));
      }else if (value < this.DialogData.personBirth){
        callback(new Error('死亡日期不能早于出生日期'));
      }else {
        callback();
      }
    }
    return {
      formLabelWidth: '250px',
      tableData: [{
        personId: '',
        personName: '',
        personGender: '',
        personBirth: '',
        personDeath: '',
        personIsDead: '',
        personRemainLife: '',
        personDeadReason: '',
        personHobby: '',
        personAddress: '',
      }],
      DialogData: {
        personId: '',
        personName: '',
        personGender: '',
        personBirth: '',
        personDeath: '',
        personIsDead: '',
        personRemainLife: '',
        personDeadReason: '',
        personHobby: '',
        personAddress: '',
      },
      rules : {
        personName: [
          { required: true, message: '姓名不能为空', trigger: 'blur' },
        ],
        personGender: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        personBirth: [
          { required: true, message: '请选择出生日期', trigger: 'change' }
        ],
        personDeath: [
          { required: true, validator: validateDeath, trigger: 'change' }
        ],
        personHobby: [
          { required: true, message: '生前爱好不能为空', trigger: 'blur' }
        ],
        personAddress: [
          { required: true, message: '当前住址不能为空', trigger: 'blur' }
        ],
      },
      currentPage: 1,
      total: 0,
      pageSize: 7,
      searchContent: '',
      hasSearch: false,
      dialogFormVisible: false,
      pickerOptions: {
        // disabledDate(time) {
        //   return time.getTime() > Date.now();
        // },
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }]
      },
    };
  },
  methods: {
    page(currentPage) {
      // 因为后端进行了分页
      // 分页组件绑定的函数需要考虑到是否已经经过搜索 来向后端发起不同请求
      // 所以写了这么无语的代码
      const _this = this;
      if (!_this.hasSearch){
        _this.$axios.get("/person/list?currentPage=" + currentPage).then((res) => {
          this.tableData = res.data.data.records;
          _this.currentPage = res.data.data.current;
          _this.total = res.data.data.total;
          _this.pageSize = res.data.data.size;
        })
      }else if (_this.hasSearch){
        const searchContent = _this.searchContent;
        _this.$axios.post('/person/search/',{searchContent, currentPage}).then((res) => {
          this.tableData = res.data.data.records;
          this.currentPage = res.data.data.current;
          this.total = res.data.data.total;
          this.pageSize = res.data.data.size;
        })
      }
    },
    showAll(){
      this.hasSearch = false;
      this.$axios.get('person/list').then(res => {
        this.tableData = res.data.data.records;
        this.currentPage = res.data.data.current;
        this.total = res.data.data.total;
        this.pageSize = res.data.data.size;
        const msg = res.data.msg;
        this.$notify({
          title: '成功',
          message: msg,
          type: 'success'
        });
      })
    },
    listPerson(){
      this.$axios.get('person/list').then(res => {
        this.tableData = res.data.data.records;
        this.currentPage = res.data.data.current;
        this.total = res.data.data.total;
        this.pageSize = res.data.data.size;
      })
    },
    addPerson(){
      this.$router.push('/person/add')
    },
    dateFormatter(row, col){
      let date = new Date(row[col.property])
      return date.toLocaleDateString()
    },
    deathFormatter(row, col){
      return row[col.property]===1?"已死亡":"还活着"
    },
    sexFormatter(row, col){
      return row[col.property]===1?"男":"女"
    },
    handleEditDialog(index, row){
      this.DialogData.personId = row.personId;
      this.DialogData.personName = row.personName;
      this.DialogData.personGender = row.personGender;
      this.DialogData.personBirth = row.personBirth;
      this.DialogData.personDeath = row.personDeath;
      this.DialogData.personDeadReason = row.personDeadReason;
      this.DialogData.personHobby = row.personHobby;
      this.DialogData.personAddress = row.personAddress;
      this.dialogFormVisible = true;
    },
    handleEdit(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post('/person/edit', this.DialogData).then(res => {
            const code = res.data.code;
            const msg = res.data.msg;
            if (code === 200){
              this.$notify({
                title: '成功',
                message: msg,
                type: "success"
              });
            }else {
              this.$notify({
                title: '失败',
                message: 'Error',
                type: 'error'
              });
            }
          })
        }
      })
      this.dialogFormVisible = false;
      // Mybatis-Plus默认开启一级缓存
      // 修改完后需要再次请求当前页数据 只请求一次可能会读取到 SqlSession 中的 cache
      // 既然是大作业那再请求几次就好了
      this.page(this.currentPage);
      this.page(this.currentPage);
      this.page(this.currentPage);
    },
    handleDelete(tableData, index) {
      const id = tableData[index].personId;

      this.$confirm('此操作将永久删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.get('person/delete/' + id).then((res) => {
          const code = res.data.code;
          const msg = res.data.msg;
          if (code === 200){
            this.$notify({
              title: '成功',
              message: msg,
              type: 'success',
            });
            this.total -= 1;
            if (this.total % this.pageSize === 0){
              this.currentPage -= 1;
            }
            this.page(this.currentPage);
          }else {
            this.$notify({
              title: 'error',
              message: msg,
              type: 'error',
            });
          }
        });
      }).catch(() => {
        this.$notify({
          title: '提示',
          type: 'info',
          message: '已取消删除',
        });
      });
    },
    search(){
      const searchContent = this.searchContent;
      const currentPage = 1;
      if (searchContent === ''){
        this.$notify({
          title: '失败',
          message: '搜索内容不能为空',
          type: 'error'
        });
      }else {
        this.$axios.post('/person/search/',{searchContent, currentPage}).then(res => {
          const code = res.data.code;
          const msg = res.data.msg;

          if (code === 200){
            this.$notify({
              title: '搜索完成',
              message: msg,
              type: 'success'
            });
            this.hasSearch = true;

            this.tableData = res.data.data.records;
            this.currentPage = res.data.data.current;
            this.total = res.data.data.total;
            this.pageSize = res.data.data.size;
          }else{
            this.$notify({
              title: '失败',
              message: msg,
              type: 'error'
            });
          }
        })
      }
    },
  },
  created() {
    this.listPerson();
    this.page(1);
  },
}
</script>

<style>
.el-dialog--center .el-dialog__body{
  padding: 10px 0 0 !important;
}
.el-dialog__footer {
  padding: 5px 20px 20px !important;
}
</style>

<style scoped>
.container{
  width: 95vw;
  height: 85vh !important;
  justify-content:center;
  align-items: center;
}
.main{
  width: 100%;
  background: rgba(255, 255, 255, 0.65);
  border-radius: 5px 5px 0 0;
}
.footer{
  width: 100%;
  background: rgba(255, 255, 255, 0.65);
  border-radius: 0 0 5px 5px;
  display: flex;
  justify-content:center;
}
</style>