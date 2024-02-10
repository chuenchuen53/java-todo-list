<script setup lang="ts">
import { onErrorCaptured } from "vue"
import { RouterView } from "vue-router"
import { useDark } from "@vueuse/core"
import GlobalErrorModal from "./components/GlobalErrorModal.vue"
import { useGlobalErrorStore } from "./stores/globalErrorStore"

const globalErrorStore = useGlobalErrorStore()

useDark({
  selector: "html",
  attribute: "data-bs-theme",
  valueDark: "dark",
  valueLight: "light"
})

onErrorCaptured((error) => {
  globalErrorStore.setErrorMessage(error.message)
  return true
})
</script>

<template>
  <RouterView />
  <GlobalErrorModal />
</template>
