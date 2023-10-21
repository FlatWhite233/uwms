<template>
  <div style="width: 100vw;text-align: right; font-size: 18px;background-color: #FFFFFF00;">
    <span>当前用户：{{ user.username }}，欢迎使用！</span>
    <el-dropdown>
      <i class="el-icon-setting" style="margin-right: 15px"></i>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item @click.native="userCenter" icon="el-icon-user">个人中心</el-dropdown-item>
        <el-dropdown-item @click.native="logout" icon="el-icon-switch-button">退出登录</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  name: "StatusBar",
  data() {
    return{
      user: {
        username: '请先登录',
      },
      hasLogin: false
    }
  },
  methods: {
    userCenter(){
      if(this.hasLogin){
        this.$router.push("/userinfo")
      }
    },
    getUserInfo(){
      try {
        this.user.username = this.$store.getters.getUser.username;
        this.hasLogin = true;
      }catch (e){
        // 因为还没学JWT 以及后端的安全框架
        // 所以没登陆直接push到首页并且弹出提示
        // 假装进行了登录拦截
        this.$message({
          message: '没有权限，请先登录',
          type: 'error',
          center: true
        });
        this.$router.push('/');
      }
    },
    logout(){
      const _this = this;
      _this.$axios.get("/user/logout").then( res => {
        const code = res.data.code;
        const msg = res.data.msg;
        if (code === 200){
          _this.$store.commit("REMOVE_USERINFO");
          this.$message({
            message: msg,
            type: 'success',
            center: true
          });
          _this.$router.push("/login");
          this.hasLogin = false;
        }
      })
    },
  },
  created() {
    this.getUserInfo();
  }
}
</script>

<style scoped>

</style>