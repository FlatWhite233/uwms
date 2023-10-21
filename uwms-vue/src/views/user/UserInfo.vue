<template>
<div>
  <Background></Background>
  <el-container style="height: 100vh;width: 100vw;justify-content:center;align-items: center;">
    <el-header style="height: 15vh !important;width: 100vw;padding: 20px 0 !important;">
      <div class="header">
        个人中心
        <el-divider id="divider"></el-divider>
        <StatusBar></StatusBar>
      </div>
    </el-header>
    <el-main class="main">
      <el-button round type="warning" icon="el-icon-house" @click="back">主页</el-button>
      <el-card class="box-card">
        <el-form status-icon ref="ruleForm" :model="ruleForm" :rules="rules" label-width="80px">
          <el-form-item hidden prop="id" v-model="ruleForm.id"></el-form-item>
          <el-form-item label="用户名" style="padding-top: 20px" prop="username">
            <el-input v-model="ruleForm.username" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="ruleForm.email" placeholder="请输入邮箱"></el-input>
          </el-form-item>
          <el-form-item label="当前密码" prop="password">
            <el-input type="password" v-model="ruleForm.password" placeholder="请输入当前密码"></el-input>
          </el-form-item>
          <el-form-item label="新密码" prop="newPassword">
            <el-input type="password" v-model="ruleForm.newPassword" placeholder="请输入新密码"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="confirm">
            <el-input type="password" v-model="ruleForm.confirm" placeholder="请再次输入密码"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button round type="primary" @click="update('ruleForm')">更改</el-button>
            <el-button round @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-main>
  </el-container>
</div>

</template>

<script>
import Background from "@/components/Background";
import StatusBar from "@/components/StatusBar";
import crypto from 'crypto'
export default {
name: "UserInfo",
  components: {StatusBar, Background},
  data(){
    let currentPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请当前输入密码'));
      } else {
        if (this.ruleForm.password !== '') {
          this.$refs.ruleForm.validateField('newPassword');
        }
        callback();
      }
    }
    let validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.ruleForm.new !== '') {
          this.$refs.ruleForm.validateField('confirm');
        }
        callback();
      }
    };
    let validateConfirmPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm.newPassword) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };
    return{
      ruleForm: {
        id: '',
        username: '',
        password: '',
        newPassword:'',
        confirm : '',
        email: '',
      },
      rules: {
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, validator: currentPassword, trigger: 'blur' }
        ],
        newPassword: [
          { required: true, validator: validatePassword, trigger: 'blur' }
        ],
        confirm: [
          { required: true, validator: validateConfirmPassword, trigger: 'blur' }
        ],
        email: [
          {
            required: true, message: '邮箱不能为空', trigger: 'blur'
          },
          {
            type: 'email', message: '请输入正确的邮箱格式', trigger: 'change'
          }
        ]
      }
    }
  },
  methods: {
    back(){
      this.$router.push('/person/list')
    },
    getUserInfo(){
      if(this.$store.getters.getUser.username){
        this.ruleForm.id = this.$store.getters.getUser.id;
        this.ruleForm.username = this.$store.getters.getUser.username;
        this.ruleForm.email = this.$store.getters.getUser.email;
      }
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    update(formName) {
      const currentPassword = this.$store.getters.getUser.password;
      const password = crypto.createHash('md5').update(this.ruleForm.password).digest('hex')
      if (currentPassword !== password){
        this.$notify({
          title: '更改失败',
          message: '当前密码错误',
          type: 'error',
        });
      }else{
        this.$refs[formName].validate((valid) => {
          if (valid){
            this.$axios.post('/user/update', this.ruleForm).then( res => {
              const code = res.data.code;
              const msg = res.data.msg;

              if (code === 200) {
                const userInfo = res.data.data;
                this.$store.commit("REMOVE_USERINFO");
                this.$store.commit('SET_USERINFO', userInfo);
                this.$notify({
                  title: '成功',
                  message: msg,
                  type: 'success',
                });
                this.$router.push('/person/list')
              }else {
                this.$notify({
                  title: '失败',
                  message: msg,
                  type: 'error',
                });
              }
            })
          }else {
            console.log('error');
            return false
          }
        })
      }
    }
  },
  created() {
  this.getUserInfo();
  }
}
</script>

<style scoped>
#divider{
  margin: 20px 0 0 0;
}
.header {
  color: white;
  text-align: center;
  font-size: 30px;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}
.main{
  height: 100%;
  width: 95%;
  background: rgba(255, 255, 255, 0.7);
  border-radius: 5px;
}
.box-card{
  display: flex;
  width: 400px;
  height: 420px;
  margin: 20px auto;
  justify-content:center;
  align-items: center;
}
</style>