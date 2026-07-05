const placeService = require('../../services/placeService')
const favoriteService = require('../../services/favoriteService')
Page({
  data: { loading: true, error: '', place: null, isFavorite: false },
  onLoad(options) { this.loadDetail(options.id) },
  loadDetail(id) {
    const place = placeService.getPlaceById(id)
    if (!place) { this.setData({ loading:false, error:'没有找到这个地点', place:null }); return }
    this.setData({ loading:false, error:'', place:{ ...place, tagText: place.tags.join(' · ') }, isFavorite: favoriteService.isFavorite(id) })
  },
  toggleFavorite() { const isFavorite = favoriteService.toggleFavorite(this.data.place.id); this.setData({ isFavorite }); wx.showToast({ title: isFavorite ? '已收藏' : '已取消', icon:'success' }) }
})
