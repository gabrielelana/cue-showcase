#OpenAPI: {
    openapi!: "3.1.0"
    info!: {
        title!:       string & !=""
        summary!:     string & !=""
        description!: string & !=""
        version!:     =~"^[0-9]+.[0-9]+.[0-9]+$"
    }
    servers!: [...#Server]
    paths!: [=~"^/.*$"]: #PathItem
    ...
}

#Server: {
    url!:         string & !=""
    description?: string
}

#PathItem: {
    summary?:     string
    description?: string
    [#Method]:    #Operation
    ...
}

#Operation: {
    tags?: [string & !=""]
    summary!:     string & !=""
    description?: string
    operationId!: string
    parameters?: [...#Parameter]
    requestBody?: #RequestBody
    responses?: [#ResponseStatusCode]: #Response
    deprecated?: bool | *false
    ...
}

// ...

// Also constraint not part of the specification but the specific
// domain/application

#ValidationError: {
    description: "Request validation error"
    content: {
        "application/problem+json": {
            schema: {
                type: "object"
                properites: {
                    status: {
                        type:  "number"
                        const: 400
                    }
                    type: type: "string"
                    code: {
                        type:  "string"
                        const: "REQUEST_VALIDATION_ERROR"
                    }
                    title: type: "string"
                    errors: {
                        type: "array"
                        items: {
                            type: "object"
                            properties: {
                                requestLocation: type: "string"
                                locationPath: type:    "string"
                                messages: {
                                    type: "array"
                                    items: type: "string"
                                }
                            }
                            required: ["requestLocation", "locationPath", "messages"]
                        }
                    }
                }
            }
            example: {
                status: 400
                code:   "REQUEST_VALIDATION_ERROR"
                title:  "Request Validation Error"
                errors: [{
                    requestLocation: "body"
                    locationPath:    "inc"
                    message: ["Expected number given string"]
                }]
            }
        }
    }
}
