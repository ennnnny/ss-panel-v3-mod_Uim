<template>
  <div @mousewheel="wheelChange" class="user-settings">
    <div class="card-title">连接信息</div>
    <div class="card-body">
      <div class="pure-g wrap">
        <div v-for="tip in userSettings.tipsLink" class="pure-u-1-2 pure-u-lg-3-24" :key="tip.name">
          <template v-if="tip.name == '订阅地址' && userCon.account_type == 2">
            <p class="tips tips-blue">{{tip.name}}</p>
            <template v-for="content in tip.content">
            <div class="input-copy" style="margin-top: 12px;margin-bottom: 12px;">
              <div class="pure-g align-center relative" style="margin-bottom: 0px;">
                <span class="pure-u-18-24 pure-g relative flex justify-center text-center" style="width: 100%;">
                  <input
                    v-uimclip="{ onSuccess:successCopied }"
                    :data-uimclip="getSubUrlBase(content).subUrl"
                    @mouseenter="showToolTip(content)"
                    @mouseleave="hideToolTip()"
                    :class="{ 'sublink-reset':subLinkTrans }"
                    class="tips tips-blue pure-u-1"
                    type="text"
                    name
                    id
                    :value="getSubUrlBase(content).subUrl"
                    readonly
                  >
                  <uim-tooltip
                    v-show="toolTips === content"
                    class="uim-tooltip-top flex justify-center" style="z-index: 9;"
                  >
                    <template #tooltip-inner>
                      <span>{{getSubUrlBase(content).subUrl}}</span>
                    </template>
                  </uim-tooltip>
                </span>
              </div>
            </div>
            </template>
          </template>
          <template v-if="tip.name != '订阅地址'">
            <p class="tips tips-blue">{{tip.name}}</p>
            <template v-if="userCon.account_type == 1">
              <p class="font-light">{{tip.content}}</p>
            </template>
            <template v-if="userCon.account_type == 2">
              <p class="font-light" v-for="content in tip.content">{{content}}</p>
            </template>
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
import Tooltip from "@/components/tooltip.vue";

export default {
  mixins: [userMixin, storeMap, userSetMixin],
  components: {
    "uim-tooltip": Tooltip
  },
  props: ['propData'],
  data: function() {
    return {
      toolTips: 0
    }
  },
  methods: {
    getSubUrlBase (token) {
      let url = this.propData.subUrl + token;
      switch (this.propData.currentDlType) {
        case "SSR":
          return {
            tagkey: "dl-ssr",
            subKey: "sub-ssr",
            arrIndex: 0,
            muType: "mu0",
            subUrl: url + '?mu=0'
          };
        case "SS/SSD":
          return {
            tagkey: "dl-ss",
            subKey: "sub-ss",
            arrIndex: 1,
            muType: "mu3",
            subUrl: url + '?mu=3'
          };
        case "V2RAY":
          return {
            tagkey: "dl-v2",
            subKey: "sub-v2",
            arrIndex: 2,
            muType: "mu2",
            subUrl: url + '?mu=2'
          };
      }
    },
    showToolTip(id) {
      this.toolTips = id;
    },
    hideToolTip() {
      this.toolTips = 0;
    },
  },
  mounted() {
    window.console.log('@@',this.propData);
  }
}
</script>
