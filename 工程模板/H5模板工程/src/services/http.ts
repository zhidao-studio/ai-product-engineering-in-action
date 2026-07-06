import type { ApiResponse } from '@/types/api'

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? '/api'

export async function requestJson<T>(path: string, init?: RequestInit): Promise<T> {
  const response = await fetch(`${API_BASE_URL}${path}`, {
    ...init,
    headers: {
      'Content-Type': 'application/json',
      ...(init?.headers ?? {})
    },
    credentials: 'include'
  })

  const body = (await response.json()) as ApiResponse<T>

  if (!response.ok || body.code !== 'OK') {
    throw new Error(body.message || '请求失败')
  }

  return body.data
}
