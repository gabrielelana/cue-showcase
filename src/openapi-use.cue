oas.#OpenAPI

info: {
    version: "0.0.1"
    title:   "MyApp OpenAPI Specification"
    summary: "MyApp OpenAPI Specification"
    description: """
                 My App OpenAPI Specification
                 """
}

// NOTE: you can define special constraints for your domain
paths: [Route=string]: [oas.#Method]: responses: "500": oas.#UnhandledError
paths: [Route=string]: [oas.#Method]: responses: "503": oas.#ServiceNotAvailableError
paths: [Route=string]: post: responses: "400": oas.#ValidationError

paths: {
    "/ping": "get":                           #Ping
    "/users/login": "post":                   #UserLogin
    "/me/sessions/latest/{n}": "get":         #LatestSessions
    "/me/sessions/between/{range}": "get":    #SessionsBetweenDays
    "/me/check-in": "post":                   #CheckIn
    "/me": "get":                             #Me
}

#Me: {
    operationId: "Me"
    summary:     "Retrieve personal information."
    responses: {
        "200": {
            description: "Current user personal information."
            content: {
                "application/json": {
                    schema: #MeResultBodyOk
                }
            }
        }
        "400": oas.#ValidationError
        "401": oas.#AuthenticationError
        "500": oas.#UnhandledError
        "503": oas.#ServiceNotAvailableError
    }
}

// ...
