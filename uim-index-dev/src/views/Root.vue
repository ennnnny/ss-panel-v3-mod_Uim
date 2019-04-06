<template>
    <div class="title pure-g">
        <div class="pure-u-1 pure-u-xl-1-2 title-left">
            <h1>{{routermsg.appname}}</h1>
            <span>{{routermsg.hitokoto}}</span>
            <router-link class="button-index" to="/auth/login" v-if="isLogin === false">登录</router-link>
            <router-link class="button-index" to="/auth/register" v-if="isLogin === false">注册</router-link>
            <router-link class="button-index" to="/user/panel" v-if="isLogin === true">用户中心</router-link>
        </div>
        <div class="pure-u-xl-1-2 logo-bg">
            <img src="/images/logo_white.png" alt="" class="logo">
        </div>
    </div>
</template>

<script>
import { _get } from "../js/fetch";
export default {
  props: ['routermsg'],
  data: function() {
    return {
      isLogin: false
    };
  },
  mounted() {
    _get("/getuserinfo", "include")
      .then(r => {
        if (r.ret === 1) {
          this.isLogin = true;
        }
      });
  },
}
</script>
