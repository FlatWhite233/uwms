<template>
  <div class="header">
    生死簿管理
    <el-divider id="divider"></el-divider>
    <StatusBar></StatusBar>
  </div>
</template>

<script>
import StatusBar from "@/components/StatusBar";
export default {
  name: "Header",
  components: {StatusBar},
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
</style>