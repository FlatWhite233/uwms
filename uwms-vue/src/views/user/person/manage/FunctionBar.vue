<template>
  <div style="padding-bottom: 20px;height: 50px;width: 100%">
    <el-button type="warning" @click.native="showAll" round icon="el-icon-view">全部</el-button>
    <el-button type="success" @click.native="addPerson" round icon="el-icon-circle-plus-outline">新增</el-button>
    <div style="float: right">
      <el-input
          style="width: 300px;padding-right: 20px"
          placeholder="请输入搜索内容"
          prefix-icon="el-icon-search"
          v-model="searchContent">
      </el-input>
      <el-button style="margin-right: 15px" @click="search" type="primary" round icon="el-icon-search">搜索</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "FunctionBar",
  data() {
    return {
      searchContent: '',
    }
  },
  methods: {
    showAll(){
      this.hasSearch = false;
      this.$router.push('/person/list');

      this.$axios.get('person/list').then(res => {
        this.tableData = res.data.data.records;
        const msg = res.data.msg;
        this.$notify({
          title: '成功',
          message: msg,
          type: 'success'
        });
      })
    },
    listPerson(){
      this.$axios.get('person/list').then(res => {
        this.tableData = res.data.data.records;
      })
    },
    addPerson(){
      this.$router.push('/person/add')
    },
    search(){
      this.$router.push('/person/list');

      const searchContent = this.searchContent;
      const currentPage = 1;
      if (searchContent === ''){
        this.$notify({
          title: '失败',
          message: '搜索内容不能为空',
          type: 'error'
        });
      }else {
        this.$axios.post('/person/search/',{searchContent, currentPage}).then(res => {
          const code = res.data.code;
          const msg = res.data.msg;

          if (code === 200){
            this.$notify({
              title: '成功',
              message: msg,
              type: 'success'
            });
            this.hasSearch = true;

            this.tableData = res.data.data.records;
            this.currentPage = res.data.data.current;
            this.total = res.data.data.total;
            this.pageSize = res.data.data.size;
          }else{
            this.$notify({
              title: '失败',
              message: msg,
              type: 'error'
            });
          }
        })
      }
    },
  }
}
</script>

<style scoped>

</style>