<template>

<!--  <el-container>：外层容器。当子元素中包含 <el-header> 或 <el-footer> 时，全部子元素会垂直上下排列，否则会水平左右排列。-->

  <el-container class="container">
    <el-main class="main">
      <el-button round type="warning" icon="el-icon-house" @click="back">主页</el-button>
      <el-card class="box-card">
        <el-form status-icon ref="ruleForm" :model="ruleForm" :rules="rules" label-width="80px">
          <el-form-item label="姓名" style="padding-top: 20px" prop="name">
            <el-input v-model="ruleForm.name" placeholder="请输入姓名"></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="gender">
            <el-radio v-model="ruleForm.gender" label="1">男</el-radio>
            <el-radio v-model="ruleForm.gender" label="0">女</el-radio>
          </el-form-item>
          <el-form-item label="出生日期" prop="birth">
            <el-date-picker
                v-model="ruleForm.birth"
                align="right"
                type="date"
                placeholder="请选择出生日期"
                :picker-options="pickerOptions">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="死亡日期" prop="death">
            <el-date-picker
                v-model="ruleForm.death"
                align="right"
                type="date"
                placeholder="请选择死亡日期"
                :picker-options="pickerOptions">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="死亡原因"  prop="deadReason">
            <el-input v-model="ruleForm.deadReason" placeholder="请输入死因"></el-input>
          </el-form-item>
          <el-form-item label="生前爱好"  prop="hobby">
            <el-input v-model="ruleForm.hobby" placeholder="请输入生前爱好"></el-input>
          </el-form-item>
          <el-form-item label="当前住址"  prop="address">
            <el-input v-model="ruleForm.address" placeholder="请输入当前住址"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button round type="primary" @click="add('ruleForm')">新增</el-button>
            <el-button round @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-main>
  </el-container>
</template>

<script>
export default {
  name: "AddPerson",
  data(){
    let validateDeath = (rule, value, callback) => {
      if (value === ''){
        callback(new Error('请选择死亡日期'));
      }else if (value < this.ruleForm.birth){
        callback(new Error('死亡日期不能早于出生日期'));
      }else {
        callback();
      }
    }
    return{
      ruleForm: {
        name: '',
        gender: '',
        birth: '',
        death: '',
        deadReason: '',
        hobby: '',
        address: '',
      },
      rules : {
        name: [
          { required: true, message: '姓名不能为空', trigger: 'blur' },
        ],
        gender: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        birth: [
          { required: true, message: '请选择出生日期', trigger: 'change' }
        ],
        death: [
          { required: true, validator: validateDeath, trigger: 'change' }
        ],
        hobby: [
          { required: true, message: '生前爱好不能为空', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '当前住址不能为空', trigger: 'blur' }
        ],
      },
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
    }
  },
  methods: {
    add(formName){
      this.$refs[formName].validate((valid) => {
        if (valid){
          this.$axios.post('/person/add', this.ruleForm).then((res) => {
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
      });
      this.$router.push('/person/list')
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    back(){
      this.$router.push('/person/list')
    },
  }
}
</script>

<style scoped>
.container{
  width: 95vw;
  height: 85vh !important;
  justify-content:center;
  align-items: center;
}
.main{
  height: 100%;
  width: 100%;
  background: rgba(255, 255, 255, 0.7);
  border-radius: 5px;
}
.box-card{
  display: flex;
  width: 450px;
  height: 550px;
  margin: 20px auto;
  justify-content:center;
  align-items: center;
}
</style>