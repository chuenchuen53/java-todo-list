<script setup lang="ts">
import { useGlobalErrorStore } from "@/stores/globalErrorStore"

const globalErrorStore = useGlobalErrorStore()

const onCanceled = () => {
  globalErrorStore.setErrorMessage("")
}
</script>

<template>
  <div v-if="globalErrorStore.errorMessage !== ''">
    <div class="modal-backdrop show"></div>
    <div class="modal d-flex justify-content-center" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title text-danger">Error</h5>
            <button
              @click="onCanceled"
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <p>{{ globalErrorStore.errorMessage }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.modal-body {
  min-width: 300px;
}
</style>
