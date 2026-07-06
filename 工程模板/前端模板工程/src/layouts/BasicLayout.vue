<template>
  <el-container class="app-layout">
    <el-aside class="app-aside" width="220px">
      <div class="app-logo">AI Product</div>
      <el-menu router default-active="/dashboard" class="app-menu">
        <el-menu-item index="/dashboard">
          <span>控制台</span>
        </el-menu-item>
      </el-menu>
    </el-aside>

    <el-container>
      <el-header class="app-header">
        <span>生产力工具后台</span>
      </el-header>
      <el-main class="app-main">
        <RouterView />
      </el-main>
    </el-container>
  </el-container>
</template>

<style scoped>
.app-layout {
  min-height: 100vh;
}

.app-aside {
  background: var(--color-surface);
  border-right: 1px solid var(--color-border);
}

.app-logo {
  height: 56px;
  display: flex;
  align-items: center;
  padding: 0 var(--spacing-md);
  font-weight: 700;
}

.app-menu {
  border-right: none;
}

.app-header {
  display: flex;
  align-items: center;
  background: var(--color-surface);
  border-bottom: 1px solid var(--color-border);
}

.app-main {
  background: var(--color-background);
}

@media (max-width: 768px) {
  .app-layout {
    display: block;
  }

  .app-aside {
    width: 100% !important;
    border-right: none;
    border-bottom: 1px solid var(--color-border);
  }
}
</style>
