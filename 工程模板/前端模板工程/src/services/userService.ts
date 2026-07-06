import { requestJson } from './http'
import type { LoginRequest, LoginResponse } from '@/types/api'

export function submitLogin(payload: LoginRequest): Promise<LoginResponse> {
  return requestJson<LoginResponse>('/session', {
    method: 'POST',
    body: JSON.stringify(payload)
  })
}
