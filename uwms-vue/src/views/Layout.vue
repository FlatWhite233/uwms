<template>
  <div>
    <Background></Background>
    <el-container style="height: 100vh;width: 100vw;align-items:center;justify-content:center;">
<!--      <el-header class="header">-->
<!--        生死簿管理-->
<!--        <el-divider id="divider"></el-divider>-->
<!--        <div style="width: 100vw;text-align: right; font-size: 18px;background: dodgerblue">-->
<!--          <span>当前用户：{{ user.username }}，欢迎使用！</span>-->
<!--          <el-dropdown>-->
<!--            <i class="el-icon-setting" style="margin-right: 15px"></i>-->
<!--            <el-dropdown-menu slot="dropdown">-->
<!--              <el-dropdown-item @click.native="uesrCenter">个人中心</el-dropdown-item>-->
<!--              <el-dropdown-item @click.native="logout">注销</el-dropdown-item>-->
<!--            </el-dropdown-menu>-->
<!--          </el-dropdown>-->
<!--        </div>-->
<!--      </el-header>-->
      <Header></Header>
<!--      <div style="height: 85vh;width: 95vw;border-radius: 5px;background-color: green;">-->
        <el-main class="main" style="display:flex;align-items:center;justify-content:center;">
        </el-main>
        <el-footer class="footer"></el-footer>
<!--      </div>-->
    </el-container>
  </div>
</template>

<script>
import Background from "@/components/Background";
import Header from "@/components/Header";

export default {
  name: "Layout",
  components: {Header, Background},
}
</script>

<style scoped>
#divider{
  margin: 20px 0 0 0;
}
.header {
  background: red;

  height: 15vh !important;
  width: 100vw;
  padding: 20px 0;
  color: white;
  text-align: center;
  font-size: 30px;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}
.main{
  background: rgba(255, 255, 255, 0.7);
  border-radius: 5px 5px 0 0;
  width: 95vw;
  height: 75vh !important;
}
.footer{
  background: rgba(255, 255, 255, 0.7);
  border-radius: 0 0 5px 5px;
  height: 10vh !important;
  width: 95vw;
  display: flex;
  justify-content:center;
}
</style>