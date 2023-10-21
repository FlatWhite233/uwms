<template>
  <div>
    <Background></Background>
    <el-container style="height: 100vh;width: 100vw">
      <el-header>
        <div class="header">
          地府管理系统
        </div>
      </el-header>
      <el-main class="main">
        <div>
          <el-button round id="btn" type="primary"  @click="start()">点击进入</el-button>
        </div>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import Background from "@/components/Background.vue";
export default {
name: "index",
  components: {Background},
  methods: {
    start(){
      this.$router.push('/login');
    }
  }
}
</script>

<style scoped>
.header{
  text-align: center;
  padding-top: 20px;
  color: white;
  font-size: 35px;
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
</style>