<template>
  <main class="mobile-page">
    <van-nav-bar title="移动端表单" left-text="返回" left-arrow @click-left="router.back()" />
    <van-form class="mobile-card" @submit="handleSubmit">
      <van-field
        v-model="form.title"
        name="title"
        label="标题"
        placeholder="请输入标题"
        :rules="[{ required: true, message: '请填写标题' }]"
      />
      <van-field
        v-model="form.remark"
        name="remark"
        label="备注"
        type="textarea"
        placeholder="请输入备注"
      />
      <div class="submit-wrap">
        <van-button round block type="primary" native-type="submit" :loading="submitting">
          提交
        </van-button>
      </div>
    </van-form>
  </main>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import { showToast } from 'vant'

const router = useRouter()
const submitting = ref(false)
const form = reactive({
  title: '',
  remark: ''
})

function handleSubmit() {
  submitting.value = true
  window.setTimeout(() => {
    submitting.value = false
    showToast('提交成功')
  }, 300)
}
</script>

<style scoped>
.submit-wrap {
  margin-top: var(--app-space-lg);
}
</style>
