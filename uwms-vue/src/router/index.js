import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from "@/views/Index"
import Login from "@/views/Login";
import Layout from "@/views/Layout";
import UserInfo from "@/views/user/UserInfo";
import AddPerson from "@/views/user/person/manage/AddPerson";
import Person from "@/views/user/person/Person";
import ListPerson from "@/views/user/person/manage/ListPerson";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    // 要注意，以 / 开头的嵌套路径会被当作根路径。
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import(/* webpackChunkName: "about" */ '../views/Register.vue')
  },
  {
    path: '/layout',
    name: 'Layout',
    component: Layout
  },
  {
    path: '/userinfo',
    name: 'userinfo',
    component: UserInfo
  },
  {
    path: '/person',
    name: 'Person',
    component: Person,
    children: [
      {
        path: 'list',
        name: 'ListPerson',
        component: ListPerson
      },
      {
        path: 'add',
        name: 'AddPerson',
        component: AddPerson
      },
    ]
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
