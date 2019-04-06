<template>
  <div>
    <div class="charge-btngroup">
      <button class="btn-user index-btn-active">
        <font-awesome-icon :icon="['fab','alipay']"/>&nbsp;支付宝
      </button>
    </div>

    <input type="text" v-model="amount" class="tips tips-blue" placeholder="输入充值金额">
    <button @click="charge" class="tips tips-gold">充值</button>

    <transition name="fade" mode="out-in">
      <div v-if="isQrShow" class="text-center pure-g flex align-center">
        <div class="pure-u-1 pure-u-sm-1-2">
          <p>使用支付宝扫描二维码支付</p>
          <p>移动端可以点击二维码</p>
          <p>充值完毕后会自动跳转</p>
        </div>
        <div class="pure-u-1 pure-u-sm-1-2">
          <div align="center" id="trimeweqr" style="padding-top:10px;" @click="jumpPay"></div>
        </div>
      </div>
    </transition>

    <transition name="fade" mode="out-in">
      <uim-modal :bindMask="isMaskShow" :bindCard="isCardShow" v-if="isMaskShow">
        <h3 slot="uim-modal-title">正在连接支付网关</h3>
        <div class="flex align-center justify-center wrap" slot="uim-modal-body">
          <div class="order-checker-content">感谢您对我们的支持，请耐心等待</div>
        </div>
      </uim-modal>
    </transition>
  </div>
</template>

<script>
import storeMap from "@/mixins/storeMap";
import userMixin from "@/mixins/userMixin";
import modal from "@/components/modal.vue";
import { _post } from "../../js/fetch";

export default {
  mixins: [userMixin, storeMap],
  components: {
    "uim-modal": modal
  },
  data: function() {
    return {
      amount: "",
      isMaskShow: false,
      isCardShow: false,
      isQrShow: false,
      tid: "",
      payUrl: "",
      qrcode: {}
    };
  },
  methods: {
    hideQr() {
      this.isQrShow = false;
      clearTimeout(this.tid);
    },
    charge() {
      let amount = parseFloat(this.amount);
      window.console.log(
        "充值" + amount + "元"
      );

      if (isNaN(amount)) {
        let callConfig = {
          msg: "非法的金额!",
          icon: "times-circle",
          time: 1500
        };
        this.callMsgr(callConfig);
        return;
      }
      this.callModal(() => {
        setTimeout(() => {
          let body = { amount };
          _post("/user/payment/purchase", JSON.stringify(body), "include")
            .then(data => {
              if (data.ret === 1) {
                window.console.log('rec',data);
                this.callModal();
                this.isQrShow = true;
                return data;
              } else {
                window.console.log('error',data);
                this.callModal(() => {
                  setTimeout(() => {
                    let callConfig = {
                      msg: data.msg,
                      icon: "times-circle",
                      time: 1500
                    };
                    this.callMsgr(callConfig);
                  }, 300);
                });
              }
            })
            .then(r => {
              window.console.log('r',r);
              this.qrcode = new window.QRCode("trimeweqr", {
                render: "canvas",
                width: 200,
                height: 200,
                text: r.qrcode
              });
              this.payUrl = r.qrcode;
              this.tid = setTimeout(() => {
                this.chargeChecker(r.pid);
              }, 1000);
            });
        }, 300);
      });
    },
    callModal(func) {
      if (this.isMaskShow === false) {
        this.isMaskShow = true;
        setTimeout(() => {
          this.isCardShow = true;
          if (func) {
            func();
          }
        }, 300);
      } else {
        this.isCardShow = false;
        setTimeout(() => {
          this.isMaskShow = false;
          if (func) {
            func();
          }
        }, 300);
      }
    },
    chargeChecker(token) {
      let headers = {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
      };
      let params = new URLSearchParams();
      params.set("pid", token);
      _post("/payment/status", params, "include", headers).then(data => {
        if (data.result) {
          let callConfig = {
            msg: "充值成功",
            icon: "check-circle",
            time: 1500
          };
          this.callMsgr(callConfig);
          this.hideQr();
          this.reConfigResourse();
        } else {
          this.tid = setTimeout(() => {
            this.chargeChecker(token);
          }, 1000);
        }
      });
    },
    isPC() {
      let userAgentInfo = window.navigator.userAgent;
      let Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");
      let flag = true;
      for (let v = 0; v < Agents.length; v++) {
        if (userAgentInfo.indexOf(Agents[v]) > 0) {
          flag = false;
          break;
        }
      }
      return flag;
    },
    jumpPay() {
      if (this.isPC()){
        window.console.log(this.payUrl);
      }else{
        window.location.href = this.payUrl;
      }
    }
  }
};
</script>

<style>
.charge-btngroup {
  margin-bottom: 1rem;
}
.charge-btngroup button.btn-user {
  margin-right: 1rem;
  min-width: 100px;
}
</style>
