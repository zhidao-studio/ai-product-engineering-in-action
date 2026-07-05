const placeService = require('../../services/placeService')
const favoriteService = require('../../services/favoriteService')
Page({
  data: { loading: true, error: '', places: [] },
  onLoad() { this.loadPlaces() },
  onShow() { this.loadPlaces() },
  loadPlaces() {
    try {
      const places = placeService.getPlaces().map(item => ({ ...item, isFavorite: favoriteService.isFavorite(item.id), tagText: item.tags.join(' · ') }))
      this.setData({ loading: false, error: '', places })
    } catch (error) { this.setData({ loading: false, error: '地点数据加载失败', places: [] }) }
  },
  goDetail(event) { wx.navigateTo({ url: `/pages/detail/detail?id=${event.currentTarget.dataset.id}` }) }
})
