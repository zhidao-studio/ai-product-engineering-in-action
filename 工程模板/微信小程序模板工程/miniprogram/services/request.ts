import type { ApiResponse } from '../types/api'

const BASE_URL = 'https://example.com/api'

export function requestJson<T>(path: string, options: WechatMiniprogram.RequestOption = {}): Promise<T> {
  return new Promise((resolve, reject) => {
    wx.request<ApiResponse<T>>({
      ...options,
      url: `${BASE_URL}${path}`,
      header: {
        'content-type': 'application/json',
        ...(options.header || {})
      },
      success: (res) => {
        const body = res.data
        if (body.code === 'OK') {
          resolve(body.data)
          return
        }
        reject(new Error(body.message || '请求失败'))
      },
      fail: () => {
        reject(new Error('网络异常，请稍后重试'))
      }
    })
  })
}
