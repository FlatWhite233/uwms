import Vue from "vue";
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        userInfo: JSON.parse(sessionStorage.getItem('userInfo')),
        adminInfo: JSON.parse(sessionStorage.getItem('adminInfo'))
    },
    mutations: {
        SET_USERINFO: (state, userInfo) => {
            state.userInfo = userInfo;
            sessionStorage.setItem("userInfo", JSON.stringify(userInfo));
        },
        REMOVE_USERINFO: (state) => {
            state.userInfo = {};
            sessionStorage.removeItem('userInfo');
            // sessionStorage.setItem("userInfo", JSON.stringify(''));
        },
        SET_ADMININFO: (state, adminInfo) => {
            state.userInfo = adminInfo;
            sessionStorage.setItem("adminInfo", JSON.stringify(adminInfo));
        },
        REMOVE_ADMININFO: (state) => {
            state.userInfo = {};
            sessionStorage.removeItem('adminInfo');
        },
    },
    getters: {
        getUser: state => {
            return state.userInfo;
        }
    },
    actions: {
    },
    modules: {
    }
})
