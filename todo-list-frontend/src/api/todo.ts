import { wrappedFetch } from "./wrappedFetch"

export interface Todo {
  id: number
  description: string
  isCompleted: boolean
  modifiedAt: Date
}

type GetTodoResult = Todo[]
type InsertTodoResult = Todo
type UpdateTodoResult = "success"
type DeleteTodoResult = "success"

type UpdateTodoBody =
  | {
      id: number
      description: string
    }
  | {
      id: number
      isCompleted: boolean
    }

const url = "todo"

export async function getTodos(): Promise<GetTodoResult> {
  const response = await wrappedFetch(url, "GET")
  return await response.json()
}

export async function insertTodo(description: string): Promise<InsertTodoResult> {
  const response = await wrappedFetch(url, "POST", { description })
  return await response.json()
}

async function updateTodo(body: UpdateTodoBody): Promise<UpdateTodoResult> {
  await wrappedFetch(url, "PUT", body)
  return "success"
}

export async function updateTodoDescription(id: number, description: string): Promise<UpdateTodoResult> {
  return await updateTodo({ id, description })
}

export async function updateTodoStatus(id: number, isCompleted: boolean): Promise<UpdateTodoResult> {
  return await updateTodo({ id, isCompleted })
}

export async function deleteTodo(id: number): Promise<DeleteTodoResult> {
  await wrappedFetch(`${url}?todoId=${id}`, "DELETE")
  return "success"
}
