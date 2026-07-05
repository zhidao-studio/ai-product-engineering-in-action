const placeService = require('../../services/placeService')
const favoriteService = require('../../services/favoriteService')
Page({
  data: { favorites: [] },
  onShow() { this.loadFavorites() },
  loadFavorites() { const ids = favoriteService.getFavoriteIds(); const favorites = placeService.getPlaces().filter(item => ids.includes(item.id)).map(item => ({ ...item, tagText: item.tags.join(' · ') })); this.setData({ favorites }) },
  goDetail(event) { wx.navigateTo({ url: `/pages/detail/detail?id=${event.currentTarget.dataset.id}` }) }
})
