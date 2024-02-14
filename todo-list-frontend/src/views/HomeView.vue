<script setup lang="ts">
import UpdateTodoModal from "@/components/UpdateTodoModal.vue"
import DeleteIcon from "@/components/DeleteIcon.vue"
import EditIcon from "@/components/EditIcon.vue"
import { deleteTodo, getTodos, insertTodo, updateTodoDescription, updateTodoStatus, type Todo } from "@/api/todo"
import { logout } from "@/api/user"
import router from "@/router"
import { onMounted, ref } from "vue"
import { useGlobalErrorStore } from "@/stores/globalErrorStore"

const globalErrorStore = useGlobalErrorStore()

const initialized = ref(false)
const newTodoLoading = ref(false)
const newTodo = ref("")
const todos = ref<Todo[]>([])
const editingTodo = ref<null | Todo>(null)

onMounted(async () => {
  const result = await getTodos()
  todos.value = result
  initialized.value = true
})

async function handleLogout() {
  await logout()
  router.push("/login")
}

async function handleAddTodo(): Promise<void> {
  if (newTodo.value.trim() === "" || newTodo.value.length > 100) {
    globalErrorStore.setErrorMessage("Todo description must be between 1 and 100 characters")
    return
  }

  newTodoLoading.value = true
  try {
    const result = await insertTodo(newTodo.value)
    newTodo.value = ""
    todos.value.push(result)
  } finally {
    newTodoLoading.value = false
  }
}

async function handleToggleTodoStatus(todo: Todo): Promise<void> {
  try {
    await updateTodoStatus(todo.id, todo.completed)
  } catch (e) {
    todos.value = todos.value.map((t) => (t.id === todo.id ? { ...t, completed: !todo.completed } : t))
    throw e
  }
}

async function handleUpdateTodoDescription(todoId: number, newDescription: string): Promise<void> {
  if (newDescription.trim() === "" || newDescription.length > 100) {
    globalErrorStore.setErrorMessage("Todo description must be between 1 and 100 characters")
    return
  }

  await updateTodoDescription(todoId, newDescription)
  todos.value = todos.value.map((x) => (x.id === todoId ? { ...x, description: newDescription } : x))
  editingTodo.value = null
}

async function handleDeleteTodo(id: number): Promise<void> {
  await deleteTodo(id)
  todos.value = todos.value.filter((todo) => todo.id !== id)
}

function cancelUpdateTodoDescription(): void {
  editingTodo.value = null
}

function handleEditTodoClick(todo: Todo): void {
  editingTodo.value = todo
}
</script>

<template>
  <div id="home-page">
    <div class="fixed-top bg-body-tertiary">
      <div class="d-flex flex-row-reverse p-3 position-relative">
        <div class="h1 position-absolute top-50 start-50 translate-middle text-primary-emphasis">Todo List</div>
        <button type="button" class="btn btn-outline-primary" @click="handleLogout">logout</button>
      </div>
    </div>
    <main class="p-3 mx-auto">
      <form @submit.prevent="handleAddTodo">
        <div class="input-group mb-3">
          <input v-model="newTodo" type="text" class="form-control" placeholder="What do you need to do" />
          <button :disabled="newTodoLoading" class="btn btn-primary" type="submit">add</button>
        </div>
      </form>
      <div class="bg-body-tertiary p-3 rounded">
        <div v-if="!initialized">
          <p class="placeholder-glow px-3">
            <span class="placeholder col-12"></span>
            <span class="placeholder col-8"></span>
            <span class="placeholder col-7"></span>
          </p>
        </div>
        <div v-else-if="todos.length === 0">
          <div class="alert alert-light" role="alert">No todos yet</div>
        </div>
        <div v-else class="d-flex flex-column-reverse">
          <div v-for="todo in todos" :key="todo.id" class="d-flex align-items-start mb-3">
            <div class="mh40 d-flex align-items-center">
              <input
                @change="handleToggleTodoStatus(todo)"
                type="checkbox"
                v-model="todo.completed"
                class="form-check-input mt-0"
              />
            </div>
            <div
              class="w-100 mh40 mx-3 d-flex py-2 border-bottom border-light-subtle text-break"
              :class="todo.completed && 'text-body-tertiary text-decoration-line-through'"
            >
              {{ todo.description }}
            </div>
            <div class="d-flex mh40 gap-1 align-content-center py-1">
              <button @click="handleEditTodoClick(todo)" class="btn btn-outline-primary btn-sm mr-2" type="button">
                <EditIcon />
              </button>
              <button @click="handleDeleteTodo(todo.id)" class="btn btn-outline-danger btn-sm" type="button">
                <DeleteIcon />
              </button>
            </div>
          </div>
        </div>
      </div>
    </main>
    <UpdateTodoModal
      v-if="editingTodo"
      :id="editingTodo.id"
      :description="editingTodo.description"
      :on-canceled="cancelUpdateTodoDescription"
      :on-submit="handleUpdateTodoDescription"
    />
  </div>
</template>

<style scoped>
#home-page main {
  margin-top: 70px;
  max-width: 768px;
}

.mh40 {
  min-height: 40px;
}
</style>
