<template>
<div>
  <Background></Background>
  <el-container style="height: 100vh;width: 100vw;justify-content:center;align-items: center;">
    <el-header style="height: 15vh !important;width: 100vw;padding: 20px 0 !important;">
      <Header></Header>
    </el-header>
    <router-view></router-view>
  </el-container>
</div>
</template>

<script>
import Background from "@/components/Background";
import Header from "@/components/Header";
export default {
  name: "Person",
  components: {Header, Background},
}
</script>

<style scoped>
</style>