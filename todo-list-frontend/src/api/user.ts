import { wrappedFetch } from "./wrappedFetch"

interface IsLoginResp {
  isLogin: boolean
}

interface LoginResp {
  success: boolean
}

interface SignupResp {
  message: SignupResult
}

type SignupResult = "success" | "Username is already registered"

export async function isLogin(): Promise<boolean> {
  const response = await wrappedFetch("login", "GET")
  const data: IsLoginResp = await response.json()
  return data.isLogin
}

export async function login(username: string, password: string): Promise<boolean> {
  const response = await wrappedFetch("login", "POST", { username, password })
  const resp: LoginResp = await response.json()
  return resp.success
}

export async function logout(): Promise<void> {
  await wrappedFetch("logout", "POST")
}

export async function signup(username: string, password: string, confirmPassword: string): Promise<SignupResult> {
  const response = await wrappedFetch("signup", "POST", { username, password, confirmPassword })
  const data: SignupResp = await response.json()
  return data.message
}
