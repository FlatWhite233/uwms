<template>
  <div>
    <Background></Background>
    <el-container style="height: 100vh;width: 100vw">
      <el-header class="header">
        <div>
          注册
        </div>
        <el-divider></el-divider>
      </el-header>
      <el-main class="main">
        <div>
          <el-card class="box-card">
            <el-form status-icon ref="ruleForm" :model="ruleForm" :rules="rules" label-width="80px">
              <el-form-item label="用户名" style="padding-top: 25px" prop="username">
                <el-input v-model="ruleForm.username" placeholder="请输入用户名"></el-input>
              </el-form-item>

              <el-form-item label="密码" prop="password">
                <el-input type="password" v-model="ruleForm.password" placeholder="请输入密码"></el-input>
              </el-form-item>

              <el-form-item label="确认密码" prop="confirm">
                <el-input type="password" v-model="ruleForm.confirm" placeholder="请再次输入密码"></el-input>
              </el-form-item>

              <el-form-item label="邮箱" prop="email">
                <el-input type="email" v-model="ruleForm.email" placeholder="请输入邮箱"></el-input>
              </el-form-item>

              <el-form-item>
                <el-button round type="primary" @click="login()">登录</el-button>
                <el-button round type="success" @click="register('ruleForm')">注册</el-button>
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
name: "Register",
  components: {Background},
  data() {
    let validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.ruleForm.password !== '') {
          this.$refs.ruleForm.validateField('confirm');
        }
        callback();
      }
    };
    let validateConfirmPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm.password) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };

    return {
      ruleForm: {
        username: '',
        password: '',
        confirm: '',
        email: '',
      },
      rules: {
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ],
        password: [
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
    login() {
      this.$router.push("/login")
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    register(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid){
          const _this = this;
          this.$axios.post('/user/register', this.ruleForm).then(res => {
            const code = res.data.code;
            const msg = res.data.msg;

            if (code === 200){
              this.$message({
                message: msg,
                type: 'success',
                center: true
              });
              _this.$router.push('/login');
            }else if (code === 400){
              this.$message({
                message: msg,
                type: 'error',
                center: true
              });
            }
          })
        }else {
          console.log('error');
          return false;
        }
      })
    },
  }
}
</script>

<style scoped>
.header{
  width: 100%;
  padding-top: 20px;
  color: white;
  text-align: center;
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
}
.box-card{
  width: 420px;
  height: 380px;
}
</style>