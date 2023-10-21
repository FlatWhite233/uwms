<template>
<div>
  <Background></Background>
  <el-container style="height: 100vh;width: 100vw;">
    <el-header class="header">
      <div>
        登录
      </div>
      <el-divider></el-divider>
    </el-header>
    <el-main class="main">
      <div>
        <el-card class="box-card">
          <el-form status-icon ref="ruleForm" :model="ruleForm" :rules="rules" label-width="80px">
            <el-form-item label="用户名" style="padding-top: 20px" prop="username">
              <el-input v-model="ruleForm.username" placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input type="password" v-model="ruleForm.password" placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-form-item>
              <el-checkbox v-model="checked">管理员登录</el-checkbox>
            </el-form-item>
            <el-form-item>
              <el-button round type="primary" @click="login('ruleForm')">登录</el-button>
              <el-button round type="success" @click="register()">注册</el-button>
              <el-button round @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </div>
    </el-main>
  </el-container>
</div>
</template>

<script>
import Background from "@/components/Background";
export default {
name: "Login",
  components: {Background},
  data() {
    return {
      checked: false,
      ruleForm: {
        username: '',
        password: '',
      },
      rules: {
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    login(formName) {
      this.$refs[formName].validate((valid) => {
        if(valid){
          const _this = this;
          if (this.checked){
            this.$axios.post('/admin/login', this.ruleForm).then(res => {
              const code = res.data.code;
              const msg = res.data.msg;

              if (code === 200){
                const adminInfo = res.data.data;

                this.$message({
                  message: msg,
                  type: 'success',
                  center: true
                });
                _this.$store.commit('SET_ADMININFO', adminInfo);
                // druid后台管理界面
                window.location.replace('http://localhost:8082/druid/');
              }else if (code === 400){
                this.$message({
                  message: msg,
                  type: 'error',
                  center: true
                });
              }
            })
          }else {
            this.$axios.post('/user/login', this.ruleForm).then(res => {
              const code = res.data.code;
              const msg = res.data.msg;
              if (code === 200){
                const userInfo = res.data.data;

                this.$message({
                  message: msg,
                  type: 'success',
                  center: true
                });
                _this.$store.commit('SET_USERINFO', userInfo);
                _this.$router.push('/person/list');
              }else if (code === 400){
                this.$message({
                  message: msg,
                  type: 'error',
                  center: true
                });
              }
            })
          }
        }else {
          console.log("error");
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    register(){
      this.$router.push("/register")
    }
  }
}
</script>

<style scoped>
.header{
  text-align: center;
  width: 100%;
  padding-top: 20px;
  color: white;
  font-size: 30px;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}
.main{
  display: flex;
  width: 100%;
  height: 100%;
  position: absolute;
  align-items:center;
  justify-content:center;
  /*background-color: #0093E9;*/
  /*background-image: linear-gradient(160deg, #0093E9 0%, #80D0C7 100%);*/
}
.box-card{
  width: 420px;
  height: 300px;
}
</style>