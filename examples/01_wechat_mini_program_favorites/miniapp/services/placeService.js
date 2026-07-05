const { places } = require('../mock/places')
function getPlaces() { return places }
function getPlaceById(id) { return places.find(item => item.id === id) }
module.exports = { getPlaces, getPlaceById }
