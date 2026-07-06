import { createRouter, createWebHistory } from 'vue-router'

import HomePage from '@/pages/HomePage.vue'
import FormPage from '@/pages/FormPage.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomePage,
      meta: {
        title: '首页'
      }
    },
    {
      path: '/form',
      name: 'form',
      component: FormPage,
      meta: {
        title: '表单'
      }
    }
  ]
})

export default router
