<template>
  <div class="state-box" role="alert">
    <p class="title">出错了</p>
    <p class="desc">{{ message }}</p>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  message: string
}>()
</script>

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
  color: var(--color-danger);
  font-weight: 600;
}

.desc {
  margin: 0;
}
</style>
