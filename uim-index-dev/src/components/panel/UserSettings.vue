<template>
  <div @mousewheel="wheelChange" class="user-settings">
    <div class="card-title">连接信息</div>
    <div class="card-body">
      <div class="pure-g wrap">
        <div v-for="tip in userSettings.tipsLink" class="pure-u-1-2 pure-u-lg-4-24" :key="tip.name">
          <p class="tips tips-blue">{{tip.name}}</p>
          <template v-if="userCon.account_type == 1">
            <p class="font-light">{{tip.content}}</p>
          </template>
          <template v-if="userCon.account_type == 2">
            <p class="font-light" v-for="content in tip.content">{{content}}</p>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import storeMap from '@/mixins/storeMap'
import userMixin from '@/mixins/userMixin'
import userSetMixin from '@/mixins/userSetMixin'

export default {
  mixins: [userMixin, storeMap, userSetMixin]
}
</script>
