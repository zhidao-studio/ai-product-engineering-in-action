export interface ApiResponse<T> {
  code: string
  message: string
  data: T
}

export interface UserInfo {
  id: string
  username: string
  displayName: string
}

export interface LoginRequest {
  username: string
  password: string
}

export interface LoginResponse {
  user: UserInfo
}
