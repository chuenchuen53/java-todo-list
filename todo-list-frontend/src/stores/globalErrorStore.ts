import { defineStore } from "pinia"
import { ref } from "vue"

export const useGlobalErrorStore = defineStore("globalError", () => {
  const errorMessage = ref<string>("")

  function setErrorMessage(message: string) {
    errorMessage.value = message
  }

  return {
    errorMessage,
    setErrorMessage
  }
})
