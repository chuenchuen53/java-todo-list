<script setup lang="ts">
import { ref } from "vue"

const props = defineProps<{
  id: number
  description: string
  onCanceled: () => void
  onSubmit: (id: number, description: string) => Promise<void>
}>()

const newDescription = ref(props.description)
</script>

<template>
  <div>
    <div class="modal-backdrop show"></div>
    <div class="modal d-flex justify-content-center" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Update todo</h5>
            <button
              @click="onCanceled"
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <form @submit.prevent="onSubmit(id, newDescription)">
            <div class="modal-body">
              <input
                id="update-todo-input"
                v-model="newDescription"
                type="text"
                class="form-control"
                placeholder="Description"
                required
              />
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
#update-todo-input {
  width: 300px;
}
</style>
