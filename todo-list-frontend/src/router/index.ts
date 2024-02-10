import { createRouter, createWebHistory, type NavigationGuardNext, type RouteLocationNormalized } from "vue-router"
import HomeView from "../views/HomeView.vue"
import { isLogin } from "@/api/user"

async function redirectToHomeIfLogin(
  to: RouteLocationNormalized,
  from: RouteLocationNormalized,
  next: NavigationGuardNext
): Promise<void> {
  const result = await isLogin()
  if (result) {
    next({ name: "home" })
  } else {
    next()
  }
}

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      beforeEnter: async (to, from, next) => {
        const result = await isLogin()
        if (result) {
          next()
        } else {
          next({ name: "login" })
        }
      }
    },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      beforeEnter: redirectToHomeIfLogin
    },
    {
      path: "/signup",
      name: "signup",
      component: () => import("../views/SignupView.vue"),
      beforeEnter: redirectToHomeIfLogin
    }
  ]
})

export default router
