export interface UserInfoModel {
  id: string
  username: string
  displayName: string
}

export interface LoginRequestModel {
  username: string
  password: string
}

export interface LoginResponseModel {
  user: UserInfoModel
}
