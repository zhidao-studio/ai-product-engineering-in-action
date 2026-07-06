import { createRouter, createWebHistory } from 'vue-router'
import type { AppRouteRecord } from '@/types/router'

import BasicLayout from '@/layouts/BasicLayout.vue'
import LoginPage from '@/pages/LoginPage.vue'
import DashboardPage from '@/pages/DashboardPage.vue'

const routes: AppRouteRecord[] = [
  {
    path: '/login',
    name: 'login',
    component: LoginPage,
    meta: {
      title: '登录',
      hidden: true
    }
  },
  {
    path: '/',
    name: 'root',
    component: BasicLayout,
    redirect: '/dashboard',
    meta: {
      title: '首页',
      requiresAuth: true
    },
    children: [
      {
        path: 'dashboard',
        name: 'dashboard',
        component: DashboardPage,
        meta: {
          title: '控制台',
          requiresAuth: true
        }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
