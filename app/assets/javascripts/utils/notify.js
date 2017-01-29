export function apiError(data) {
  error("API failure. Please find more details in JS console", data)
}

export function error(message, details) {
  console.error("API FAILURE", details)
  alert(message)
}
