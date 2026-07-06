export interface ApiResponse<T> {
  code: string
  message: string
  data: T
}

export type ApiErrorCode =
  | 'OK'
  | 'INVALID_REQUEST'
  | 'UNAUTHORIZED'
  | 'FORBIDDEN'
  | 'NOT_FOUND'
  | 'INTERNAL_ERROR'

export type ClientType = 'web-admin' | 'h5' | 'weapp' | 'ios'
