<script setup lang="ts">
import { ref } from "vue"
import { login } from "../api/user"
import router from "@/router"

const loading = ref(false)
const username = ref("")
const password = ref("")
const errMsg = ref("")

const handleSubmit = async () => {
  const regex = /^[a-zA-Z0-9]+$/
  if (!regex.test(username.value) || !regex.test(password.value)) {
    errMsg.value = "Username and password must be alphanumeric"
    return
  }

  try {
    loading.value = true
    const loginSuccess = await login(username.value, password.value)
    if (loginSuccess) {
      errMsg.value = ""
      router.replace("/")
    } else {
      errMsg.value = "Username or password is incorrect"
    }
  } finally {
    loading.value = false
  }
}

const goSignupPage = () => {
  router.push("/signup")
}
</script>

<template>
  <div id="login-page" class="d-flex flex-column gap-2 mx-auto p-4">
    <form @submit.prevent="handleSubmit">
      <div class="d-flex flex-column gap-2 mx-auto">
        <div class="h1">Login</div>
        <input
          v-model="username"
          :disabled="loading"
          class="form-control"
          type="text"
          placeholder="Username"
          required
        />
        <input
          v-model="password"
          :disabled="loading"
          class="form-control"
          type="password"
          placeholder="Password"
          required
        />
        <button :disabled="loading" class="btn btn-primary" type="submit">
          <span v-if="loading" class="spinner-border spinner-border-sm" role="status"></span>
          <span v-else>Login</span>
        </button>
        <div v-if="errMsg" class="text-danger">{{ errMsg }}</div>
      </div>
    </form>
    <div class="text-end">
      <button :disabled="loading" @click="goSignupPage" class="btn btn-link">go signup</button>
    </div>
  </div>
</template>

<style scoped>
#login-page {
  max-width: 375px;
}
</style>
