import type { RouteRecordRaw } from 'vue-router'

export interface AppRouteMeta {
  title: string
  hidden?: boolean
  requiresAuth?: boolean
  noCache?: boolean
}

export type AppRouteRecord = RouteRecordRaw & {
  meta: AppRouteMeta
  children?: AppRouteRecord[]
}
