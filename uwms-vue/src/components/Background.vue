<template>
  <div>
      <div class="background">
        <img :src="backgroundImg" width="100%" height="100%" alt="">
      </div>
  </div>
</template>

<script>
export default {
  name: "Background",
  data(){
    return {
      backgroundImg: require('@/assets/background.jpeg')
    }
  }
}
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}

.background{
  height: 100vh;
  width: 100vw;
  z-index: -1;
  position: absolute;
  /*background-color: rgba(0, 0, 0, 0.5); !* IE9、标准浏览器、IE6和部分IE7内核的浏览器(如QQ浏览器)会读懂 *!*/
}
</style>