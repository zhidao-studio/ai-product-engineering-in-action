function joinTags(tags) { return Array.isArray(tags) ? tags.join(' · ') : '' }
module.exports = { joinTags }
