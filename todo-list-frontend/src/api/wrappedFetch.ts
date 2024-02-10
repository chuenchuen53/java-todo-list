import router from "../router"

type Method = "GET" | "POST" | "PUT" | "DELETE"

const prefix = import.meta.env.VITE_API_URL + "/"

export async function wrappedFetch(url: string, method: Method, body?: Object): Promise<Response> {
  const response = await fetch(prefix + url, {
    method,
    headers: { "Content-Type": "application/json" },
    credentials: "include",
    body: body ? JSON.stringify(body) : undefined
  })
  if (response.status === 401) {
    router.push("/login")
  } else if (response.status === 400 || response.status === 404 || response.status === 500) {
    switch (response.status) {
      case 400:
        throw new Error("Bad request")
      case 404:
        throw new Error("Not found")
      case 500:
        throw new Error("Internal server error")
    }
  } else if (response.status === 200 || response.status === 204) {
    return response
  }
  throw new Error("Unhandled status code")
}
