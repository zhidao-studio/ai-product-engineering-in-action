<template>
  <section class="page-card">
    <div class="page-header">
      <div>
        <h1>控制台</h1>
        <p>这是一个可被 AI 扩展的后台首页。</p>
      </div>
      <el-button type="primary">新建任务</el-button>
    </div>
    <EmptyState />
  </section>
</template>

<script setup lang="ts">
import EmptyState from '@/components/EmptyState.vue'
</script>

<style scoped>
.page-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: var(--spacing-md);
  margin-bottom: var(--spacing-lg);
}

.page-header h1 {
  margin: 0 0 var(--spacing-sm);
}

.page-header p {
  margin: 0;
  color: var(--color-text-secondary);
}
</style>
