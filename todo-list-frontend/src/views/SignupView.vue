<script setup lang="ts">
import { nextTick, ref } from "vue"
import { signup } from "../api/user"
import router from "@/router"

interface SuccessData {
  username: string
  password: string
}

const loading = ref(false)
const username = ref("")
const password = ref("")
const confirmPassword = ref("")
const errMsg = ref("")
const successData = ref<null | SuccessData>(null)
const modalLoginBtn = ref<null | HTMLButtonElement>(null)

const handleSubmit = async () => {
  const regex = /^[a-zA-Z0-9]+$/
  if (!regex.test(username.value) || !regex.test(password.value)) {
    errMsg.value = "Username and password must be alphanumeric"
    return
  }

  if (password.value !== confirmPassword.value) {
    errMsg.value = "Passwords do not match"
    return
  }

  try {
    loading.value = true
    const signupResult = await signup(username.value, password.value, confirmPassword.value)
    switch (signupResult) {
      case "success":
        errMsg.value = ""
        successData.value = { username: username.value, password: password.value }
        nextTick(() => {
          modalLoginBtn.value?.focus()
        })
        break
      case "Username is already registered":
        errMsg.value = signupResult
        break
    }
  } finally {
    loading.value = false
  }
}

const goLoginPage = () => {
  router.push("/login")
}
</script>

<template>
  <div id="signup-page" class="d-flex flex-column gap-2 mx-auto p-4">
    <form @submit.prevent="handleSubmit">
      <div id="signup-form-container" class="d-flex flex-column gap-2 mx-auto">
        <div class="h1">Signup</div>
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
        <input
          v-model="confirmPassword"
          :disabled="loading"
          type="password"
          class="form-control"
          placeholder="Confirm Password"
          required
        />
        <button :disabled="loading" class="btn btn-primary" type="submit">
          <span v-if="loading" class="spinner-border spinner-border-sm" role="status"></span>
          <span v-else>Signup</span>
        </button>
        <div v-if="errMsg" class="text-danger">{{ errMsg }}</div>
      </div>
    </form>

    <div class="text-end">
      <button :disabled="loading" @click="goLoginPage" class="btn btn-link">go login</button>
    </div>

    <div v-if="successData">
      <div class="modal-backdrop show"></div>
      <div class="modal d-flex justify-content-center" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <div class="modal-title fs-5">Success Signup</div>
            </div>
            <div class="modal-body grid-2x2">
              <div>Username:</div>
              <div>{{ successData.username }}</div>
              <div>Password:</div>
              <div>{{ successData.password }}</div>
            </div>
            <div class="modal-footer">
              <button ref="modalLoginBtn" @click="goLoginPage" class="btn btn-primary" type="button">go login</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
#signup-page {
  max-width: 375px;
}

.grid-2x2 {
  display: grid;
  grid-template-columns: 75px 1fr;
  gap: 1rem;
  width: 280px;
}
</style>
