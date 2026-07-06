import { defineStore } from 'pinia'
import { ref } from 'vue'
import type { UserInfo } from '@/types/api'

export const useUserStore = defineStore('user', () => {
  const currentUser = ref<UserInfo | null>(null)

  function setCurrentUser(user: UserInfo | null) {
    currentUser.value = user
  }

  return {
    currentUser,
    setCurrentUser
  }
})
