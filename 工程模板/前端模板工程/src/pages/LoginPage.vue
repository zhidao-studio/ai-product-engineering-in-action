<template>
  <main class="login-page">
    <section class="page-card login-card">
      <h1>登录</h1>
      <p class="subtitle">进入生产力工具后台</p>

      <el-form label-position="top" @submit.prevent="handleSubmit">
        <el-form-item label="账号">
          <el-input v-model="form.username" autocomplete="username" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.password" type="password" autocomplete="current-password" />
        </el-form-item>
        <el-alert v-if="errorMessage" :title="errorMessage" type="error" show-icon />
        <el-button class="submit-button" type="primary" native-type="submit" :loading="submitting">
          登录
        </el-button>
      </el-form>
    </section>
  </main>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import { submitLogin } from '@/services/userService'
import { useUserStore } from '@/stores/userStore'

const router = useRouter()
const userStore = useUserStore()

const form = reactive({
  username: '',
  password: ''
})

const submitting = ref(false)
const errorMessage = ref('')

async function handleSubmit() {
  if (!form.username || !form.password) {
    errorMessage.value = '请输入账号和密码'
    return
  }

  submitting.value = true
  errorMessage.value = ''

  try {
    const result = await submitLogin(form)
    userStore.setCurrentUser(result.user)
    await router.push('/dashboard')
  } catch {
    errorMessage.value = '账号或密码错误'
  } finally {
    submitting.value = false
  }
}
</script>

<style scoped>
.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: var(--spacing-xl);
}

.login-card {
  width: min(420px, 100%);
}

.subtitle {
  margin-bottom: var(--spacing-lg);
  color: var(--color-text-secondary);
}

.submit-button {
  width: 100%;
  margin-top: var(--spacing-md);
}
</style>
