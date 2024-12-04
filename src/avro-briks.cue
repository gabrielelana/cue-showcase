#Money: avro.#Record & {
    type!: "record"
    name!: "Money"
    fields!: [{
        name!: "amount"
        type!: "int"
    }, {
        name!: "currency"
        type!: avro.#Enum & {
            name!: "Currency"
            symbols!: ["EUR"]
            default!: "EUR"
        }
    }]
}

#DateTime: avro.#Field & {
    name!: avro.#Name,
    type!: "string"
}

// ...
