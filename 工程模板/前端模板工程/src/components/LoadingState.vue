<template>
  <div class="state-box" role="status">
    <el-icon class="is-loading"><Loading /></el-icon>
    <span>加载中...</span>
  </div>
</template>

<script setup lang="ts">
import { Loading } from '@element-plus/icons-vue'
</script>

<style scoped>
.state-box {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--spacing-sm);
  min-height: 160px;
  color: var(--color-text-secondary);
}
</style>
