<template>
  <div class="state-box">
    <p class="title">暂无数据</p>
    <p class="desc">请先创建一条记录。</p>
  </div>
</template>

<style scoped>
.state-box {
  min-height: 160px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--color-text-secondary);
}

.title {
  margin: 0 0 var(--spacing-xs);
  color: var(--color-text-primary);
  font-weight: 600;
}

.desc {
  margin: 0;
}
</style>
