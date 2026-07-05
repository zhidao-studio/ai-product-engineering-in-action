Page({
  data: { version: '0.1.0' },
  goAbout() { wx.navigateTo({ url: '/pages/about/about' }) },
  clearFavorites() { wx.showModal({ title:'确认清空？', content:'这会清空本地收藏数据。', success: res => { if (res.confirm) { wx.removeStorageSync('favorite_place_ids'); wx.showToast({ title:'已清空', icon:'success' }) } } }) }
})
