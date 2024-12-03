// single value, single source of truth
servicePort: 3000

// will be exported as environment variable
environment: {
    PORT: servicePort
}

// will be exported as JSON configuration file
configuration: {
    port: servicePort
}
