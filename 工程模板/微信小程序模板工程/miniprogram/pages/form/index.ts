import Toast from '@vant/weapp/toast/toast'

Page({
  data: {
    title: '',
    remark: '',
    submitting: false
  },
  onTitleChange(event: WechatMiniprogram.CustomEvent) {
    this.setData({ title: event.detail })
  },
  onRemarkChange(event: WechatMiniprogram.CustomEvent) {
    this.setData({ remark: event.detail })
  },
  submitForm() {
    if (!this.data.title) {
      Toast('请填写标题')
      return
    }

    this.setData({ submitting: true })
    setTimeout(() => {
      this.setData({ submitting: false })
      Toast('提交成功')
    }, 300)
  }
})
