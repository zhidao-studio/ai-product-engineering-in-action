<template>
  <main class="mobile-page">
    <van-nav-bar title="移动端首页" />
    <section class="mobile-card hero-card">
      <h1>H5 生产力入口</h1>
      <p>这是一个可被 AI 扩展的移动端 H5 首页。</p>
      <van-button type="primary" block to="/form">填写表单</van-button>
    </section>
  </main>
</template>

<style scoped>
.hero-card {
  margin-top: var(--app-space-md);
}

.hero-card h1 {
  margin: 0 0 var(--app-space-sm);
}

.hero-card p {
  color: var(--app-text-secondary);
  margin-bottom: var(--app-space-lg);
}
</style>
