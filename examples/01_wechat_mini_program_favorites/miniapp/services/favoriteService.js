const FAVORITE_KEY = 'favorite_place_ids'
function getFavoriteIds() { return wx.getStorageSync(FAVORITE_KEY) || [] }
function isFavorite(id) { return getFavoriteIds().includes(id) }
function addFavorite(id) { const ids = getFavoriteIds(); if (!ids.includes(id)) { ids.push(id); wx.setStorageSync(FAVORITE_KEY, ids) } return ids }
function removeFavorite(id) { const ids = getFavoriteIds().filter(item => item !== id); wx.setStorageSync(FAVORITE_KEY, ids); return ids }
function toggleFavorite(id) { if (isFavorite(id)) { removeFavorite(id); return false } addFavorite(id); return true }
module.exports = { getFavoriteIds, isFavorite, addFavorite, removeFavorite, toggleFavorite }
